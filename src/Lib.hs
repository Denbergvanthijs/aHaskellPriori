module Lib where

import System.IO
import qualified Data.Set as Set
import qualified Data.Matrix as Matrix

someFunc :: IO ()
someFunc = putStrLn "someFunc"

bestandLezen :: FilePath -> IO ()
bestandLezen path = do
                        handle <- openFile path ReadMode
                        contents <- hGetContents handle
                        putStr contents
                        hClose handle

recursiveUnion :: Ord a => [Set.Set a] -> Set.Set a
recursiveUnion [] = Set.empty
recursiveUnion (x:xs) = x `Set.union` recursiveUnion xs

setToAscList :: Set.Set a -> [a]
setToAscList a = Set.toAscList a

setLen :: Set.Set a -> Int
setLen a = length (setToAscList a)

emptySupportMatrix :: Num b => Set.Set a -> Matrix.Matrix b
emptySupportMatrix a = Matrix.zero (setLen a)  (setLen a)