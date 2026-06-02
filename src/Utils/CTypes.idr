module Utils.CTypes

import Data.IORef
import Control.Monad.Trans
import public System.FFI
import public Data.String
import public Data.List.Quantifiers

-- %cg chez extraRuntime=src/scheme/utils.ss

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

public export
data FTypeArray : Int -> Type -> Type where

export
NULL : Ptr t
NULL = (prim__castPtr prim__getNullAnyPtr)

export
ptr2int : Ptr _ -> Int
ptr2int = believe_me


-- %foreign ""
-- memcpy : AnyPtr -> AnyPtr -> Int -> PrimIO ()
-- %foreign_impl memcpy "scheme:ear7h-memcpy"

%foreign ""
prim__schemeMemcpy : AnyPtr -> AnyPtr -> Int64 -> PrimIO ()
%foreign_impl schemeMemcpy "scheme:(foreign-procedure \"memcpy\" (void* void* size_t) void*)"

export
string2bytes : String -> IO $ Ptr Bits8
string2bytes s = do
  ptr <- malloc $ strLength s
  primIO $ schemeMemcpy ptr (believe_me s) (believe_me $ strLength s)
  pure $ believe_me ptr


{-
public export
partial
allocStructPrimCodegen1 : Type -> String
allocStructPrimCodegen1 (Struct name fields) = "abc"
-}

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
  (define-ftype \{name} \{ty2ftype $ Struct name fields}
  (let
    ([ptr (make-ftype-pointer \{name} (foreign-alloc (ftype-sizeof \{name})))])
    \{ joinBy "\n    " fieldsets }
    (ftype-pointer-address ptr)
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
      ty2ftype (FTypeArray n ty) = "(array \{ show n } \{ ty2ftype ty }"
      ty2ftype _ = ""

      -- partial
      public export
      fielddecls : List (String, Type) -> List String
      fielddecls fields = map (\(fname, ty) => "(\{fname} \{ty2ftype ty})") fields

    partial
    public export
    fieldset : (String, Type) -> String
    fieldset (fname, FTypeArray n ty) =
      """
      (memset (ftype-&ref \{ name } (\{ fname }) ptr) (* \{ show $ n } (ftype-sizeof \{ ty2ftype ty })))
      """
    -- cause a compile error :(
    -- idris_crash fails to normalize
    fieldset (fname, Struct n ty) = ":(((((((((((((((("
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
toPtr : Type -> Type
toPtr (FTypeArray n t) = Ptr $ FTypeArray n t
toPtr (Struct name fields) = Ptr $ Struct name fields
toPtr x = x

public export
partial
allocStructHListType : Type -> Type
allocStructHListType (Struct name fields) =
    HList (map (toPtr . snd) fields) -> (IO $ Ptr $ Struct name [])

public export
partial
allocStructPrimType : Type -> Type
allocStructPrimType (Struct name fields) =
    hlistFnTy (map (toPtr . snd) fields) (PrimIO $ Ptr $ Struct name [])

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
  traverse_ free l
  pure x

export
cleanup : Ptr t -> Scope $ Ptr t
cleanup ptr = MkScope $ pure ([prim__forgetPtr ptr], ptr)

alloc : AllocStruct (Struct name fields) =>
        HList (map (Utils.CTypes.toPtr . Builtin.snd) fields) ->
        (Scope $ Ptr $ Struct name [])
alloc = (flip (>>=) cleanup) . liftIO . allocStruct { a = Struct name fields }

-- alloc : HasIO io => io (Ptr t) -> Scope io (Ptr t)


