
import System.FFI


%foreign ""
f : Int32 -> Struct "t" [("a", Int32)] -> PrimIO ()
%foreign_impl f """
scheme:
(lambda (x y) (display 10))
"""

main : IO ()
main = do
  primIO $ f 10 (believe_me 10)
