import System.FFI

public export
I : Type
I = Int32

public export
T : Type
T = Struct
      "T"
      [ ("field", Ptr T)
      , ("num", I)
      ]
