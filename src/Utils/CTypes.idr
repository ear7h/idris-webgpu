-- TODO: rename FFI
module Utils.CTypes

import Data.Buffer
-- import public System.FFI
import public Data.String
import public Data.List.Quantifiers

import public System.ScopedIO

%cg chez extraRuntime=src/scheme/utils.ss

-- export data CArray : Int -> Type -> Type where

export
trace : Show a => a -> a
trace x = unsafePerformIO $ do
  putStrLn $ show x
  pure x

public export
Enum : Type
Enum = Bits32

public export
CChar : Type
CChar = Bits8

public export
CUnsignedChar : Type
CUnsignedChar = Bits8

public export
CShort : Type
CShort = Int16

public export
CUnsignedShort : Type
CUnsignedShort = Bits16

public export
CInt : Type
CInt = Int32

public export
CUnsignedInt : Type
CUnsignedInt = Bits32

public export
data Float : Type where

%foreign "scheme:(lambda (buf loc val) (bytevector-ieee-single-set! buf loc val (native-endianness)))"
prim__setFloat : Buffer -> Int -> Double -> PrimIO ()

export
setFloat : HasIO io => Buffer -> Int -> Double -> io ()
setFloat buf i x = primIO $ prim__setFloat buf (i*4) x

export
NULL : Ptr t
NULL = (prim__castPtr prim__getNullAnyPtr)

export
ptr2int : Ptr _ -> Int64
ptr2int = believe_me

-- %foreign ""
-- memcpy : AnyPtr -> AnyPtr -> Int -> PrimIO ()
-- %foreign_impl memcpy "scheme:ear7h-memcpy"

