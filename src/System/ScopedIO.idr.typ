/* idris
module System.ScopedIO


import Data.Bits
import Data.List
import Data.List.Elem
import Data.List.Quantifiers
import Data.List1
import Data.String
import Data.Vect
import System
*/

= Design

== Preventing memory leaks and use-after-free with scopes <sec-st-lifetimes>

The design of lifetimes in this library is heavily based on the `ST` (state
thread) monad @st-monad.  Informally, `ST` allows mutable state (generally
disallowed in pure functional programming) by keeping track of the
thread which the mutable state belongs to. Note, the "thread" here should
not confused with concurrency primitive.

#figure(
```idris
data ST : (s : Type) -> (a : Type) -> Type where
  MkSt : (s -> (a, s)) -> ST s a

data STRef : (s : Type) -> (a : Type) -> Type where
  MkRef : (s : Type) -> a -> STRef s a

newSTRef   : a -> ST s (STRef s a)
readSTRef  : STRef s a -> ST s a
writeSTRef : STRef s a -> a -> ST s ()

runST : ({ s : Type } -> ST s a) -> a
```,
  caption: [`ST`, `STRef`, and associated types as defiend in @st-monad],
)

The important detail is that `runST` requires `{s : Type} -> ST s a`.
The `ST` value being run needs to be general over all types `s`.
Calling `runST` on an `ST` then "materializes" the general `s` into
a specific type, which we'll denote `s1`; `s1` marks the thread.
Thus, a call to `newSTRef` inside the `ST s1 _` becomes
`ST s1 (STRef s1 a)`. The above implementation
hides some category-theoretical magic, but assume the `STRef s1 a`
is freely accessible; further calls `readSTRef` and `writeSTRef`
take up the materialized `s1` from their inputs into their output `ST`s.
These specific `ST s1 _` types cannot be used in a different `runST`
because the `s1` is no longer general enough for `runST`.

```idris
failing "When unifying"
  testRunSTBad : Int
  testRunSTBad = runST $ readSTRef (runST $ newSTRef 2)
```

This pattern has a couple useful properties. Firstly,
the computation inside an `ST` starts and ends within `runST`
function. If allocation were to occur inside the `ST`, this
is a convenient place for deallocating such memory.
Secondly, the specific `STRef s1 a`, is only usable within the thread
`s1`. If `STRef` held a pointer to memory allocated inside `ST`, it would
then not be accessible after being deallocated at the end of
`runST`. These two properties prevent the `free` related errors
as defined in @sec-memsafe.

Together, another interpretations of `ST` is that it behaves like a scope:
`STRef` s are only useable within the scope. This useability
is enforced by the type checker.

=== Lifetimes

Sadly, `ST` cannot be directly directly. A common pattern when
dealing with memory is using a longer lived object to build
a shorter lived object. Calling `runST` inside an `ST` is possible,
but there is not a way for the compiler to reason about how
the threads relate. In short, we'd like to denote subscopes and
have a way of relating references that originate from related
scopes.

In order to support the sharing of references between subscopes
Rust treats lifetimes types with subtyping relationships @rust-subtyping-variance.
Using subtyping means these relationships are worked without automatically, and
a reference with longer lifetime can be used, wihtout any extra
syntax, where shorter lifetimes are expected. Idris does not
explicitly feature subtyping. However, the combination of dependent
types and proof search allows programs to be written in
a similar way. Lifetimes and the type for subscoping
relations are described in @sec-lifetimes-impl.

== Preventing out of bounds access <sec-oob>

Preventing out-of-bounds and uninitialized memory access requires
two pieces:
- Ensuring the correct amount of memory is allocated.
- Reading and writing to that memory in a controlled manner.

The `CType` type is responsible for the former.
It is polymorphic
#footnote[In the functional programming sense @strachey-fundamentals,
or "generic" in object-oriented programming parlance] over a type `a`
with a limited number of constructors. Thus it behaves like a
sealed interface @java-sealed. The complete type, `CType a`, expresses
a predicate that, in plain English, means "`a` has a C representation".
The type itself does not specify what this representation is. Rather, the
representations are provided by functions such as `sizeof` and `alignof`.
This design means specifying valid C types and allocating them
can be done in plain Idris, without built-in support for each
possible C type.

