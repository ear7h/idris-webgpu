#show raw.where(lang: "idris"): set raw(
  syntaxes: "idris.sublime-syntax",
)

= Implementation

```idris
import Data.Bits
import Data.List
import Data.List.Elem
import Data.List1
import Data.Vect
import Data.List.Quantifiers
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
data Float : Type where
```

TODO: `Ptr`

Next, compound types `Struct` and `Array` are defined using dependent types.
A `CArray` is defined by an integer number of elements and the type of those
elements (footnote: the type is named `CArray` because `Array` is the cannonical
name for a similar but pure-idris concept and the back-end handling of
FFI-crossable types depends only on the name of the type; support for
this has not made it to the mainline compiler):

```idris
data CArray : Int -> Type -> Type where [external]
```

A `Struct` is defined by a string name and a list of fields which
consist of the string names and types:

```idris
-- This type already exists in System.FFI
data Struct : String -> List (String, Type) -> Type where [external]
```

Note that the type of a field can be anything, not just
a C type (eg. a function, a dependent type, etc.). In order
to limit which types are supported C types an indexed data
type can be used:

```idris
data CType : Type -> Type where
```

This will have a couple interpretions:
- `CType a` is the universe of types that I've defined are valid in both
  Idris and C
- a `CType a` is a proof that some Idris type `a` is representable in C

