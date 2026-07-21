#show raw.where(lang: "idris"): set raw(
  syntaxes: "../../doc/cs5099/dis/idris.sublime-syntax",
)

= Implementation

```idris
module System.ScopedIO

import Data.Bits
import Data.List
import Data.List.Elem
import Data.List.Quantifiers
import Data.List1
import Data.String
import Data.Vect
import System
```

== Defining the valid C types

Idris has builtin support for some of the types that naturally
translate to C:
- fixed, signed and unsigned integers
- `Double` precision floating point numbers

The following description only considers `Int` for brevity. Additionally,
an opaque `Float` needs to be defined for descriptive purposes, but
it is marshalled from and unmarshalled to `Double` on the Idris side
(more on this later).

```idris
public export
data Float : Type where
```

TODO: `Ptr`

Next, compound types `Struct` and `Array` are defined using dependent types.
A `CArray` is defined by an integer number of elements and the type of those
elements (footnote: the type is named `CArray` because `Array` is the canonical
name for a similar but pure-idris concept and the back-end handling of
FFI-crossable types depends only on the name of the type; support for
this has not made it to the mainline compiler):

```idris
public export
data CArray : Int -> Type -> Type where
```

A `Struct` is defined by a string name and a list of fields which
consist of the string names and types:

```idris
-- This type already exists in System.FFI
public export
data Struct : String -> List (String, Type) -> Type where [external]
```

Note that the type of a field can be anything, not just
a C type (eg. a function, a dependent type, etc.). In order
to limit which types are supported C types an indexed data
type can be used:

```idris
public export
data CType : Type -> Type

public export
data FFIFn : Type -> Type where
  CFReturn     : CType t -> FFIFn (PrimIO t)
  CFReturnVoid : FFIFn (PrimIO ())
  CFParam : CType t -> FFIFn rest -> FFIFn (t -> rest)
```

This will have a couple interpretations:
- `CType a` is the universe of types that I've defined are valid in both
  Idris and C
- a `CType a` is a proof that some Idris type `a` is representable in C

