import Data.Vect
import Data.List.Quantifiers

{-
data Matrix : (t : Type) -> (m : Nat) -> (n : Nat) -> Type where
  MkMatrix : { auto 0 _ : Type } -> (m : Nat) -> (n : Nat) -> Vect (m * n) t -> Matrix t m n


DMatrix : Nat -> Nat -> Type
DMatrix m n = Matrix Double m n

record Math (t : Type) where
  constructor MkMath
  f : () -> t

interface Math r where
  -- unary
  neg : Mat m n -> r (Mat m n)
  inv : Mat m n -> r (Mat m n)
  sqrt : Mat m n -> r (Mat m n)
  sin : Mat m n -> r (Mat m n)
  cos : Mat m n -> r (Mat m n)
  exp : Mat m n -> r (Mat m n)
  ln : Mat m n -> r (Mat m n)
  abs : Mat m n -> r (Mat m n)

  -- elementwise binary
  add : Mat m n -> Mat m n -> r (Mat m n)
  mul : Mat m n -> Mat m n -> r (Mat m n)
  min : Mat m n -> Mat m n -> r (Mat m n)
  max : Mat m n -> Mat m n -> r (Mat m n)

  -- binary
  prod : Mat m n -> Mat n k -> r (Mat m k)
  -}

public export
data Ty
  = TMat Nat Nat
  | TScalar
  | TBool
  | TFun Ty Ty

public export
data HasTy : (i : Fin n) -> Vect n Ty -> Ty -> Type where
  Stop : HasTy FZ (t :: ctx) t
  Pop : HasTy k ctx t -> HasTy (FS k) (u :: ctx) t


{-
record Runtime where
  constructor MkMat
  Mat : (m : Nat) -> (n : Nat) -> Type
  -}

{-
interface Monad rt => Runtime rt where
  RTMat : Nat -> Nat -> Type

  -- neg : RTMat m n -> rt (RTMat m n)

public export
Mat' : Runtime rt -> Nat -> Nat -> Type

public export
data AD : (0 rt : Runtime _) -> Vect n Ty -> Ty -> Type where
    Var : HasTy i ctx d -> AD rt ctx d
  --Mat : (rt : Runtime _) => (x : Mat' rt m n) -> AD rt ctx (TMat m n)
  --Scalar : (rt : Runtime _) => (x : Double) -> AD rt ctx TScalar
    Lam : AD rt (a :: ctx) b -> AD rt ctx (TFun a b)

    Let : AD rt ctx a -> AD rt (a::ctx) b -> AD rt ctx b

    App : AD rt ctx (TFun a b) -> AD rt ctx a -> AD rt ctx b
  -- If : (rt : Runtime _) => AD rt ctx TBool -> Lazy (AD rt ctx a) -> Lazy (AD rt ctx a) -> AD rt ctx a


add : (rt : Runtime _) => AD rt ctx (TFun TScalar (TFun TScalar TScalar))
add = Lam (Lam (App (App add' (Var Stop)) (Var (Pop Stop))))
  where
  add' : AD rt _ (TFun TScalar (TFun TScalar TScalar))

let' : (rt : Runtime _ ) => AD rt ctx a -> (AD rt (a::ctx) a -> AD rt (a::ctx) b) -> AD rt ctx b
let' bound body = Let bound (body $ Var Stop)

lam' :
  (rt : Runtime _ ) =>
  (AD rt (a::ctx) a -> AD rt (a::ctx) b) ->
   AD rt ctx (TFun a b)
lam' body = Lam (body $ Var Stop)
-}

record Runtime (Buf : Type) (f : Type -> Type) where
  constructor MkRuntime
  MkBuf : List Double -> f Buf

  neg : Buf -> f Buf
  abs : Buf -> f Buf

  add : Buf -> Buf -> f Buf

  prod : Buf -> Buf -> f Buf

data HasSize : (siz : Nat) -> Ty -> Type where
  Flatten : (m : Nat) -> (n : Nat) -> HasSize (m * n) (TMat m n)


data Expr : (0 rt : Runtime _ _) -> Vect n Ty -> Ty -> Type where
  Mat    : (0 rt : Runtime _ _) => buf -> (m : Nat) -> (n : Nat) -> Expr rt ctx (TMat m n)
  Scalar : (0 rt : Runtime _ _) => (x : Double) -> Expr rt ctx TScalar

  Var : (0 rt : Runtime _ _) => HasTy i ctx d -> Expr rt ctx d
  Let    : Expr rt ctx a -> Expr rt (a::ctx) b -> Expr rt ctx b
  App : Expr rt ctx (TFun a b) -> Expr rt ctx a -> Expr rt ctx b

  Prim1  : (0 rt : Runtime buf f) => (buf -> f buf) -> Expr rt ctx (TFun a b)
  Prim2  : (0 rt : Runtime buf f) => (buf -> buf -> f buf) -> Expr rt ctx (TFun a b)


rawbuf :
  (rt : Runtime buf f) =>
  Expr rt ctx c -> f buf

split :
  (Monad f) =>
  (rt : Runtime _ f) =>
  HasSize j a =>
  HasSize k b =>
  HasSize (j * k) c =>
  Expr rt ctx c -> f (Expr rt ctx a, Expr rt ctx b)
split buf = do
  buf' <- rawbuf buf
  pure ?a

{-
record Math a where
  f : () -> ()

neg : (rt : Runtime _ _) => Expr rt ctx (TMat m n) -> Expr rt ctx (TMat m n)
neg = App (Prim1 rt.neg)

add : (rt : Runtime _ _) => Expr rt ctx (TMat m n) -> Expr rt ctx (TMat m n) -> Expr rt ctx (TMat m n)
add a = App (App (Prim2 rt.add) a)

prod : (rt : Runtime _ _) => Expr rt ctx (TMat m n) -> Expr rt ctx (TMat m n) -> Expr rt ctx (TMat m n)
prod a = App (App (Prim2 rt.prod) a)


record Math ctx a where
  constructor MkMath
  go : () -> a

var : Expr rt ctx a -> Math (a::ctx) (Expr rt (a::ctx) a)





-- reverse : Expr _ _ (TFun _ TScalar)
-}

{-
nn : Vect 3 (Expr ...) -> Expr -> Expr
nn [w1, w2, w3] x = do
  l1 <- prod x  w1 >>= relu
  l2 <- prod l1 w2 >>= relu
  l3 <- prod l2 w3 >>= relu
  pure l3
  where
    relu x = max (const 0) x

grad : Expr _ _ (funOf list) -> Double ->

step : Vect 2 Buf -> Buf
step w nn batch = do
  w <- vars
-}




