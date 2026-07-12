import Control.Monad.Either
import Control.Monad.Trans
import Data.Buffer
import Data.Either
import System
import System.File.Buffer
import System.File.ReadWrite

import Graphics.Wavefront

import Utils.CTypes

dbg : Show a => a -> a
dbg x = unsafePerformIO $ do
  putStrLn "dbg: \{ show x }\n"
  pure x

public export
Result : Type -> Type
Result a = Either String a

tris2buf : HasIO io => List (Face 3 Vec3) -> io (Result Buffer)
tris2buf tris = runEitherT $ do
  buf <- MkEitherT $ maybeToEither "failed to alloc" <$> newBuffer (9 * 4 * (cast { to = Int } $ length tris))
  _ <- lift $ foldlM (\i, x => setFace buf i x >> pure (i + 1)) 0 tris
  pure buf
  where
  setList : Buffer -> Int -> List Double -> io ()
  setList buf i xs = do
    _ <- foldlM (\i', x => setFloat buf (cast i') x >> pure (i' + 1)) i xs
    pure ()

  setFace : Buffer -> Int -> Face 3 Vec3 -> io ()
  setFace buf idx tri = do
    (setList buf (idx * 9) $ toList $ Data.Vect.concat tri.v) >> pure ()



load : HasIO io => String -> io (Result Buffer)
load file = runEitherT $ do
  x <- MkEitherT $ mapFst show <$> readFile file
  lift $ putStrLn "read file"
  Just parsed <- pure $ parseObj x
    | Nothing => left "failed to parse"
  lift $ putStrLn "parsed"
  Just tris <- pure $ (parsed).tris
    | Nothing => left "failed to build tris"
  lift $ putStrLn "tris"

  MkEitherT $ tris2buf $ tris

main : IO ()
main = do
  -- _::arg::_ <- getArgs
    -- | _ => putStrLn "incorrect number of args"
  Right buf <- load "data/bunny.obj"
    | Left err => putStrLn "error: \{ err }"
  Right _ <- writeBufferToFile "data/bunny.obj.bin" buf !(rawSize buf)
    | Left err => putStrLn "error: \{ show err }"

  pure ()
