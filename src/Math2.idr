import Data.Vect

interface Monad rt => Runtime rt where
  RTMat : Nat -> Nat -> Type

  neg : RTMat m n -> rt (RTMat m n)

data Ty = TyInt | TyBool | TyFun Ty Ty

interpTy : Ty -> Type
interpTy TyInt       = Integer
interpTy TyBool      = Bool
interpTy (TyFun a t) = interpTy a -> interpTy t

data HasTy : (i : Fin n) -> Vect n Ty -> Ty -> Type where
    Stop : HasTy FZ (t :: ctxt) t
    Pop  : HasTy k ctxt t -> HasTy (FS k) (u :: ctxt) t

data AD : (0 rt : Runtime _) -> Vect n Ty -> Ty -> Type where
    Var : HasType i ctx t -> AD rt ctx t
    -- Val : (x : Integer) -> AD rt ctxt TyInt
    Lam : AD rt (a :: ctx) b -> AD rt ctx (TyFun a b)
    App : AD rt ctx (TyFun a b) -> AD rt ctx a -> AD rt ctx b
    {-
    Op  : (interpTy a -> interpTy b -> interpTy c) ->
          AD rt ctxt a -> AD rt ctxt b -> AD rt ctxt c
    If  : AD rt ctxt TyBool ->
          Lazy (AD rt ctxt a) ->
          Lazy (AD rt ctxt a) -> AD rt ctxt a
    -}

add : (rt : Runtime _) => AD rt ctxt (TyFun TyInt (TyFun TyInt TyInt))
add = Lam (Lam (App (App add' (Var Stop)) (Var (Pop Stop))))
  where
  add' : AD rt _ (TyFun TyInt (TyFun TyInt TyInt))