Inspired by Haskell's `Storable` @haskell-ffi, the
`Marshal` and `Unmarshal` types are responsible for
controlling memory accesss.
`Marshal` corresponds to memory writes, and Haskell's `poke`, while
`Unmarshal` correspondes to memory reads and Haskell's `peak`.

#figure(
  ```haskell
  -- haskell storable
  class Storable a where
    sizeOf      :: a -> Int
    alignment   :: a -> Int

    peekElemOff :: Ptr a -> Int      -> IO a
    pokeElemOff :: Ptr a -> Int -> a -> IO ()

    peekByteOff :: Ptr a -> Int      -> IO a
    pokeByteOff :: Ptr a -> Int -> a -> IO ()

    peek        :: Ptr a             -> IO a
    poke        :: Ptr a        -> a -> IO ()

    destruct    :: Ptr a             -> IO ()
  ```,
  caption: [
    The Haskell `Storable` typeclass from @haskell-ffi-proposal.
    Note that as a typeclass, each FFI-boundary-crossing
    type needs to implement it. That is, any programmer
    wishing to make a type cross FFI boundaries needs
    to write code making direct memory accesses.
  ]
)

== Leveraging dependent types and proof search

One of the main developments of this work is that
this library employs proof search for generating `Marshal`
instances for compound types, ie. `struct`s. This
is an improvement over existing techniques which
require external tools for generating code
(see @sec-related-boilerplate)

Additionally, dependent types are used throughout to define
memory safety properties which the compiler can verify.

= Implementation

== Preamble

Firstly, two _opque_ types need to be defined. These types
should not exist #footnote[This is a convenient lie
for now. In `safeFFI` we'll use non-pointed-to `CArray`
and `Struct` to tell the codegen backend that a
function needs to dereference the underlying pointer],
as all C types will be heap allocated. That is,
only `Ptr CArray` and `Ptr (Struct _ _)` should
exist.

```idris
public export
data CArray : Int -> Type -> Type where [external]

public export
data Struct : String -> List (String, Type) -> Type where [external]
```

/* idris
public export
data Float : Type where [external]

public export
data FFIFn : Type -> Type

public export
data Lifetime : Type

public export
data Ref : Lifetime -> Type -> Type
*/

== Allocation


The `CType` constructors can be split into primitives like, `CInt` and
`CDouble` and recursive constructors `CPtr`, `CArray`, and
`CStruct`. As mentioned above, `CInt` is a proof that `Int` has a
C representation. The recursive definitions similarly state that,
for example, given a proof that some type `t` has a C representation,
`Ptr t` has a C representation.

The `CStruct` constructor uses the `All` list quantifier to
say that all of the field types of a struct need to have C
representations themselves.

```idris
public export
data CType : Type -> Type where
  CInt    : CType Int
  CDouble : CType Double
  CPtr    : CType t -> CType (Ptr t)
  CCArray  : (n : Int) -> CType t -> CType (CArray n t)
  CStruct : All (CType . Builtin.snd) fields -> CType (Struct name fields)
```

/* idris
  CFloat : CType Float

  CBool : CType Bool

  CInt8  : CType Int8
  CInt16 : CType Int16
  CInt32 : CType Int32
  CInt64 : CType Int64

  CBits8  : CType Bits8
  CBits16 : CType Bits16
  CBits32 : CType Bits32
  CBits64 : CType Bits64

  CVoidPtr : CType AnyPtr
  CFnPtr   : FFIFn t -> CType (Ptr t)
*/

```idris
sizeof  : (repr : CType a) -> Int64
alignof : (repr : CType a) -> Int64

alloc : (repr : CType a) -> IO (Ptr a)
free  : Ptr a -> IO ()

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

public export
data FFIFn : Type -> Type where
  CFReturn     : CType t -> FFIFn (PrimIO t)
  CFReturnVoid : FFIFn (PrimIO ())
  CFParam : CType t -> FFIFn rest -> FFIFn (t -> rest)

%foreign "scheme:foreign-alloc"
prim__malloc : Int64 -> PrimIO AnyPtr


alloc repr = map prim__castPtr $ primIO $ prim__malloc (sizeof repr)

%foreign "scheme:foreign-free"
prim__free : AnyPtr -> PrimIO ()

free ptr = primIO $ prim__free $ prim__forgetPtr ptr

*/

== Lifetime and subscopes <sec-lifetimes-impl>

Lifetimes are implemented as a wrapper around the `s : Type` of `ST`.
The two constructors reflect the two ways of running
our desired scoped computation: it can at the top level
`runScopedIO`, or it can be a subscope `runSubScopedIO`
where the constructor references a parent scope.

```idris
public export
data Lifetime : Type where
  LRoot : (0 thr : Type) -> Lifetime
  LSub  : (0 thr : Type) -> (0 _ : Lifetime) -> Lifetime
