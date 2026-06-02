import System.FFI
import Data.String

code : String
code =
  """
  (lambda (x y)
    (define-ftype Ret (struct (a int) (b int)))
    (let
      ([ptr (make-ftype-pointer Ret (foreign-alloc (ftype-sizeof Ret)))])
      (ftype-set! Ret (a) ptr x)
      (ftype-set! Ret (b) ptr y)
      ptr
    )
  )
  """

%foreign ""
mkStruct : Int -> Int -> PrimIO AnyPtr

%foreign_impl mkStruct "scheme:\{code}"

%foreign ""
ptr2int : AnyPtr -> Int
%foreign_impl ptr2int "scheme:ftype-pointer-address"

T =
    Struct "T"
        [ ("a", Int)
        , ("b", Bool)
        ]


f : Type -> String
f (Struct a _) = a
f _ = ""

g : Struct a _ -> String
g _ = a

-- %foreign ""
-- mkWGPUBufferBindingLayout : structConsType WGPUBufferBindingLayout
-- %foreign_impl mkWGPUBufferBindingLayout (structConsScheme

-- codegen struct constructor
cgsc : String -> List (String, String) -> String
cgsc name fields =
  let
    a = ?x
    args = joinBy " " (map fst fields)
    fieldsStr = ""
    writes =
      joinBy " " $
      map ((\x => "(ftype-set! \{name} (\{x}) ptr \{x})") . fst) fields
  in """
  (lambda (\{args})
    (define-ftype \{name} (struct \{fieldsStr}))
    (let
      ([ptr (make-ftype-pointer \{name} (foreign-alloc (ftype-sizeof \{name})))])
      \{writes}
      ptr
    )
  )
  """

main : IO ()
main = do
  s <- primIO $ mkStruct 10 2
  putStrLn $ show . ptr2int $ s
