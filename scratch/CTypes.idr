import System.FFI
import Data.String
import Data.List.Quantifiers

%cg chez extraRuntime=./src/scheme/utils.ss

public export
WGPUSType : Type
WGPUSType = Int32

public export
WGPUChainedStruct : Type
WGPUChainedStruct = Struct
      "WGPUChainedStruct"
      [ ("next", Ptr (Struct "WGPUChainedStruct" []))
      , ("sType",  (WGPUSType))
      ]

data Float : Type where

data FTypeArray : Int -> Type -> Type where

public export
GLFWgamepadstate : Type
GLFWgamepadstate = Struct "GLFWgamepadstate" [("buttons",  (FTypeArray 15 (Bits8))),("axes",  (FTypeArray 6 (Float)))]

partial
structConsType : (Type -> Type) -> Type -> Type
structConsType wrap (Struct name fields) = go (Struct name []) fields
  where
    go : Type -> List (String, Type) -> Type
    go end [] = wrap end
    go end ((_, x)::xs) = x -> (go end xs)
structConsType _ _ = idris_crash "only works with struct!!"

%export
%foreign ""
schemeMemcpy : AnyPtr -> AnyPtr -> Int64 -> PrimIO ()
%foreign_impl schemeMemcpy "scheme:(foreign-procedure \"memcpy\" (void* void* size_t) void*)"

%foreign ""
schemeSet : AnyPtr -> PrimIO ()
%foreign_impl schemeSet """
scheme:
(lambda (x)
  (foreign-set! 'unsigned-8 x 0 1)
  (foreign-set! 'unsigned-8 x 1 2)
  (foreign-set! 'unsigned-8 x 2 3)
  (foreign-set! 'unsigned-8 x 3 4)
)
"""

%foreign ""
schemeRef : AnyPtr -> PrimIO Bits32
%foreign_impl schemeRef """
scheme:
(lambda (x)
  (foreign-ref 'unsigned-32 x 0)
)
"""

testMemcpy : IO ()
testMemcpy = do
  x <- malloc 10
  y <- malloc 10
  primIO $ schemeSet x
  putStrLn $ show $ !(primIO $ schemeRef x)
  putStrLn $ show $ !(primIO $ schemeRef y)
  primIO $ schemeMemcpy y x 10
  putStrLn $ show $ !(primIO $ schemeRef x)
  putStrLn $ show $ !(primIO $ schemeRef y)

partial
ty2ftype : Type -> String
ty2ftype Int8 = "integer-8"
ty2ftype Bits8 = "unsigned-8"
ty2ftype Int16 = "integer-16"
ty2ftype Bits16 = "unsigned-16"
ty2ftype Int32 = "integer-32"
ty2ftype Bits32 = "unsigned-32"
ty2ftype Int64 = "integer-64"
ty2ftype Bits64 = "unsigned-64"
ty2ftype (Ptr (Struct _ [])) = "void*"
-- ty2ftype _ = idris_crash "unknown type"

NULL : Ptr t
NULL = (prim__castPtr prim__getNullAnyPtr)

ptr2int : Ptr _ -> Int
ptr2int = believe_me

partial
public export
-- partial
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
      ty2ftype (Struct _ fields) = "(struct \{ joinBy " " $ fielddecls fields })"
      ty2ftype (FTypeArray n ty) = "(array \{ show n } \{ ty2ftype ty }"
      ty2ftype (Ptr (Struct _ [])) = "void*"
      ty2ftype (Ptr _) = "void*"
      ty2ftype _ = ""

      -- partial
      fielddecls : List (String, Type) -> List String
      fielddecls fields = map (\(fname, ty) => "(\{fname} \{ty2ftype ty})") fields

    fieldset : (String, Type) -> String
    fieldset (fname, FTypeArray n ty) =
      """
      (memset (ftype-&ref \{ name } (\{ fname }) ptr) (* \{ show $ n } (ftype-sizeof \{ ty2ftype ty })))
      """
    fieldset (fname, ty) = "(ftype-set! \{ name } (\{ fname }) ptr \{ fname })"

    fieldsets : List String
    fieldsets = map fieldset fields

allocStructPrimCodegen _ = idris_crash "allocStructCodegen called on non-struct!"

hlistFnTy : List Type -> Type -> Type
hlistFnTy [] out = out
hlistFnTy (x::xs) out = x -> hlistFnTy xs out

hlistApply : hlistFnTy args out -> HList args -> out
hlistApply f []      = f
hlistApply f (x::xs) = hlistApply (f x) xs

partial
allocStructHListType : Type -> Type
allocStructHListType (Struct name fields) =
    HList (map snd fields) -> (IO $ Ptr $ Struct name [])

partial
allocStructPrimType : Type -> Type
allocStructPrimType (Struct name fields) =
    hlistFnTy (map snd fields) (PrimIO $ Ptr $ Struct name [])

%foreign ""
prim__allocStructWGPUChainedStruct : allocStructPrimType WGPUChainedStruct
%foreign_impl prim__allocStructWGPUChainedStruct (allocStructPrimCodegen WGPUChainedStruct)

interface AllocStruct a where
    allocStruct : allocStructHListType a

AllocStruct WGPUChainedStruct where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUChainedStruct xs

test : IO ()
test = do
    x <- primIO $ prim__allocStructWGPUChainedStruct NULL 10
    putStrLn $ show $ ptr2int x
    free (prim__forgetPtr x)

data X = A | B String

%foreign ""
f1 : Type -> Int -> PrimIO Int
%foreign_impl f1 "scheme:(lambda (x y) (display x) 10)"