```

The hiearnchy implicit in `Lifetime` is not enough to fully reason
about them. Another type `AtLeastAsLong` is needed representing the proposition
that a lifetime `a'` is at least as long as `b'`. When the proposition
is has a proof, a `Ref a'` can be shortened to a `Ref b'`.
`AtLeastAsLong` type has two constructors
representing base cases and one recursive case. The base cases
are `ALALSame`, which proves that a lifetime
is at least as long as itself, and `ALALParent`, which proves
that a lifetime `a'` is at least as long as a direct descendant
of itself. Lastly, the recursive `ALALTrans` admits a transitive property
for lifetimes.

```idris
public export
data AtLeastAsLong : Lifetime -> Lifetime -> Type where
  ALALSame   : AtLeastAsLong a' a'
  ALALParent : AtLeastAsLong a' (LSub b a')
  ALALTrans  : AtLeastAsLong a' b' -> AtLeastAsLong b' c' -> AtLeastAsLong a' c'

```


== Marshal/Unmarshal <sec-marshal>

The `Marshal` type is inspired by the `poke` function
in Haskell's `Storable` @haskell-ffi. They both take a pointer to a
C allocation, host value, and execute a side-effecting computation.
However, there a few differences. Primarily, in `Marshal` the
Idris type and C type do not have to be the same. This is necessary
for enforcing memory safety: `Ref a' a` can be marshalled into a
`Ptr a` without actually realizing the `Ptr a`. That is, it's written
to memory through a `Ptr (Ptr a)`. This is an important property, because
it means a programmer cannot stumble into a function which
creates a pointer from a reference #footnote[This functionality _is_ provided
but with an apt warning in the name: `unsafeRefPtr`]; this conversion
does have to happen but can be safely encapsulated inside
a `Marshal` instance and not exposed to the programmer.

Unmarshal follows in a similar manner. However, as a design choice,
unmarshaling of structures is not provided. The motivation behind
this decision is that entire structures should be passed around
as `Ref`s, bringing their values into Idris incorrectly suggests
they will be kept up to date according to the backing data, which is not
possible or safe.


#columns(2)[
```idris
public export
data Marshal
  : Lifetime -> ity -> cty -> Type where
  MkMarshal :
    { auto repr : CType cty } ->
    (ity -> Ptr cty -> IO Int64) ->
    Marshal a' ity cty

export
%hint
marshalInt : Marshal a' Int Int

export
%hint
marshalDouble : Marshal a' Double Double

export
%hint
marshalRef :
  { auto repr : CType t } ->
  Marshal a' (Ref a' t) (Ptr t)
```

```idris
export
%hint
marshalStructBase :
  { 0 ia : Type } ->
  { auto repr : CType ca} ->
  Marshal a' ia ca ->
  Marshal a' ia (Struct name [(f, ca)])

export
%hint
marshalStructRec :
  { auto repr : CType ca } ->
  { auto reprs : All (CType . Builtin.snd) cb } ->
  Marshal a' ia ca ->
  Marshal a' ib (Struct name cb) ->
  Marshal a' (Pair ia ib) (Struct name ((field, ca)::cb))
```

```idris
public export
data Unmarshal
  : Lifetime -> ity -> cty -> Type where
  MkUnmarshal :
    { auto repr : CType cty } ->
    (Ptr cty -> IO ity) ->
    Unmarshal a' ity cty

export
%hint
unmarshalInt : Unmarshal a' Int Int

export
%hint
unmarshalDouble : Unmarshal a' Double Double
```

]