The former is important because it highlights the subjectivity of
these choices and that that this is "just another type" in the eyes of the
type checker. Meaning that,
as will be demonstrated, no special-casing or hardcoding of these types
within the compiler is needed for (de)allocation, reading, or writing to
their values. (footnote: the sizes of these types still needs to be
hardcodded and made accessible somewhere but this is a much simpler
task than eg. normalizing and evaluating `CType` within the compiler
https://idris2.readthedocs.io/en/latest/backends/backend-cookbook.html#foreign-types)
(footnote: it may be needed for building FFI calls; TODO).

The latter interpretation reflects the general usage of `CType` within the
codebase, and provides a better plain-English understanding of `CType`.

Starting from the basics, the constructors for `CType` are:

```idris
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
  CPtr    : CType t -> CType (Ptr t)
```

`CPtr` uses `CType` recursively to say "given a type `t` with
a C representation, `Ptr t` has a C representation. This is
used similarly for arrays, with the additional `Int` needed
for the array's length:

```idris
  CCArray : (n : Int) -> CType t -> CType (CArray n t)
```

`Struct` looks more complicated, but follows the same principle.


```idris
  -- the verions with the . operator plays nicer with the typechecker
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
prim__malloc : Int -> PrimIO AnyPtr
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
sizeof : (repr : CType a) -> Int
```


Assuming modern 64-bit system and normal compiler (footnote: see above footnote
about harcoding values, one potential solution is providing pragmas for
non-portably sized types `int`, `char`, pointers, etc.), implementing
this should be straightforward for most `CType`s. The one
exception is `CStruct`, where alignment and padding need to be considered.
The details are out of scope here, but the short version is that values
need to be on integer multiples of their sizes, and this alignment
needs to be preserved within arrays.

```idris
alignof : (repr : CType a) -> Int
```
/* idris
alignof CInt     = 4
alignof CFloat   = 4
alignof CDouble  = 8
alignof CBool    = 1
alignof CInt8    = 1
alignof CInt16   = 2
alignof CInt32   = 4
alignof CInt64   = 8
alignof CBits8   = 1
alignof CBits16  = 2
alignof CBits32  = 4
alignof CBits64  = 8
alignof (CPtr _) = 8
alignof (CCArray _ repr) = alignof repr
alignof (CStruct reprs) = go reprs 1
  where
  go : All (CType . Builtin.snd) fields' -> Int -> Int
  go Nil aln = aln
  go (x::xs) aln = go xs (max aln $ alignof x)
*/


```idris
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
sizeof (CCArray n repr) = n * sizeof repr
sizeof (CStruct reprs)  =
  fst $ go reprs (0, 1)
  where
  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/include/ffi_common.h#L118
  doAlign : Int -> Int -> Int
  doAlign v a = ((v-1) .|. (a-1))+1

  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/src/prep_cif.c#L38
  go : All (CType . Builtin.snd) fields' -> (Int, Int) -> (Int, Int)
  go Nil (siz, aln) = (doAlign siz aln, aln) -- add padding to the end of the struct
  go (x::xs) (siz, aln) =
    let alnx = alignof x
    in go xs
      ( (+)                -- the current total size is the sum of
        (doAlign siz alnx) -- * padding after previous field
        (sizeof x)         -- * size of this field
      , max aln alnx       -- maximum alignment
      )
```

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

== Marshalling and unmarshalling

=== Compiler Primitives

The pointer returned by `alloc` above is unitialized. In order
to make use of it, there must be some way to read and write to it.
The following functions (defined for `N` in 8, 16, 32, 64)
endow Idris the ability to read and write to arbitrary memory:

  ```idris
  prim__ptrWriteN : AnyPtr -> BitsN -> PrimIO Int
  prim__ptrReadN : AnyPtr -> PrimIO BitsN
  ```

Another necessary ability is pointer arithmetic (footnote: there may
be other formulations of this eg. functions that directly
convert a pointer to an integer).

```idris
%foreign "scheme: (lambda (a b) (+ a b))"
prim__offsetPtr : AnyPtr -> Int -> AnyPtr
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
prim__ptrWrite8 : AnyPtr -> Bits8 -> PrimIO Int

%foreign (cgPtrWrite 16)
prim__ptrWrite16 : AnyPtr -> Bits16 -> PrimIO Int

%foreign (cgPtrWrite 32)
prim__ptrWrite32 : AnyPtr -> Bits32 -> PrimIO Int

%foreign (cgPtrWrite 64)
prim__ptrWrite64 : AnyPtr -> Bits64 -> PrimIO Int


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

Lastly, functions for getting the underlying bits
out of floats and pointers.

  ```idris
  prim__SingleToBits : Double -> Bits32
  prim__DoubleToBits : Double -> Bits64

  prim__SingleFromBits : Bits32 -> Double
  prim__DoubleFromBits : Bits64 -> Double

  prim__PtrBits : AnyPtr -> Bits64
  prim__PtrBits = believe_me
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

prim__PtrBits : AnyPtr -> Bits64
prim__PtrBits = believe_me
*/

=== The `Marshal` type

To safely marshal between the Idris types and the C memory representations,
the type `Marshal` is used. `Marshal` wraps

```idris
data Marshal : ity -> cty -> Type where
  MkMarshal : { auto repr : CType cty } -> (ity -> Ptr cty -> IO Int) -> Marshal ity cty
```

A `Marshal ity cty` holds a function that can marshal the Idris type `ity` into
the C type `cty`. One might expect `repr : CType cty` to be necessary for
`Marshal` but pushing the constraint to the constructor makes the type
easier to work with (`auto` explained below). The single constructor
takes a proof that `cty` has a C representation and the actual function for
doing the marshalling, `ity -> Ptr cty -> IO Int`. The return value of the
function is the number of bytes written, it's not necessary but avoids unnecessary
calls to `sizeof`.

Implementing a `Marshal` is relatively straightforward for base types, the code below has
some noise to appease the type system, but it boils down to a pointer write (`prim__ptrWrite`).

```idris
export
%hint
marshalInt : Marshal Int Int
marshalInt = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalFloat : Marshal Double Float
marshalFloat = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast $ prim__SingleToBits x)

export
%hint
marshalDouble : Marshal Double Double
marshalDouble = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (prim__DoubleToBits x)
```

/* idris
export
%hint
marshalBool : Marshal Bool Bool
marshalBool = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (if x then 1 else 0)

export
%hint
marshalInt8 : Marshal Int8 Int8
marshalInt8 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt16 : Marshal Int16 Int16
marshalInt16 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt32 : Marshal Int32 Int32
marshalInt32 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalInt64 : Marshal Int64 Int64
marshalInt64 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalBits8 : Marshal Bits8 Bits8
marshalBits8 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite8 (prim__forgetPtr ptr) x

export
%hint
marshalBits16 : Marshal Bits16 Bits16
marshalBits16 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite16 (prim__forgetPtr ptr) x

export
%hint
marshalBits32 : Marshal Bits32 Bits32
marshalBits32 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) x

export
%hint
marshalBits64 : Marshal Bits64 Bits64
marshalBits64 = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) x

*/

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

In order to use `marshalInt` and other possible implementations,
a helper function `doMarshal` takes a `Marshal`, a correspoinding
Idris value (`ity`), and a destination pointer.

```idris
doMarshal : Marshal ity cty -> ity -> AnyPtr -> IO Int
doMarshal (MkMarshal { repr } f) x ptr = f x (prim__castPtr ptr)
```

Marshalling a struct is more complicated. Firstly,
the Idris type I've chose to inialize a struct is a tuples.
Idris desugars tuples into nested pairs
(footnote:
```
(1, True, "hello") == MkPair 1 (MkPair True "hello")
```
), which means 1-tuples don't exist. The most consistent work around
is to suffix all tuples with a unit type `()`. Thus, for a struct
with `N` fields, it can be initialized with an `N+1` tuple with
the same `N` types and `()`.  More concretely, the `Marshal` instances
should look somehing like:

```idris
marshalStruct1 : Marshal (a, ())        (Struct _ [(_, a)])
marshalStruct2 : Marshal (a, b, ())     (Struct _ [(_, a), (_, b)])
marshalStruct3 : Marshal (a, b, c, ())  (Struct _ [(_, a), (_, b), (_, c)])
```

Implementing each of these to some finite limit may be acceptable in lesser
language such as Rust, but a beautiful, functional programming language
like Idris allows us to avoid this. A new type

```idris

(.ctype) : Marshal ity cty -> CType cty
(.ctype) (MkMarshal { repr } _) = repr

padto : AnyPtr -> CType a -> Int
padto ptr repr =
  let ptrBits = the Int64 $ believe_me ptr
  in cast $ (doAlign (cast ptrBits) (cast $ alignof repr)) - (cast ptrBits)
  where
  -- https://github.com/libffi/libffi/blob/c93f9428d17cde4eb35517b58feeae6fb43aba5b/include/ffi_common.h#L118
  doAlign : Bits64 -> Bits64 -> Bits64
  doAlign v a = ((v-1) .|. (a-1))+1

%hint
marshalStructBase :
  { 0 a : Type } ->
  { auto repr : CType a' } ->
  Marshal a a' ->
  Marshal a (Struct name [(f, a')])
marshalStructBase ma = MkMarshal $ \x, ptr =>
  let MkMarshal f = ma
  in f x (prim__castPtr $ prim__forgetPtr ptr)

%hint
marshalStructRec :
  { auto repr : CType a' } ->
  Marshal a a' ->
  { auto reprs : All (CType . Builtin.snd) bs' } ->
  Marshal bs (Struct name bs') ->
  Marshal (Pair a bs) (Struct name ((field, a')::bs'))
marshalStructRec ma mbs = MkMarshal $ \(a, bs), ptr => do
  let anyptr = prim__forgetPtr ptr
  let pad = padto anyptr ma.ctype
  siz <- (+ pad) <$> doMarshal ma a (prim__offsetPtr anyptr pad)
  map (+ siz) $ doMarshal mbs bs (prim__offsetPtr anyptr siz)
```

Now, there's enough information for a safe allocation

```idris
allocSafe : a -> { auto marshal : Marshal a a' } -> IO (Ptr a')
allocSafe init = do
  ptr <- alloc marshal.ctype
  _ <- doMarshal marshal init (prim__forgetPtr ptr)
  pure ptr

testAllocInt : IO (Ptr Int)
testAllocInt = allocSafe (the Int 25)

testAllocStruct1 : IO (Ptr (Struct "hello" [("f", Int)]))
testAllocStruct1 = allocSafe (the Int 25)

testAllocStruct2 : IO (Ptr (Struct "hello" [("f", Int), ("g", Int)]))
testAllocStruct2 = allocSafe ((the Int 25), (the Int 50))
```

=== The `Unmarshal` type

Unmarshalling follows the same pattern, however compound types are skipped. Later
on, they will be projected into other pointers.

```idris
data Unmarshal : ity -> cty -> Type where
  -- NOTE: you have access to a pointer but this must be pure!!!
  MkUnmarshal : { auto repr : CType cty } -> (Ptr cty -> ity) -> Unmarshal ity cty

doUnmarshal : Unmarshal ity cty -> AnyPtr -> ity
doUnmarshal (MkUnmarshal f) ptr = f (prim__castPtr ptr)

%hint
unmarshalInt : Unmarshal Int Int
unmarshalInt = MkUnmarshal $ \ptr =>
  unsafePerformIO $ map cast $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)
```

== Memory safety with lifetimes

The last, and most important property of this API is enforcing correct
lifecyle of allocated memory. After allocation and initialization,
memory that is no longer used needs to be deallocated and returned to
the operating system with the `free(3)` system call. Further, after
the call to `free` the pointer should not be read from or written to
(footnote: this is known is "user after free" and is a common cause of
vulnerabilities, citation needed).

As mentioned, the design takes inspiration from Rust where "references"
are pointers with an associated lifetime. Rust's lifetimes are a special
construct within the type sytem and the "borrow checker". In Idris it can
be modeled as a plain data type; and the `Ref` type is then dependent on
the lifetime (in addition to the type of the underlying pointer).

```idris
-- constructors defined later
data Lifetime : Type

data Ref : Lifetime -> Type -> Type where [external]
```
Ignoring `thr`, the `Lifetime` constructor hints at the hiearchial relationship
between lifetimes. Starting from a root scope, shorter sub scopes can be
created.

TODO: explain `[external]` above

In `Ref`, `[external]` tells the compiler that `Ref` is an
opaque type which may be constructed. Otherwise, the compiler
assumes a `Ref` value will never exist since it has no constructors,
which may lead to code being optimized away. Rather than a
constructor, an `%unsafe` function with `believe_me` is used;
this prevents proof search from using it and further communicates
to users they should think twice about using the functions.

```idris
%unsafe
unsafeRefPtr : Ref a' t -> Ptr t
unsafeRefPtr = believe_me

%unsafe
unsafePtrRef : Ptr t -> Ref a' t
unsafePtrRef = believe_me
```

=== `ScopedIO`

The type that brings all the concepts together is `ScopedIO`. It is inspired
by the `ST` type (@ st-monad). So a quick review of it is warrented before
`ScopedIO`. `ST` is type that describes mutable computation within a pure
language. `ST` and it's associated operations are defined as:

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

`ST` is simply a function that takes some state `s` and returns
a result `a` along with some, possibly new, state `s`. The
`new`, `read`, and `write` functions are the "primitives"
for working "inside" `ST`; note that the `s` of the
`STRef` neds to match the `s` of `ST`.

Lastly, `runST`
is used to actually get the result `a` from an `ST s a`.
Howver, the first argument has an important nuance:
`{ s : Type } -> ST s a` means the `ST` needs to work for _all_ possible
state types `s`. Said another way, `runST` determines what the
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
it is only useable within the invocation. (footnote:
what I refer to as an "in (footnote: What I refer to as an "invocation
of `runST`" is called a "thread" in the literature hence `thr` in
the lifetime, not to be confused with "threads" in concurrent programming),

---

For this library, `s` becomes `Lifetime`, with the to-be-quantified type, in
the constructors:

```idris
data Lifetime : Type where
  LRoot : (0 thr : Type) -> Lifetime
  LSub  : (0 thr : Type) -> (0 _ : Lifetime) -> Lifetime
```

Then, a simplified version of `Scope` and `runScope` look like:

```idris
data Scope : Lifetime -> Type -> Type where
  MkScope : (Unit -> (List AnyPtr, a)) -> Scope a' a

newRef' :
  (0 a' : Lifetime) ->
  ity ->
  (cty : Type) -> { auto marshal : Marshal ity cty } ->
  Scope a' (Ref a' cty)
readRef' : Ref a' cty -> { auto unmarshal : Unmarshal cty ity } -> Scope a' ity

runScope : ((a' : Lifetime) -> Scope a' a) -> a
```

Here, a `Scope` is a function that accumulates pointers to be freed at the end
of the computation, and a result `a`. Running a scoped computation requires
a `Scope` that works for any single `Lifetime`; as with `ST` this means
that the `Scope`'s operations only use `Ref`s with a matching lifetime.
Also note the requirement of implicit `Marshal` and `Unmaarshal` types.

However, this implementation has two problems. Firstly, allocation
and deallocation require side effects, ie. working within `IO`;
this fix is simple and left for later. More importantly, lifetimes are hiearchial and
a reference with a longer lifetime
should be allowed to be used in places where a refernce with a shorter lifetime is needed.
In Rust, this is modeled using subtyping. Idris does not have
native subtyping relationships, so the relationship is modeled using,
you guessed it, another dependent type represeting a proposition,
that eventually gets proof searched.

```idris
data AtLeastAsLong : Lifetime -> Lifetime -> Type where
  ALALSame   : AtLeastAsLong a' a'
  ALALDirect : AtLeastAsLong a' (LSub b a')

  -- ALALTrans can be read as the following line, the obfuscation is a workaround
  -- to an infinite loop somewhere in the compiler
  -- ALALTrans  : AtLeastAsLong a' b' -> AtLeastAsLong b' c' -> AtLeastAsLong a c

  ALALTrans  : AtLeastAsLong a' (LSub b a') -> AtLeastAsLong (LSub b a')  c' -> AtLeastAsLong a c
```

The a value of type `AtLeastAsLong a' b'` is a proof that the lifetime `a'` is at least as long as `b'`.
This proof is provided functions computing within a sub-scope:

```idris
runSubScope :
  (0 a' : Lifetime) ->
  ((0 b' : Lifetime) -> { 0 p : AtLeastAsLong a' b' } -> Scope b' a) ->
  Scope a' a
```

Which can then be used for reading references from a parent scope:

```idris
readRefLonger :
  Ref a' cty ->
  { auto unmarshal : Unmarshal cty ity } ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  Scope b' ity
```

== All together

With all these pieces, `ScopedIO` can be defined for safe memory allocation with
access to `IO`. From the internal `IO`, the usual `Monad` and friends can also
be defined.

```idris
data ScopedIO : Lifetime -> Type -> Type where
  MkScopedIO : IO (List AnyPtr, a) -> ScopedIO a' a

Functor (ScopedIO a')
Applicative (ScopedIO a')
Monad (ScopedIO a')
HasIO (ScopedIO a')
```

/* idris
Functor (ScopedIO a') where
  map f (MkScopedIO x) = MkScopedIO $ map (mapSnd f) x

Applicative (ScopedIO a') where
  pure x = MkScopedIO $ pure ([], x)

  (<*>) (MkScopedIO f) (MkScopedIO sf) = MkScopedIO $ do
    (fps, f') <- f
    (sfps, sf') <- sf
    pure (sfps ++ fps, f' sf')

Monad (ScopedIO a') where
  join (MkScopedIO x) = MkScopedIO $ do
    (l1, MkScopedIO x') <- x
    (l2, x'') <- x'
    pure (l1 ++ l2, x'')

HasIO (ScopedIO a') where
  liftIO x = MkScopedIO $ map ([],) x
*/

With access to side effects, `runScopedIO` and `runSubScopedIO`
can be also be fully defined.

```idris
runScopedIO :
  HasIO io =>
  ((0 a' : Lifetime) -> ScopedIO a' a) ->
  io a
runScopedIO f = liftIO $ do
  let MkScopedIO f' = f $ LRoot Void
  (ptrs, ret) <- f'
  _ <- traverse (primIO . prim__free) ptrs
  pure ret

runSubScopedIO :
  (0 a' : Lifetime) ->
  (
    (0 b' : Lifetime) ->
    { 0 p : AtLeastAsLong a' b' } ->
    ScopedIO b' a
  ) ->
  ScopedIO a' a
runSubScopedIO a' f = do
  let MkScopedIO f' = f (LSub Void a') { p = ALALDirect }
  (ptrs, ret) <- liftIO f'
  _ <- traverse (primIO . prim__free) ptrs
  pure ret
```


```idris
newRef :
  ity ->
  { auto marshal : Marshal ity cty } ->
  ScopedIO a' (Ref a' cty)
newRef init =
  liftIO $ unsafePtrRef <$> allocSafe init

readRef :
  Ref a' cty ->
  { auto unmarshal : Unmarshal ity cty } ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  ScopedIO b' ity
readRef ref = pure $ doUnmarshal unmarshal (prim__forgetPtr $ unsafeRefPtr ref)
```

=== Examples

```idris
testScope1 : IO Int
testScope1 = runScopedIO $ \a' => do
  x <- newRef { cty = Int } $ the Int 10
  readRef x

testScope2 : IO Int
testScope2 = runScopedIO $ \a' => do
  x <- newRef { cty = Int } $ the Int 10
  y <- runSubScopedIO a' $ \b' => do
    readRef x
  pure y

failing "Can't solve constraint"
  testScope3 : IO Int
  testScope3 = runScopedIO $ \a' => do
    x <- runSubScopedIO a' $ \b' => do
      newRef { cty = Int } $ the Int 10
    readRef x
```

=== Discussion

`Unmarshal` for structs isn't defined, rather a `getField` function
is used for "projecting" the reference to one of the struct's fields

  ```idris
  getField : Ref a' (Struct name fields) -> (f : String) -> Ref a' (lookup f fields)
  ```

/* idris
export
%hint
marshalRef :
  { 0 a' : Lifetime } ->
  { repr : CType t } ->
  Marshal (Ref a' t) (Ptr t)
marshalRef = MkMarshal $ \x, ptr => do
    let unref = prim__PtrBits $ prim__forgetPtr $ unsafeRefPtr x
    primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) unref
*/