The former is important because it highlights the subjectivity of
these choices and that that this is "just another type" in the eyes of the
type checker. Meaning that,
as will be demonstrated, no special-casing or hardcoding of these types
within the compiler is needed for (de)allocation, reading, or writing to
their values. (footnote: the sizes of these types still needs to be
hardcoded and made accessible somewhere but this is a much simpler
task than eg. normalizing and evaluating `CType` within the compiler
https://idris2.readthedocs.io/en/latest/backends/backend-cookbook.html#foreign-types)
(footnote: it may be needed for building FFI calls; TODO).

The latter interpretation reflects the general usage of `CType` within the
codebase, and provides a better plain-English understanding of `CType`.

Starting from the basics, the constructors for `CType` are:

```idris
data CType : Type -> Type where
  CInt : CType Int
  CFloat  : CType Float
  CDouble : CType Double
```


`CInt` is a proof that `Int` has a C representation,
`CFloat` is a proof that `Float` has a C representation,
and `CDouble` is a proof that `Double` has a C representation, etc.
The utility of this proof can be seen in the following `CType`:

/* idris
  CBool : CType Bool

  CInt8  : CType Int8
  CInt16 : CType Int16
  CInt32 : CType Int32
  CInt64 : CType Int64

  CBits8  : CType Bits8
  CBits16 : CType Bits16
  CBits32 : CType Bits32
  CBits64 : CType Bits64

*/

```idris
  CPtr     : CType t -> CType (Ptr t)
  CVoidPtr : CType AnyPtr
  CFnPtr  : FFIFn t -> CType (Ptr t)
```
TODO: explain CVoidPtr


`CPtr` uses `CType` recursively to say "given a type `t` with
a C representation, `Ptr t` has a C representation. This is
used similarly for arrays, with the additional `Int` needed
for the array's length:

```idris
  CCArray : (n : Int) -> CType t -> CType (CArray n t)
```

`Struct` looks more complicated, but follows the same principle.


```idris
  -- the versions with the . operator plays nicer with the typechecker
  -- but the meaning is the same as
  -- CStruct : All (\(fname, t) => CType t) fields -> CType (Struct name fields)
  CStruct : All (CType . Builtin.snd) fields -> CType (Struct name fields)
```

Rather than a single other `CType t`, all of a `Struct`'s fields
need to have C representations. This is done using a
`Data.List.Quantifiers.All`. In mathematical language,
the type `All p l` is a list of different propositions and a
value of such type is a list of proofs for those propositions.
(TODO: note about this exact formulation of all?)
Thus, in `CStruct`, given proofs that all the types of a struct's
fields is representable in C, then the struct itself is
representable in C.

== Allocation

Allocation's require some support from backend, specifically
calling the standard library function `malloc(3)`.

```idris
%foreign "scheme:foreign-alloc"
prim__malloc : Int64 -> PrimIO AnyPtr
```

This simply allocates a specified amount of memory, but we'd like
something more in the shape of:


```idris
alloc : (repr : CType a) -> IO (Ptr a)
```

Going from `PrimIO AnyPtr` to `IO (Ptr a)` is matter of calling
`primIO` and `prim__castPtr`; so what's needed is `CType a -> Int`,
attentive readers may recognize this as a familiar compiler builtin:

```idris
sizeof : (repr : CType a) -> Int64
```

Assuming modern 64-bit system and normal compiler (footnote: see above footnote
about hardcoding values, one potential solution is providing pragmas for
non-portably sized types `int`, `char`, pointers, etc.), implementing
this should be straightforward for most `CType`s. The one
exception is `CStruct`, where alignment and padding need to be considered.
The details are out of scope here, but the short version is that values
need to be on integer multiples of their sizes, and this alignment
needs to be preserved within arrays. Thus, `alignof` is also needed.

```idris
alignof : (repr : CType a) -> Int64
```

/* idris
alignof CInt       = 4
alignof CFloat     = 4
alignof CDouble    = 8
alignof CBool      = 1
alignof CInt8      = 1
alignof CInt16     = 2
alignof CInt32     = 4
alignof CInt64     = 8
alignof CBits8     = 1
alignof CBits16    = 2
alignof CBits32    = 4
alignof CBits64    = 8
alignof (CPtr _)   = 8
alignof (CVoidPtr) = 8
alignof (CFnPtr _) = 8
alignof (CCArray _ repr) = alignof repr
alignof (CStruct reprs)  = go reprs 1
  where
  go : All (CType . Builtin.snd) fields' -> Int64 -> Int64
  go Nil aln = aln
  go (x::xs) aln = go xs (max aln $ alignof x)

sizeof CInt             = 4
sizeof CFloat           = 4
sizeof CDouble          = 8
sizeof CBool            = 1
sizeof CInt8            = 1
sizeof CInt16           = 2
sizeof CInt32           = 4
sizeof CInt64           = 8
sizeof CBits8           = 1
sizeof CBits16          = 2
sizeof CBits32          = 4
sizeof CBits64          = 8
sizeof (CPtr _)         = 8
sizeof (CVoidPtr)       = 8
sizeof (CFnPtr _)       = 8
sizeof (CCArray n repr) = (cast n) * sizeof repr
sizeof (CStruct reprs)  =
  fst $ go reprs (0, 1)
  where
  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/include/ffi_common.h#L118
  doAlign : Int64 -> Int64 -> Int64
  doAlign v a = ((v-1) .|. (a-1))+1

  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/src/prep_cif.c#L38
  go : All (CType . Builtin.snd) fields' -> (Int64, Int64) -> (Int64, Int64)
  go Nil (siz, aln) = (doAlign siz aln, aln) -- add padding to the end of the struct
  go (x::xs) (siz, aln) =
    let alnx = alignof x
    in go xs
      ( (+)                -- the current total size is the sum of
        (doAlign siz alnx) -- * padding after previous field
        (sizeof x)         -- * size of this field
      , max aln alnx       -- maximum alignment
      )
*/

Finally:

```idris
alloc repr = map prim__castPtr $ primIO $ prim__malloc (sizeof repr)
```

And for completeness, `free` is trivial

```idris
%foreign "scheme:foreign-free"
prim__free : AnyPtr -> PrimIO ()

free : Ptr a -> IO ()
free ptr = primIO $ prim__free $ prim__forgetPtr ptr
```

== Memory safety with lifetimes

Now that memory can be allocated, the type system can be used
to make sure this is done safely and correctly. Lifetimes, as described
herein, avoid a form of unsafe behavior known as "use-after-free".
Use-after-free bugs are a common cause of security vulnerabilities
(TODO: citation needed). Additionally the scope pattern avoids
memory leaks, that is forgetting to release memory back to the
allocator such that the program consumes more and more memory
which could be recycled. This is not necessarily a safety
problem, but an equally difficult problem to address.

Another unsafe behavior, accessing uninitialized memory, is addressed
by `Marshal` in the following section.

---

After allocation and initialization, memory that is no longer used needs to
be deallocated and returned to
the operating system with the `free(3)` system call. Further, after
the call to `free` the pointer should not be read from or written to,
doing so is known as "use-after-free" (footnote: a future call to `malloc`
can return a pointer to the same address, but whether the original
and new pointers are considered the same depends on the memory
model; a related issue is pointer provenance)

The design takes inspiration from Rust where "references"
are pointers with an associated lifetime. Rust's lifetimes are a special
construct within the type system with different behavior and usage from normal
datatypes. In this library, `Lifetime`s are be modeled as a plain data type;
and the `Ref` type thus a dependent type with a `Lifetime` value as well
as the pointed-to `Type`.

```idris
-- constructors defined later
public export
data Lifetime : Type

public export
data Ref : Lifetime -> Type -> Type where [external]
```

In `Ref`, `[external]` tells the compiler that `Ref` is an
opaque type which may be constructed. Otherwise, the compiler
assumes a `Ref` value will never exist since it has no constructors,
which may lead to code being optimized away. Rather than a
constructor, an `%unsafe` function with `believe_me` is used;
this prevents proof search from using it and further communicates
to users they should think twice about using the functions.

```idris
export
%unsafe
unsafeRefPtr : Ref a' t -> Ptr t
unsafeRefPtr = believe_me

export
%unsafe
unsafePtrRef : Ptr t -> Ref a' t
unsafePtrRef = believe_me
```

=== ST

The underlying mechanism for scopes in this library comes from the `ST`
type (@st-monad). It describes mutable computation within a pure
language by using some type magic to limit where mutation of
needed values will happen.

```idris
data ST : (s : Type) -> (a : Type) -> Type where
  MkSt : (s -> (a, s)) -> ST s a

data STRef : (s : Type) -> (a : Type) -> Type where
  MkRef : (s : Type) -> a -> STRef s a

newSTRef   : a -> ST s (STRef s a)
readSTRef  : STRef s a -> ST s a
writeSTRef : STRef s a -> a -> ST s ()

runST : ({ s : Type } -> ST s a) -> a
```

`ST` consists of a function that takes some state `s` and returns
a result `a` along with some, possibly new, state `s`. Mutable
values live inside an `STRef`, note that it also has with an associated
state type `s` but no values of `s`. The reason for this makes sense
considering the `new`, `read`, and `write` functions, the
`s` of `STRef` they operate on and the `ST` they produce must
be the same. Meaning, an `STRef` created within `ST s1` cannot be
used within `ST s2`.

Further, consider `runST` the type of `runST` (the function which gets
the result out of `ST`): `{ s : Type } -> ST s a` means the `ST` needs to work
for _all_ possible state types `s`. Said another way, `runST` determines what the
`s` should be for the `ST` and consequently for all the `STRef`s
it creates; thus an `STRef` for one invocation of `runST`
cannot be used for another.  Consider the following example:

```idris
failing "When unifying"
  testRunSTBad : Int
  testRunSTBad = runST $ readSTRef (runST $ newSTRef 2)
```

`runST $ newSTRef 2` returns a `STRef SomeS Int`, where `SomeS` is
a specific type originating from `runST`. `readSTRef`
then assumes this type for its output `ST SomeS Int`. But the
outer `runST` needs an `ST` that works for _all_ possible `s`
while the one provided only works for `SomeS`.
While `STRef` is able to escape the `runST` invocation
it is only usable within the invocation. (footnote:
what I refer to as an "in (footnote: What I refer to as an "invocation
of `runST`" is called a "thread" in the literature,
not to be confused with a "thread" used for concurrency),

With this understanding, a simplified version of a scope can
be defined. `Lifetime` takes the place of `s` and the computation
inside `Scope` accumulates pointers and a result `a`.

```idris
data SimpleScope : Lifetime -> Type -> Type where
  MkScope : (Unit -> (List AnyPtr, a)) -> SimpleScope s a

newRefScope  : a -> SimpleScope s (Ref s a)
readRefScope : Ref s a -> SimpleScope s a

runScope : ((s : Lifetime) -> SimpleScope s a) -> a

runSubScope : (s : Lifetime) -> ((s' : Lifetime) -> SimpleScope s' a) -> a
```

This simplified formulation highlights the similarities to `ST`
but is missing two major aspects: allocation and deallocation require `IO`,
the `a`s should somehow be related to `CType`. The former can quickly be addressed
as it's needed for the next section, `Marshal` which addresses the latter.

```idris

ScopedIOState = List (IO ())

export
data ScopedIO : Lifetime -> Type -> Type where
  MkScopedIO : IO (Pair ScopedIOState a) -> ScopedIO a' a

export
runScopedIO :
  HasIO io =>
  ((0 a' : Lifetime) -> ScopedIO a' a) ->
  io a

-- can be ignored, these inherit properties of IO which make the computations
-- easier to compose
export
Functor (ScopedIO a')

export
Applicative (ScopedIO a')

export
Monad (ScopedIO a')

export
HasIO (ScopedIO a')
```

/* idris
-- NOTE: can't defined runScopedIO yet because Lifetime constructors
-- haven't been defined

Functor (ScopedIO a') where
  map f (MkScopedIO x) = MkScopedIO $ map f <$> x

Applicative (ScopedIO a') where
  pure x = MkScopedIO $ pure $ pure x

  (<*>) (MkScopedIO f) (MkScopedIO sf) = MkScopedIO [| f <*> sf |]

Monad (ScopedIO a') where
  join (MkScopedIO x) = MkScopedIO $ do
    (state', MkScopedIO x') <- x
    (state'', x'') <- x'
    pure (state'' <+> state', x'')

HasIO (ScopedIO a') where
  liftIO x = MkScopedIO $ map (neutral,) x
*/

However, for the rest of this section the simplified version will be used for brevity.
It should also be noted that, `s` was used in this example for clarity but
conventionally variable names of the form `a'`, `b'`, etc. will be used for `Lifetime`s;
this follows the Rust `'a` form.

TODO:

```idris
defer : IO () -> ScopedIO a' ()
defer f = MkScopedIO $ pure ([f], ())
```

```idris
allocScoped : (repr : CType a) -> ScopedIO a' (Ptr a)
allocScoped repr = do
  addr <- liftIO $ alloc repr
  defer $ primIO $ prim__free $ prim__forgetPtr addr
  pure addr
```

=== Subscopes

One notable difference of `SimpleScope` from `ST` is the `runSubScope` function
which creates a sub-scope from a parent scope. A desired feature is
then for `readRefScope` to be able to read a reference from
the parent scope `Ref s a` and return a value in the smaller
scope `SimpleScope s' a`. That is, reference with a longer lifetime
should be allowed in places where a lifetime with a shorter lifetime
is needed (footnote: the real story is more nuanced once variance is
considered @rust-subtyping-variance). As formulated, this will not work.
Further, in Rust this is modeled using subtyping, a notoriously troublesome
(@ml-overload-undecidable, TODO: check this reference @subtype-undecidable),
type system feature which Idris avoids. In Idris, this relationship will
have to be modeled explicitly using, you guessed it, dependent types.

Firstly, `Lifetime` needs to be fully defined. It behaves similarly to `s`, so it
needs to carry a `Type` that can be quantified over. However, it can
be created in two ways in a "root" scope from `runScope` or as a
sub-scope in `runSubScope`. The latter needs to carry its parent scope
as proof that it is indeed a sub scope.

```idris
data Lifetime : Type where
  LRoot : (0 thr : Type) -> Lifetime
  LSub  : (0 thr : Type) -> (0 _ : Lifetime) -> Lifetime
```

This models the creation of the subscopes, but it is not enough
to describe the relationship as a constraint in the type level.
That is, a type describing a proposition is needed. The proposition
is that a lifetime `a'` lives as long as another lifetime `b'`.

```idris
public export
data AtLeastAsLong : Lifetime -> Lifetime -> Type where
```

There two trivial cases:
- if `a'` and `b'` are actually the same lifetime, then they live as
  themselves
- if `a'` is a direct parent of `b'`, that is `b' = LSub _ b'` then
  `a'` does live as long as `b'`

```idris
  ALALSame   : AtLeastAsLong a' a'
  ALALParent : AtLeastAsLong a' (LSub b a')
```

And one non-trivial case: the relationship is transitive, if `a'` lives as long
as `b'` and `b'` lives as long as `c'`, then `a'` lives as long as `c'`. This
should be implemented directly as:

TODO: hack not needed

```idris
  ALALTrans  : AtLeastAsLong a' b' -> AtLeastAsLong b' c' -> AtLeastAsLong a' c'
```

But there's a bug in the compiler (TODO: minimize and open issue for this)
that results in an infinite loop when doing proof search. To work around this,
`ALALTrans` is defined as:

  ```idris
    ALALTrans  : AtLeastAsLong a' (LSub b a') -> AtLeastAsLong (LSub b a')  c' -> AtLeastAsLong a' c'

  export
  %hint
  0 alalTrans : AtLeastAsLong a' b' -> AtLeastAsLong b' c' -> AtLeastAsLong a' c'
  ```

An improved version of `readRefScope` can then use an auto-implicit
`AtLeastAsLong` as proof that the lifetime of the reference lives
as long as the scope it's computing.

```idris
readRefScope' :
  Ref a' a ->
  { auto p : AtLeastAsLong a' b' } ->
  SimpleScope b' a
```

Lastly, an `AtLeastAsLong` needs to be provided by `runSubScope` to the function
that generates the subscope.

```idris
runSubScope' :
  (0 a' : Lifetime) ->
  ((0 b' : Lifetime) -> { p : AtLeastAsLong a' b' } -> SimpleScope b' a) ->
  SimpleScope a' a
```

And similarly for `ScopedIO`.

```idris
export
runSubScopedIO :
  (0 a' : Lifetime) ->
  (
    (0 b' : Lifetime) ->
    { 0 p : AtLeastAsLong a' b' } ->
    ScopedIO b' a
  ) ->
  ScopedIO a' a

export
runSubScopedIO' :
  (0 a' : Lifetime) ->
  (
    (0 b' : Lifetime) ->
    (0 p : AtLeastAsLong a' b') ->
    ScopedIO b' a
  ) ->
  ScopedIO a' a
runSubScopedIO' a' f = runSubScopedIO a' f'
  where
  f' : (0 b' : Lifetime) -> { 0 p : AtLeastAsLong a' b' } -> ScopedIO b' a
  f' b' = f b' p
```

/* idris
runScopedIO f = liftIO $ do
  let MkScopedIO f' = f $ LRoot Void
  (cleanup, ret) <- f'
  _ <- sequence cleanup
  pure ret


runSubScopedIO a' f = do
  let MkScopedIO f' = f (LSub Void a') { p = ALALParent }
  (cleanup, ret) <- liftIO f'
  _ <- liftIO $ sequence cleanup
  pure ret
*/

---


== Marshalling and unmarshalling

In the previous section, read and write operations were given without
justification. In `ST`, the values can simply live in the host language.
However, for the purposes of this library reads and writes face two
issues:
- access to fine grained, assembly style memory loads and stores
- encoding and decoding values from the host language to a C-like
  representation

Together this is the problem of marshaling and unmarshalling values
between the host language and C. Marshaling refers to the direction
from the host language into C, while unmarshalling is the reverse.

=== Fine grained memory access

Firstly, compiler primitives for fine grained memory access needs
to be implemented in the back end. The primitives described here
are intended to be minimal for ease of implementation. They are,
functions for reading and writing register-sized values
to memory; a single function for pointer arithmetic; and
functions for reading the raw bits of floating point values.


The pointer read and write functions have the following form
with values 8, 16, 32, and 64 for `N`. (footnote:
pointer reads are defined here to have side effects,
this was chosen arbitrarily, but one may argue the opposite "it's only reading
not mutating" but equally true is that "invalid pointer reads trigger
interrupts")

  ```idris
  prim__ptrWriteN : AnyPtr -> BitsN -> PrimIO Int64
  prim__ptrReadN : AnyPtr -> PrimIO BitsN
  ```

Next, pointer arithmetic is simply addition. (footnote: there may
be other formulations of this eg. functions that directly
convert a pointer to an integer). Notably, it explicitly uses
`Int64`; this can safely be optimized away into smaller bit-widths
on smaller architectures.

```idris
%foreign "scheme: (lambda (a b) (+ a b))"
prim__offsetPtr : AnyPtr -> Int64 -> AnyPtr
```

/* idris
cgPtrWrite : Int -> String
cgPtrWrite bits = """
scheme:
(lambda (ptr value)
  (foreign-set! 'unsigned-\{ show bits } ptr 0 value)
  \{ show $ bits `div` 8 }
)
"""

%foreign (cgPtrWrite 8)
prim__ptrWrite8 : AnyPtr -> Bits8 -> PrimIO Int64

%foreign (cgPtrWrite 16)
prim__ptrWrite16 : AnyPtr -> Bits16 -> PrimIO Int64

%foreign (cgPtrWrite 32)
prim__ptrWrite32 : AnyPtr -> Bits32 -> PrimIO Int64

%foreign (cgPtrWrite 64)
prim__ptrWrite64 : AnyPtr -> Bits64 -> PrimIO Int64


cgPtrRead : Int -> String
cgPtrRead bits = """
scheme:
(lambda (ptr) (foreign-ref 'unsigned-\{ show bits }  ptr 0))
"""

%foreign (cgPtrRead 8)
prim__ptrRead8 : AnyPtr -> PrimIO Bits8

%foreign (cgPtrRead 16)
prim__ptrRead16 : AnyPtr -> PrimIO Bits16

%foreign (cgPtrRead 32)
prim__ptrRead32 : AnyPtr -> PrimIO Bits32

%foreign (cgPtrRead 64)
prim__ptrRead64 : AnyPtr -> PrimIO Bits64
*/

Lastly, functions for getting the underlying bits out of floats and pointers.
Note that this not a `cast` which truncates a single-precision float `1.1` into
`1`, rather it should reinterpret the bytes into the 32 bit int `1066192077`.

  ```idris
  prim__SingleToBits : Double -> Bits32
  prim__DoubleToBits : Double -> Bits64

  prim__SingleFromBits : Bits32 -> Double
  prim__DoubleFromBits : Bits64 -> Double

  prim__PtrToBits : AnyPtr -> Bits64
  prim__PtrToBits = believe_me

  prim__PtrFromBits : Bits64 -> AnyPtr
  prim__PtrFromBits = believe_me
  ```

/* idris
%foreign """
scheme:
(lambda (x)
  (let
    ([ptr (foreign-alloc (ftype-sizeof float))])
    (foreign-set! 'single-float ptr 0 x)
    (let
      ([ret (foreign-ref 'unsigned-32 ptr 0)])
      (foreign-free ptr)
      ret
    )
  )
)
"""
prim__SingleToBits : Double -> Bits32

%foreign """
scheme:
(lambda (x)
  (let
    ([ptr (foreign-alloc (ftype-sizeof double))])
    (foreign-set! 'double-float ptr 0 x)
    (let
      ([ret (foreign-ref 'unsigned-64 ptr 0)])
      (foreign-free ptr)
      ret
    )
  )
)
"""
prim__DoubleToBits : Double -> Bits64

%foreign """
scheme:
(lambda (x)
  (let
    ([ptr (foreign-alloc (ftype-sizeof float))])
    (foreign-set! 'unsigned-32 ptr 0 x)
    (let
      ([ret (foreign-ref 'single-float ptr 0)])
      (foreign-free ptr)
      ret
    )
  )
)
"""
prim__SingleFromBits : Bits32 -> Double

%foreign """
scheme:
(lambda (x)
  (let
    ([ptr (foreign-alloc (ftype-sizeof double))])
    (foreign-set! 'unsigned-64 ptr 0 x)
    (let
      ([ret (foreign-ref 'double-float ptr 0)])
      (foreign-free ptr)
      ret
    )
  )
)
"""
prim__DoubleFromBits : Bits64 -> Double

prim__PtrToBits : AnyPtr -> Bits64
prim__PtrToBits = believe_me

prim__PtrFromBits : Bits64 -> AnyPtr
prim__PtrFromBits = believe_me
*/

=== The `Marshal` type

These primitives don't provide many safety guarantees and don't compose very
well. The lifetimes above can be used to create a safe and
composable `Marshal` type:

```idris
data Marshal : Lifetime -> ity -> cty -> Type where
  MkMarshal : { auto repr : CType cty } -> (ity -> Ptr cty -> IO Int64) -> Marshal a' ity cty
```

A `Marshal a' ity cty` holds a function that can marshal the Idris type `ity`
(which can depend on `a'`, that is have a lifetime of `a'`) into the C type
`cty`. One might expect `repr : CType cty` to be necessary for `Marshal` but pushing
the constraint to the constructor makes the type easier to work with. The single constructor
takes the `repr` proof instead, and the actual function for
doing the marshalling, `ity -> Ptr cty -> IO Int`. Another unexpected detail
is that the marshaling function takes a `Ptr` instead of a `Ref` even though
the lifetime is available. This is because an
implementation of `Marshal` would immediately use `unsafeRefPtr` to get a `Ptr`
anyways so not much protection is happening.

The use of the lifetime on `Marshal` has two purposes. On the caller side, `newRef`, `writeRef`,
can tie the `Marshal` lifetime to the output `ScopedIO` and `Ref` lifetimes. On the
implementation side, `Marshal` for `Ref` can have their lifetimes tied. Without
the lifetime a `Marshal` instance for `Ref` would work for a `ScopedIO` of any
lifetime.

```idris
export
writeRef :
  { auto marshal : Marshal a' ity cty } ->
  ity ->
  Ref a' cty ->
  ScopedIO a' Int64
writeRef @{ MkMarshal f } x ptr = liftIO $ f x (unsafeRefPtr ptr)

export
newRef : ity -> { auto marshal : Marshal a' ity cty } -> ScopedIO a' (Ref a' cty)
newRef init = do
  let MkMarshal { repr } _ = marshal
  ptr <- liftIO $ alloc repr
  _ <- writeRef { marshal } init (unsafePtrRef ptr)
  pure $ unsafePtrRef ptr
```

Implementing a `Marshal` is straightforward for base types, the code below has
some noise to appease the type system, but it boils down to writing to a pointer (`prim__ptrWrite`).

```idris
export
%hint
marshalInt : Marshal a' Int Int
marshalInt = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)
```


And, through the magic of proof search, `newRef` can be called without
needing to mention `marshalInt`.

```idris
testNewRefInt : ScopedIO a' (Ref a' Int)
testNewRefInt = newRef (the Int 25)
```

And here's how the lifetime on `Marshal` is used when marshaling `Ref` into a `Ptr`.

```idris
export
%hint
marshalRef : { repr : CType t } -> Marshal a' (Ref a' t) (Ptr t)
marshalRef = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64
      (prim__forgetPtr ptr)
      (prim__PtrToBits $ prim__forgetPtr $ unsafeRefPtr x)
```


/* idris
export
%hint
marshalFloat : Marshal a' Double Float
marshalFloat = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast $ prim__SingleToBits x)

export
%hint
marshalDouble : Marshal a' Double Double
marshalDouble = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (prim__DoubleToBits x)

export
%hint
marshalPtr : CType t => Marshal a' (Ptr t) (Ptr t)
marshalPtr = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (prim__PtrToBits $ prim__forgetPtr x)

export
%hint
marshalBool : Marshal a' Bool Bool
marshalBool = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (if x then 1 else 0)

export
%hint
marshalInt8 : Marshal a' Int8 Int8
marshalInt8 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt16 : Marshal a' Int16 Int16
marshalInt16 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt32 : Marshal a' Int32 Int32
marshalInt32 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt64 : Marshal a' Int64 Int64
marshalInt64 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits8 : Marshal a' Bits8 Bits8
marshalBits8 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) x

export
%hint
marshalBits16 : Marshal a' Bits16 Bits16
marshalBits16 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) x

export
%hint
marshalBits32 : Marshal a' Bits32 Bits32
marshalBits32 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) x

export
%hint
marshalBits64 : Marshal a' Bits64 Bits64
marshalBits64 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) x

-- integer instances

export
%hint
marshalInt8Integer : Marshal a' Integer Int8
marshalInt8Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt16Integer : Marshal a' Integer Int16
marshalInt16Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt32Integer : Marshal a' Integer Int32
marshalInt32Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt64Integer : Marshal a' Integer Int64
marshalInt64Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits8Integer : Marshal a' Integer Bits8
marshalBits8Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits16Integer : Marshal a' Integer Bits16
marshalBits16Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits32Integer : Marshal a' Integer Bits32
marshalBits32Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits64Integer : Marshal a' Integer Bits64
marshalBits64Integer = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (cast x)
*/

/*
Two things to note here:
- the `repr` argument in `MkMarshal` is an "auto implicit", this means
  the Idris type checker will try to build a `CType` that fits what
  is known when `MkMarshal` is used. For the above snippet,
  `MkMarshal` needs to be a `Marshal Int Int` implying `repr : CType Int`;
  an expression that matches this type is `CInt` and Idris does manage to find it.
  This mechanism is called "proof search", indeed `CType Int` is a proposition
  that `Int` has a C representation and `CInt` is proof for the proposition.
- By default, proof search looks only at the constructors of a data type. For
  for `CType Int` above it could have looked through `CInt`, `CFloat`,
  `CDouble`, etc. As foreshadowing, `Marshal` will itself be the target
  of proof search and `%hint` makes the _function_ `marshalInt` available to
  it. (footnote
  one may wonder why build `marshalInt` at all, instead of searching
  for it. The single constructor for `Marshal`, `MkMarshal`, requires a
  function `ity -> Ptr cty -> IO Int`; and in the case of `marshalInt`
  `Int -> Ptr Int -> IO Int`. Not only is the search space for such a value
  enormous (the syntax tree is infinite, though the actual space is finite),
  but some of the possibilities may never halt. The general problem here
  is program synthesis).
*/


---

Marshalling into a `Struct` is more complicated. Firstly, there's
the question of which Idris type should represent a struct. Secondly,
alignment and padding of fields within the struct needs to be calculated, as with `sizeof` the details are omitted from this document.

The Idris type I've chosen to marshal into structs is tuples.
(footnote: `HList` is another possible choice but, in practice,
proof search struggles to find `Marshal` implementations as too
many other types are defined with the `Nil` and `::` constructors)

In pseudo-code the `Marshal` instances for structs should look like:

  ```idris
  Marshal a' (ix, iy, iz, ...) (Struct _ [(_, cx), (_, cy), (_, cz), ...])
  ```

However, there are a few issues. Firstly, 1-tuples do not exist because
Idris desugars them into nested `Pair`s which have exactly two elements.
(footnote:
```
(1, True, "hello") == MkPair 1 (MkPair True "hello")
```
)
Secondly, each `ix` and corresponding `cx` needs its own `Marshal`
instance. Implementing each of these to some finite limit is be acceptable in
lesser language such as Rust, but a beautiful, dependently typed language
like Idris allows us to avoid this by using recursion. The base case is defined
such that a `Marshal` for a plain value can be used to construct a `Marshal`
for a `Struct` with one field.

```idris
export
%hint
marshalStructBase :
  { 0 ia : Type } ->
  { auto repr : CType ca} ->
  Marshal a' ia ca ->
  Marshal a' ia (Struct name [(f, ca)])
```

The recursive case combines a `Marshal` for a single value with a `Marshal` for
a `Struct` and creates a `Marshal` for a `Struct` with the additional field.

```idris
export
%hint
marshalStructRec :
  { auto repr : CType ca } ->
  Marshal a' ia ca ->
  { auto reprs : All (CType . Builtin.snd) cb } ->
  Marshal a' ib (Struct name cb) ->
  Marshal a' (Pair ia ib) (Struct name ((field, ca)::cb))
```

TODO

```idris
export
%hint
marshalDerefStructRef: Marshal a' (Ref a' (Struct name fields)) (Struct name fields)

export
%hint
marshalDerefStructPtr: Marshal a' (Ptr (Struct name fields)) (Struct name fields)

export
%hint
marshalAnyPtr: Marshal a' AnyPtr AnyPtr

export
%hint
marshalFnPtr: FFIFn t -> Marshal a' (Ptr t) (Ptr t)
```

/* idris
(.ctype) : Marshal a' ity cty -> CType cty
(.ctype) (MkMarshal { repr } _) = repr


padto : AnyPtr -> CType a -> Int64
padto ptr repr =
  let ptrBits = the Int64 $ believe_me ptr
  in cast $ (doAlign (cast ptrBits) (cast $ alignof repr)) - (cast ptrBits)
  where
  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/include/ffi_common.h#L118
  doAlign : Bits64 -> Bits64 -> Bits64
  doAlign v a = ((v-1) .|. (a-1))+1

marshalStructBase ma = MkMarshal $ \x, ptr =>
  let MkMarshal f = ma
  in f x (prim__castPtr $ prim__forgetPtr ptr)

marshalStructRec ma mb = MkMarshal $ \(a, bs), ptr => do
  let anyptr = prim__forgetPtr ptr
  let pad = padto anyptr ma.ctype
  let MkMarshal maf = ma
  let MkMarshal mbf = mb
  siz <- (+ pad) <$> maf a (prim__castPtr $ prim__offsetPtr anyptr pad)
  (+ siz) <$> mbf bs (prim__castPtr $ prim__offsetPtr anyptr $ cast siz)
*/

The following examples further illustrate the power of proof search.
Instances of `Marshal` can be built up automatically for only the cost
of writing `%hint`. Other languages might require metaprogramming,
such as macros, which have their own learning curve. However, with
proof search, the programmer simply writes Idris code.

```idris
testNewRefStruct1 : ScopedIO a' (Ref a' (Struct "hello" [("f", Int)]))
testNewRefStruct1 = newRef (the Int 25)

testNewRefStruct2 : ScopedIO a' (Ref a' (Struct "hello" [("f", Int), ("g", Int)]))
testNewRefStruct2 = newRef ((the Int 25), (the Int 50))

testNewRefStruct3 : ScopedIO a' (Ref a'
  (Struct "hello"
    [("f", Int), ("g", Ptr Int)]))
testNewRefStruct3 = newRef ((the Int 25), !testNewRefInt)

testNewRefStruct4 : ScopedIO a' (Ref a'
  (Struct "hello"
    [ ("f", Int)
    , ( "g" , Struct "world"
        [ ("h", Int)
        , ("i", Ptr Int)
      ])
    ])
  )
testNewRefStruct4 = newRef ((the Int 25), (the Int 50, !testNewRefInt))
```

=== The `Unmarshal` type

Unmarshalling follows the same pattern, however compound types like `Struct`,
cannot be unmarshalled. Instead, the API allows "projection" of references.

```idris
public export
data Unmarshal : Lifetime -> ity -> cty -> Type where
  MkUnmarshal : { auto repr : CType cty } -> (Ptr cty -> IO ity) -> Unmarshal a' ity cty

public export
readRef :
  { auto unmarshal : Unmarshal a' ity cty } ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  Ref a' cty ->
  ScopedIO b' ity
readRef @{ MkUnmarshal f } ref = liftIO $ f (unsafeRefPtr ref)

public export
shortenRef :
  (0 b' : Lifetime) ->
  Ref a' cty ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  Ref b' cty

export
%hint
unmarshalInt : Unmarshal a' Int Int
unmarshalInt = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)
```

/* idris

export
%hint
unmarshalFloat : Unmarshal a' Double Float
unmarshalFloat = MkUnmarshal $ \ptr =>
  map prim__SingleFromBits $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)

export
%hint
unmarshalDouble : Unmarshal a' Double Double
unmarshalDouble = MkUnmarshal $ \ptr =>
  map prim__DoubleFromBits $ primIO $ prim__ptrRead64 (prim__forgetPtr ptr)

export
%hint
unmarshalPtr : CType t => Unmarshal a' (Ptr t) (Ptr t)
unmarshalPtr = MkUnmarshal $ \ptr =>
  map (prim__castPtr . prim__PtrFromBits) $ primIO $ prim__ptrRead64 (prim__forgetPtr ptr)


export
%hint
unmarshalBool : Unmarshal a' Bool Bool
unmarshalBool = MkUnmarshal $ \ptr =>
  map (/= 0) $ primIO $ prim__ptrRead8 (prim__forgetPtr ptr)

export
%hint
unmarshalBits8 : Unmarshal a' Bits8 Bits8
unmarshalBits8 = MkUnmarshal $ \ptr =>
  primIO $ prim__ptrRead8 (prim__forgetPtr ptr)

export
%hint
unmarshalBits16 : Unmarshal a' Bits16 Bits16
unmarshalBits16 = MkUnmarshal $ \ptr =>
  primIO $ prim__ptrRead16 (prim__forgetPtr ptr)

export
%hint
unmarshalBits32 : Unmarshal a' Bits32 Bits32
unmarshalBits32 = MkUnmarshal $ \ptr =>
  primIO $ prim__ptrRead32 (prim__forgetPtr ptr)

export
%hint
unmarshalBits64 : Unmarshal a' Bits64 Bits64
unmarshalBits64 = MkUnmarshal $ \ptr =>
  primIO $ prim__ptrRead64 (prim__forgetPtr ptr)

export
%hint
unmarshalInt8 : Unmarshal a' Int8 Int8
unmarshalInt8 = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead8 (prim__forgetPtr ptr)

export
%hint
unmarshalInt16 : Unmarshal a' Int16 Int16
unmarshalInt16 = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead16 (prim__forgetPtr ptr)

export
%hint
unmarshalInt32 : Unmarshal a' Int32 Int32
unmarshalInt32 = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)

export
%hint
unmarshalInt64 : Unmarshal a' Int64 Int64
unmarshalInt64 = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead64 (prim__forgetPtr ptr)
*/

Reference projection means a reference to a struct can be turned into a
reference, of the same lifetime, to one of the struct's fields. Once
again, this requires a proposition type to guarantee that the value
of the field does exist.


```idris
public export
data Field : String -> List (String, Type) -> Type where
  First : Field name ((name, ty)::fs)
  Later : Field name fs -> Field name (f::fs)

public export
0 FieldType : Field fname fs -> Type
FieldType (First { ty }) = ty
FieldType (Later l) = FieldType l

export
getField :
  { auto reprs : All (CType . Builtin.snd) fields } ->
  Ref a' (Struct name fields) ->
  (fname : String) ->
  { auto f : Field fname fields } ->
  Ref a' (FieldType f)
```

/* idris
getField ref fname =
  unsafePtrRef $ prim__castPtr $ offset (prim__forgetPtr $ unsafeRefPtr ref) reprs f
  where
  offset :
    AnyPtr ->
    All (CType . Builtin.snd) fields' ->
    (_ : Field fname' fields') ->
    AnyPtr
  offset ptr (r::rs) (Later f) =
    let ptr' = prim__offsetPtr ptr $ (sizeof r) + (padto ptr r)
    in offset ptr' rs f
  offset ptr (r::_)  First    = prim__offsetPtr ptr (padto ptr r)
*/

TODO: explain pointer projection

```idris

public export
0 Ptr2Ref : (a' : Lifetime) -> Type -> Type
Ptr2Ref a' (Ptr t) = Ref a' t
Ptr2Ref a' t = Ref a' t

export
getPtr :
  { auto repr : CType t } ->
  Ref a' (Ptr t) ->
  Ref a' t
```


== Examples


```idris
testScope1 : IO Int
testScope1 = runScopedIO $ \a' => do
  x <- newRef { cty = Int } $ the Int 10
  runSubScopedIO a' $ \b' => do
    readRef x

failing "Can't solve constraint"
  testScope2 : IO Int
  testScope2 = runScopedIO $ \a' => do
    x <- runSubScopedIO a' $ \b' => do
      newRef { cty = Int } $ the Int 10
    readRef x
```

== Discussion and caveats

```idris
export
stringRef : String -> ScopedIO a' (Ref a' Bits8)
{-
TODO: add to cleanup, memcpy
stringRef s = do
  ptr <- primIO $ prim__malloc $ cast $ strLength s
  pure $ unsafePtrRef $ prim__castPtr ptr
-}

```

```idris
public export
data FFICall : Lifetime -> List Type -> Type -> Type where
  FCReturn :
    CType b =>
    FFICall a' [] (PrimIO b)

  FCReturnVoid :
    FFICall a' [] (PrimIO ())

  FCSame :
    CType a =>
    FFICall a' args f ->
    FFICall a' (a::args) (a -> f)

  FCInteger :
    CType a =>
    Cast Integer a =>
    FFICall a' args f ->
    FFICall a' (Integer::args) (a -> f)

  FCRefPtr :
    CType a =>
    FFICall a' args f ->
    FFICall a' ((Ref a' a)::args) (Ptr a -> f)

  FCDerefStructPtr :
    All (CType . Builtin.snd) fields =>
    FFICall a' args f ->
    FFICall a' ((Ptr (Struct name fields))::args) (Struct name fields -> f)

  FCDerefStructRef :
    All (CType . Builtin.snd) fields =>
    FFICall a' args f ->
    FFICall a' ((Ref a' (Struct name fields))::args) (Struct name fields -> f)

public export
0 FFICallRet : FFICall a' args f -> Type
FFICallRet (FCReturn { b }) = b
FFICallRet (FCReturnVoid) = ()
FFICallRet (FCSame rest) = FFICallRet rest
FFICallRet (FCInteger rest) = FFICallRet rest
FFICallRet (FCRefPtr rest) = FFICallRet rest
FFICallRet (FCDerefStructPtr rest) = FFICallRet rest
FFICallRet (FCDerefStructRef rest) = FFICallRet rest
FFICallRet _ = the Type $ assert_total $
               idris_crash "the totality checker doesn't like FFICall"

-- TODO: chez specific!!
prim__ptrDeref : Ptr a -> a
prim__ptrDeref = believe_me

checkRef : Ref a' x -> ScopedIO a' ()
checkRef _ = pure ()

export
safeFFI :
  { auto call : FFICall a' args f } ->
  f -> HList args -> ScopedIO a' (FFICallRet call)
safeFFI = (assert_total go) call
  where
  partial go :
    (call' : FFICall a' args' f') ->
    f' -> HList args' -> ScopedIO a' (FFICallRet call')
  go FCReturn f _ = primIO f
  go FCReturnVoid f _ = primIO f
  go (FCSame rest) f (a::arg) = go rest (f a) arg
  go (FCInteger rest) f (a::arg) = go rest (f $ cast a) arg
  go (FCRefPtr rest) f (a::arg) = do
    _ <- checkRef a
    go rest (f $ unsafeRefPtr a) arg
  go (FCDerefStructPtr rest) f (a::arg) = go rest (f $ prim__ptrDeref a) arg
  go (FCDerefStructRef rest) f (a::arg) = do
    _ <- checkRef a
    go rest (f $ prim__ptrDeref $ unsafeRefPtr a) arg


    {-
export
safeFFIRef :
  { auto call : FFICall a' args f } ->
  { auto ptr  : IsPtr (FFICallRet call) } ->
  -- (FFICallRet call -> IO ()) ->
  f ->
  HList args ->
  ScopedIO a' (Ref a' ptr.inner)
-}

TestStruct : Type
TestStruct = Struct "TestStruct"
  [ ("a", Bits8)
  , ("b", Bits16)
  , ("c", Bits32)
  , ("d", Bits64) ]

%foreign "C:printStruct,libidris_wgpu_support"
printStruct : TestStruct -> PrimIO ()

test : IO ()
test = runScopedIO $ \a' => do
  x <- newRef { cty = TestStruct }
    ( the Bits8  101
    , the Bits16 10203
    , the Bits32 20405060
    , the Bits64 50404020205 )
  safeFFI printStruct [x]
  -- primIO $ printStruct $ prim__ptrDeref $ unsafeRefPtr x

export
autoCType : (a : Type) -> { auto x : CType a } -> CType a
autoCType _ = x

export
autoMarshal : (cty : Type) -> { auto x : Marshal a' ity cty } -> Marshal a' ity cty
autoMarshal _ = x
```

#pagebreak()

#bibliography("../../doc/cs5099/refs.bib", title: "References", style: "association-for-computing-machinery")
