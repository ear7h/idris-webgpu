module Graphics.Wavefront

import public Data.Vect
import Data.String
import Data.List.Elem
import Data.List1

dbg : Show a => a -> a
dbg x = unsafePerformIO $ do
  putStrLn "dbg: \{ show x }\n"
  pure x

dbg' : Show a => String -> a -> a
dbg' msg x = unsafePerformIO $ do
  putStrLn "dbg: \{ msg } \{ show x }"
  pure x

public export
Vec3 : Type
Vec3 = Vect 3 Double

public export
Vec4 : Type
Vec4 = Vect 4 Double

public export
record Face (n : Nat) (t : Type) where
  constructor MkFace
  v : Vect n t
  vt : Maybe $ Vect n t
  vn : Maybe $ Vect n t

public export
record Obj where
  constructor MkObj
  v : List Vec4
  vt : List Vec3
  vn : List Vec3
  f : List $ (n ** Face n Int)
  -- TODO: vp and l

export
Show t => Show (Face _ t) where
  show x = "MkFace{v: \{ show x.v }, vt: \{ show x.vt }, vn: \{ show x.vn }}"

export
Show Obj where
  show x = "MkObj{v: \{ show x.v }, vt: \{ show x.vt }, vn: \{ show x.vn }}"

only : Alternative m => Bool -> Lazy a -> m a
only True v = pure v
only False _ = empty

export
(.tris) : Obj -> Maybe $ List $ Face 3 Vec3
(.tris) o =
  let
    vl  = dbg $ cast { to = Int } $ length o.v
    vtl = dbg $ cast { to = Int } $ length o.vt
    vnl = dbg $ cast { to = Int } $ length o.vn
  in traverse (go (vl, vtl, vnl) o) o.f
  where
  -- 1-index
  mbindex : Show t => List t -> Int -> Int -> Maybe t
  mbindex xs l n = getAt !(only (n > 0) $ cast $ (l - n)) xs

  mbtranspose : Maybe (Maybe a) -> Maybe (Maybe a)
  mbtranspose Nothing = Just Nothing
  mbtranspose (Just Nothing) = Nothing
  mbtranspose (Just (Just x)) = Just (Just x)

  go : (Int, Int, Int) -> Obj -> (n ** Face n Int) -> Maybe $ Face 3 Vec3
  go (vl, vtl, vnl) o (3 ** x) =
    do
    -- TODO: normalize the homogeneous coordinates? probably not bc default 0
    v <- traverse (map (take 3) . mbindex o.v vl) x.v
    vt <- mbtranspose $ map (traverse $ mbindex o.vt vtl) x.vt
    vn <- mbtranspose $ map (traverse $ mbindex o.vn vnl) x.vn
    pure $ MkFace v vt vn

  go _ o (_ ** x) = Nothing

parseFace : Vect n String -> Maybe $ Face n Int
parseFace [] = Nothing
parseFace (x::[]) = do
  x1 <- Just $ split (== '/') x
  x2 <- traverse (\x => if x == "" then Just 0 else parseInteger x) x1
  case x2 of
    v:::[]       => Just $ MkFace [v] Nothing     Nothing
    v:::[vt]     => Just $ MkFace [v] (Just [vt]) Nothing
    v:::[0 , vn] => Just $ MkFace [v] Nothing     (Just [vn])
    v:::[vt, vn] => Just $ MkFace [v] (Just [vt]) (Just [vn])
    _            => Nothing
parseFace (x::xs) = do
  rec <- parseFace xs
  go rec x
  where
  go : (Face k Int) -> String -> Maybe (Face (S k) Int)

  go (MkFace vs Nothing Nothing) line = do
    v <- parseInteger line
    pure $ MkFace (v::vs) Nothing Nothing

  go (MkFace vs (Just vts) Nothing) line = do
    v:::[vt] <- traverse parseInteger $ split (== '/') line
      | _ => Nothing
    pure $ MkFace (v::vs) (Just $ vt::vts) Nothing

  go (MkFace vs Nothing (Just vns)) line = do
    v:::[0, vn] <- traverse (\x => if x == "" then pure (the Int 0) else parseInteger x) $ split (== '/') line
      | _ => Nothing
    pure $ MkFace (v::vs) Nothing (Just $ vn::vns)

  go (MkFace vs (Just vts) (Just vns)) line = do
    v:::[vt, vn] <- traverse parseInteger $ split (== '/') line
      | _ => Nothing
    pure $ MkFace (v::vs) (Just $ vt::vts) (Just $ vn::vns)

public export
parseObj : String -> Maybe Obj
parseObj = foldlM go (MkObj [] [] [] []) . map words . filter (not . isPrefixOf "#") . lines
  where
  rev : Obj -> Obj
  rev = { v $= reverse, vt $= reverse, vn $= reverse}

  fill0 : (m : Nat) -> { auto p : LTE n m } -> Vect n Double -> Vect m Double
  fill0 m xs = let

    ret =
      xs ++
      (the (Vect (minus m n) _ ) $
        rewrite sym $ lengthCorrect xs
        in replicate (minus m (length xs)) 0.0
      )

    0 p = the (n + minus m n = m) $
      rewrite sym $ plusCommutative (minus m n) n
      in plusMinusLte n m p

    in rewrite sym p in ret


  go : Obj -> List String -> Maybe Obj
  go acc ("v"::rest) = do
    rest' <- traverse (parseDouble) rest
    x <- toVect 4 rest' <|>
        (fill0 4 <$> toVect 3 rest')
    pure $ { v $= (::) x } acc

  go acc ("vt"::rest) = do
    rest' <- traverse parseDouble rest
    x <- toVect 3 rest' <|>
        (fill0 3 <$> toVect 2 rest') <|>
        (fill0 3 <$> toVect 1 rest')
    pure $ { vt $= (::) x } acc

  go acc ("vn"::rest) = do
    rest' <- traverse parseDouble rest
    x <- toVect 3 rest'
    pure $ { vn $= (::) x } acc

  go acc ("f"::rest) = do
    x <- parseFace $ fromList rest
    pure $ { f $= (::) (length rest ** x) } acc

  go acc _ = Nothing