/* idris
export
%unsafe
unsafeRefPtr : Ref a' t -> Ptr t
unsafeRefPtr = believe_me

export
%unsafe
unsafePtrRef : Ptr t -> Ref a' t
unsafePtrRef = believe_me

%foreign "scheme: (lambda (a b) (+ a b))"
prim__offsetPtr : AnyPtr -> Int64 -> AnyPtr

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

/* idris
marshalInt = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

marshalRef = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite64
      (prim__forgetPtr ptr)
      (prim__PtrToBits $ prim__forgetPtr $ unsafeRefPtr x)

export
%hint
marshalInteger : Marshal a' Integer Int
marshalInteger = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast x)

export
%hint
marshalFloat : Marshal a' Double Float
marshalFloat = MkMarshal $ \x, ptr =>
    primIO $ prim__ptrWrite32 (prim__forgetPtr ptr) (cast $ prim__SingleToBits x)

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

%foreign "C:memcpy,libc"
prim__memcpy : AnyPtr -> AnyPtr -> Int64 -> PrimIO AnyPtr

export
%hint
marshalDerefStructPtr:
  { auto reprs : All (CType . Builtin.snd) fields } ->
  Marshal a' (Ptr (Struct name fields)) (Struct name fields)
marshalDerefStructPtr = MkMarshal $ \x, ptr => do
  let len = sizeof (CStruct { name } reprs)
  _ <- primIO $ prim__memcpy (prim__forgetPtr ptr) (prim__forgetPtr x) len
  pure len

export
%hint
marshalDerefStructRef:
  { auto reprs : All (CType . Builtin.snd) fields } ->
  Marshal a' (Ref a' (Struct name fields)) (Struct name fields)
marshalDerefStructRef = MkMarshal $ \x, ptr => do
  let MkMarshal f = marshalDerefStructPtr { a' }
  f (unsafeRefPtr x) ptr

export
%hint
marshalAnyPtr: Marshal a' AnyPtr AnyPtr
marshalAnyPtr = MkMarshal $ \x, ptr =>
  primIO $ prim__ptrWrite64 (prim__forgetPtr ptr) (prim__PtrToBits x)


export
%hint
marshalFnPtr: FFIFn t -> Marshal a' (Ptr t) (Ptr t)
marshalFnPtr _ = MkMarshal $ \x, ptr => do
  let MkMarshal f = marshalAnyPtr { a' }
  f (prim__forgetPtr x) (prim__castPtr $ prim__forgetPtr ptr)

*/

/* idris
unmarshalInt = MkUnmarshal $ \ptr =>
  map cast $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)

unmarshalDouble = MkUnmarshal $ \ptr =>
  map prim__DoubleFromBits $ primIO $ prim__ptrRead64 (prim__forgetPtr ptr)

export
%hint
unmarshalFloat : Unmarshal a' Double Float
unmarshalFloat = MkUnmarshal $ \ptr =>
  map prim__SingleFromBits $ primIO $ prim__ptrRead32 (prim__forgetPtr ptr)

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

== Scoped allocations

Lastly, the entire `ScopedIO` monad is defined. The constructor
is convoluted, but in short: it is a wrapper around `IO`
returning some `a` paired with a list of clean up functions
`List (IO ())`. An early implementation considered
returning a list of pointers for `free` to be called on.
However, it is often the case that additional code needs
to run before `free`-ing an object, this is known
as a _destructor_ @destructor. Rust captures this
concept with the `Drop` @rust-drop trait. In `ScopedIO`,
a destructor is an arbitrary `IO ()` action which
can added to the scope via `newRefDestructor`.

`runScopedIO` looks similar to `runST`, but with a `Lifetime`
instead of arbitrary `Type`. Additionally there is a
`runSubScopedIO` which passes a proof of the subscope relationship,
a `AtLeastAsLong`, which can be used to `readRef` from the outer
scope.



#columns(2)[
```idris
export
data ScopedIO : Lifetime -> Type -> Type where
  MkScopedIO : IO (Pair (List (IO ())) a) -> ScopedIO a' a

public export
data Ref : Lifetime -> Type -> Type where [external]

public export
runScopedIO :
  HasIO io =>
  ((0 a' : Lifetime) -> ScopedIO a' a) ->
  io a

public export
runSubScopedIO :
  (0 a' : Lifetime) ->
  (
    (0 b' : Lifetime) ->
    (0 p : AtLeastAsLong a' b') ->
    ScopedIO b' a
  ) ->
  ScopedIO a' a
```

```idris
public export
newRef :
  { auto marshal : Marshal a' ity cty } ->
  ity -> ScopedIO a' (Ref a' cty)

public export
newRefDestructor :
  { auto marshal : Marshal a' ity cty } ->
  ity -> (Ptr cty -> IO ()) -> ScopedIO a' (Ref a' cty)

public export
writeRef :
  { auto marshal : Marshal a' ity cty } ->
  ity -> Ref a' cty -> ScopedIO a' Int64

public export
readRef :
  { auto unmarshal : Unmarshal a' ity cty } ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  Ref a' cty -> ScopedIO b' ity
```
]

/* idris
export
Functor (ScopedIO a')

export
Applicative (ScopedIO a')

export
Monad (ScopedIO a')

export
HasIO (ScopedIO a')
*/

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