-- %foreign ""
-- schemeMemcpy : AnyPtr -> AnyPtr -> Int64 -> PrimIO ()
-- %foreign_impl schemeMemcpy """

export
%foreign "C:memcpy,libc"
prim__memcpy : AnyPtr -> AnyPtr -> Int -> PrimIO ()


%foreign "C:memcpy,libc"
prim__memcpyString : AnyPtr -> String -> Int -> PrimIO ()

export
string2bytes : HasIO io => String -> io $ Ptr Bits8
string2bytes s = do
  ptr <- malloc $ strLength s
  primIO $ prim__memcpyString ptr s (cast $ strLength s)
  pure $ prim__castPtr ptr

export
%foreign ""
schemeDisplay : String -> PrimIO ()
%foreign_impl schemeDisplay "scheme: (lambda (x) (display x))"

partial
public export
allocStructPrimCodegen : Type -> String
allocStructPrimCodegen (Struct name fields) = """
scheme:
(lambda (\{joinBy " " $ map fst fields })
  ; (define-ftype \{name} \{ty2ftype $ Struct name fields})
  (display \"alloc \{ name }\\n\")
  (let
    ([ptr (make-ftype-pointer \{name} (foreign-alloc (ftype-sizeof \{name})))])
    \{ joinBy "\n    " fieldsets }
    (display "returning: ")
    (display ptr)
    (display " ")
    (display (ftype-pointer-address ptr))
    (display "\n")
    ptr ; (ftype-pointer-address ptr)
  )
)
"""
    where
    mutual
      -- partial
      public export
      ty2ftype : Type -> String
      ty2ftype Int8 = "integer-8"
      ty2ftype Bits8 = "unsigned-8"
      ty2ftype Int16 = "integer-16"
      ty2ftype Bits16 = "unsigned-16"
      ty2ftype Int32 = "integer-32"
      ty2ftype Bits32 = "unsigned-32"
      ty2ftype Int64 = "integer-64"
      ty2ftype Bits64 = "unsigned-64"
      ty2ftype Double = "double-float"
      ty2ftype Float = "single-float"
      ty2ftype (Ptr (Struct _ [])) = "void*"
      ty2ftype (Ptr _) = "void*"
      ty2ftype (Struct _ fields) = "(struct \{ joinBy " " $ fielddecls fields })"
      ty2ftype (CArray n ty) = "(array \{ show n } \{ ty2ftype ty }"
      ty2ftype (_ -> _) = "void*"
      ty2ftype _ = ""

      -- partial
      public export
      fielddecls : List (String, Type) -> List String
      fielddecls fields = map (\(fname, ty) => "(\{fname} \{ty2ftype ty})") fields

    partial
    public export
    fieldset : (String, Type) -> String
    fieldset (fname, CArray n ty) =
      """
      (memcpy
          (ftype-pointer-address (ftype-&ref \{ name } (\{ fname }) ptr))
          (ftype-pointer-address \{ fname })
          (* \{ show $ n } (ftype-sizeof \{ ty2ftype ty })))
      """
    fieldset (fname, Struct n tys) =
      """
      (memcpy
          (ftype-pointer-address (ftype-&ref \{ name } (\{ fname }) ptr))
          (ftype-pointer-address \{ fname })
          (ftype-sizeof \{ n }))
      """
    fieldset (fname, ty) = "(ftype-set! \{ name } (\{ fname }) ptr \{ fname })"

    partial
    public export
    fieldsets : List String
    fieldsets = map fieldset fields

allocStructPrimCodegen _ = ""

public export
hlistFnTy : List Type -> Type -> Type
hlistFnTy [] out = out
hlistFnTy (x::xs) out = x -> hlistFnTy xs out

public export
hlistApply : hlistFnTy args out -> HList args -> out
hlistApply f []      = f
hlistApply f (x::xs) = hlistApply (f x) xs

public export
partial
allocStructHListType : Type -> Type
allocStructHListType (Struct name fields) =
    HList (map snd fields) -> (IO $ Struct name fields)

public export
partial
allocStructPrimType : Type -> Type
allocStructPrimType (Struct name fields) =
    hlistFnTy (map snd fields) (PrimIO $ Struct name fields)

public export
interface AllocStruct a where
    allocStruct : allocStructHListType a

export
data Scope : Type -> Type where
    MkScope : IO (List AnyPtr, a) -> Scope a

export
Functor Scope where
  map f (MkScope ma) = MkScope $
    map (\(l, x) => (l, f x)) ma

export
Applicative Scope where
  pure a = MkScope $ pure ([], a)
  (<*>) (MkScope mf) (MkScope ma) = MkScope $ do
    (l1, f) <- mf
    (l2, a) <- ma
    pure (l1 ++ l2, f a)

export
Monad Scope where
  (>>=) (MkScope ma) fmb = MkScope $ do
    (l1, a) <- ma
    (MkScope mb) <- pure $ fmb a
    (l2, b) <- mb
    pure (l1 ++ l2, b)

export
HasIO Scope where
    liftIO ma = MkScope (map (\x => ([], x)) ma)

export
runScoped : Scope a -> IO a
runScoped (MkScope m) = do
  (l, x) <- m
  putStrLn "freeing"
  traverse_ free l
  pure x

export
cleanup : Ptr t -> Scope $ Ptr t
cleanup ptr = MkScope $ pure ([prim__forgetPtr ptr], ptr)

%foreign ""
prim__toPtr : () -> PrimIO $ Ptr $ ()
%foreign_impl prim__toPtr """
scheme:
ftype-pointer-address
"""

export
%foreign ""
buf2ptr : Buffer -> PrimIO $ AnyPtr
%foreign_impl buf2ptr """
scheme:
object->reference-address
"""

export
toPtr : HasIO io => Struct name fields -> io $ Ptr $ Struct name fields
toPtr p = do
  ret <- primIO $ prim__toPtr $ believe_me p
  pure $ believe_me ret

export
alloc : AllocStruct (Struct name fields) =>
        HList (map Builtin.snd fields) ->
        (Scope $ Struct name fields)
alloc args = do
  ret <- liftIO $ allocStruct { a = Struct name fields } args
  _ <- (toPtr ret) >>= cleanup
  pure ret

export
alloc' : AllocStruct (Struct name fields) =>
        HList (map Builtin.snd fields) ->
        (Scope $ Ptr $ Struct name fields)
alloc' args = (alloc args) >>= toPtr


