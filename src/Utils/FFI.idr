-- TODO: rename FFI
module Utils.FFI

import Data.Buffer
-- import public System.FFI
import public Data.String
import public Data.List.Quantifiers

import public System.ScopedIO

export
trace : Show a => a -> a
trace x = unsafePerformIO $ do
  putStrLn $ show x
  pure x

public export
Enum : Type
Enum = Bits32

export
NULL : Ptr t
NULL = (prim__castPtr prim__getNullAnyPtr)

export
mkNULL : (t : Type) -> Ptr t
mkNULL _ = (prim__castPtr prim__getNullAnyPtr)

export
ptr2int : Ptr _ -> Int64
ptr2int = believe_me

export
%foreign "scheme: (lambda (x) (display x))"
schemeDisplay : String -> PrimIO ()

export
%foreign "scheme: object->reference-address"
buf2ptr : Buffer -> PrimIO $ AnyPtr