/* idris

export
defer : IO () -> ScopedIO a' ()
defer f = MkScopedIO $ pure ([f], ())


runScopedIO f = do
  let MkScopedIO f' = f $ LRoot Unit
  (cleanup, ret) <- liftIO f'
  liftIO $ sequence_ cleanup
  pure ret

runSubScopedIO a' f = do
  let MkScopedIO f' = f (LSub Unit a') ALALParent
  (cleanup, ret) <- liftIO f'
  liftIO $ sequence_ cleanup
  pure ret

newRef ity = do
  let MkMarshal { repr } f = marshal
  ret <- liftIO $ alloc repr
  _ <- liftIO $ f ity ret
  defer (free ret)
  pure $ unsafePtrRef ret

readRef @{ MkUnmarshal f } ref = liftIO $ f (unsafeRefPtr ref)

export
shortenRef :
  (0 b' : Lifetime) ->
  Ref a' cty ->
  { auto 0 p : AtLeastAsLong a' b' } ->
  Ref b' cty
shortenRef _ ref = believe_me ref
*/

=== Getting struct fields

As mentioned, reading entire `Struct`s is not supported, instead
a `Ref` to a struct can be _projected_ to a `Ref` of one of its
fields. This requires a new type `Field` for proving that
a `fname : String` is a valid field of the struct. Additionally,
a type level function `FieldType` uses this proof to extract
the type of the field. Note that `Field` is provided to
`getField` as an `auto` implicit, so when calling `getField`
the verification happens transparently.

```idris
public export
data Field : String -> List (String, Type) -> Type where
  First : Field name ((name, ty)::fs)
  Later : Field name fs -> Field name (f::fs)

public export
0 FieldType : Field fname fs -> Type
FieldType (First { ty }) = ty
FieldType (Later l) = FieldType l

public export
getField :
  { auto reprs : All (CType . Builtin.snd) fields } ->
  Ref a' (Struct name fields) -> (fname : String) ->
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

/* idris
public export
0 Ptr2Ref : (a' : Lifetime) -> Type -> Type
Ptr2Ref a' (Ptr t) = Ref a' t
Ptr2Ref a' t = Ref a' t

export
getPtr :
  HasIO io =>
  { auto repr : CType t } ->
  Ref a' (Ptr t) ->
  io (Ref a' t)
-- point free steez
getPtr =
  map
    (unsafePtrRef . prim__castPtr . prim__PtrFromBits)
    .
    (primIO . prim__ptrRead64 . prim__forgetPtr . unsafeRefPtr)
*/

== Shimming existing FFI

There is one last problem to be solved. There are some misalignments
between `CType`s and the existing expectations of FFI. For example,
functions returning C's `void` are in Idris as returning `()`.
`()` should not be a valid `CType` since C does not
have tuples, nor should `void` as it cannot be field in a `struct`.
Another example is `Ref`s, with `Ref`s to `Struct`s being
particularly problematic: plain `Struct`s cannot be created
so a compiler backend intrinsic `prim__derefStruct` is necessary.

This shimming is done via the `FFICall` type, which ties together
a list of arguments to a function type that should be callable
with those arguments. This type is used in the `safeFFI` function,
again as an auto implicit transparently constructed via proof search.


#columns(2)[

```idris
public export
data FFICall
  : (0 a' : Lifetime) ->
    List Type ->
    (fty : Type) ->
    Type where [search fty]

  FCReturn :
    CType b =>
    FFICall a' [] (PrimIO b)

  FCReturnVoid :
    FFICall a' [] (PrimIO ())
```

```idris
  FCSame :
    CType a =>
    FFICall a' args f ->
    FFICall a' (a::args) (a -> f)

  FCRefPtr :
    CType a =>
    FFICall a' args f ->
    FFICall a' ((Ref a' a)::args) (Ptr a -> f)

  FCDerefStructRef :
    All (CType . Builtin.snd) fields =>
    FFICall a' args f ->
    FFICall a' ((Ref a' (Struct name fields))::args) (Struct name fields -> f)
