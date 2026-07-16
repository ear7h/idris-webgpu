
data Lifetime : Type where
  LRoot : (0 thr : Type) -> Lifetime
  LSub  : (0 thr : Type) -> (0 _ : Lifetime) -> Lifetime

data Ref : Lifetime -> Type -> Type where

data AtLeastAsLong : Lifetime -> Lifetime -> Type where
  ALALSame   : AtLeastAsLong a' a'
  ALALParent : AtLeastAsLong a' (LSub b a')
  ALALTrans  : AtLeastAsLong a' b' -> AtLeastAsLong b' c' -> AtLeastAsLong a' c'

doThing : { auto p : AtLeastAsLong a' b' } -> Ref a' Int -> Ref b' Int

main : Int
main =
  let r1    = the (Ref (LRoot Void) Int) $ believe_me 1
  in let r2 = the (Ref (LRoot Void) Int) $ doThing r1
  in let r3 = the (Ref (LSub Void (LRoot Void)) Int) $ doThing r1
  in 10