```
/* idris
  FCInteger :
    CType a =>
    Cast Integer a =>
    FFICall a' args f ->
    FFICall a' (Integer::args) (a -> f)

  FCDerefStructPtr :
    All (CType . Builtin.snd) fields =>
    FFICall a' args f ->
    FFICall a' ((Ptr (Struct name fields))::args) (Struct name fields -> f)
*/

]

#columns(2)[
```idris
public export
0 FFICallRet : FFICall a' args f -> Type
FFICallRet (FCReturn { b }) = b
FFICallRet (FCReturnVoid) = ()
FFICallRet (FCSame rest) = FFICallRet rest
FFICallRet (FCRefPtr rest) = FFICallRet rest
FFICallRet (FCDerefStructPtr rest) = FFICallRet rest
```

/* idris
FFICallRet (FCInteger rest) = FFICallRet rest
FFICallRet (FCDerefStructRef rest) = FFICallRet rest
FFICallRet _ = the Type $ assert_total $
               idris_crash "the totality checker doesn't like FFICall"
*/

```idris
export
safeFFI :
  { auto call : FFICall a' args f } ->
  f ->
  HList args ->
  ScopedIO a' (FFICallRet call)

export
safeFFIDrop:
  { auto call : FFICall a' args f } ->
  f ->
  (drop : FFICallRet call -> IO ()) ->
  HList args ->
  ScopedIO a' (FFICallRet call)
```

/* idris
checkRef : Ref a' x -> ScopedIO a' ()
checkRef _ = pure ()

-- TODO: chez specific!!
prim__ptrDeref : Ptr a -> a
prim__ptrDeref = believe_me


safeFFI = go call
  where
  go :
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

safeFFIDrop fn drop args = do
  ret <- safeFFI fn args
  defer (drop ret)
  pure ret
*/

]


== Misc

```idris
%foreign "C:memcpy,libc"
prim__memcpyStr : AnyPtr -> String -> Int64 -> PrimIO ()

export
stringRef : String -> ScopedIO a' (Ref a' Bits8)
stringRef s = do
  let len = strLength s
  ptr <- primIO $ prim__malloc . (+ 1) $ cast len
  defer (primIO $ prim__free ptr)
  primIO $ prim__memcpyStr ptr s (cast len)
  -- i loooooove c strings <3
  _ <- primIO $ prim__ptrWrite8 (prim__offsetPtr ptr (cast len)) 0
  pure $ unsafePtrRef $ prim__castPtr ptr

```


```idris

testNewRefInt : ScopedIO a' (Ref a' Int)
testNewRefInt = newRef 25

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

testScope1 : IO Int
testScope1 = runScopedIO $ \a' => do
  x <- newRef { cty = Int } $ the Int 10
  runSubScopedIO a' $ \b', _ => do
    readRef x

failing "Can't solve constraint"
  testScope2 : IO Int
  testScope2 = runScopedIO $ \a' => do
    x <- runSubScopedIO a' $ \b', _ => do
      newRef { cty = Int } $ the Int 10
    readRef x

failing "Can't solve constraint"
  testScope3 : IO Int
  testScope3 = runScopedIO $ \a' => do
    x <- runSubScopedIO a' $ \b', _ => do
      newRef { cty = Int } $ the Int 10
    runSubScopedIO a' $ \b', _ => do
      readRef x

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
