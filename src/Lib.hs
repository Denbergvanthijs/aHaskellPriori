module Lib where

import System.IO
import qualified Data.Set as Set
import qualified Data.Matrix as Matrix
import qualified Data.Function as Function

--credits: https://stackoverflow.com/questions/24234517/understanding-withfile-with-example
bestandLezen :: FilePath -> IO ()
bestandLezen path = do
                        handle <- openFile path ReadMode
                        contents <- hGetContents handle
                        putStr contents
                        hClose handle

-- Maakt een set met alle unieke producten in een lijst met transacties
recursiveUnion :: Ord a => [Set.Set a] -> Set.Set a
recursiveUnion [] = Set.empty
recursiveUnion (x:xs) = x `Set.union` recursiveUnion xs

-- Veranderd een set met elementen om naar een lijst met elementen
setToAscList :: Set.Set a -> [a]
setToAscList set = Set.toAscList set

-- Veranderd een set met elementen naar een lijst met set per element
setToListOfSets :: Ord a => Set.Set [a] -> [Set.Set a]
setToListOfSets set = [Set.fromList list | list <- setToAscList set]

-- credits: stackoverflow.com/questions/3275193/whats-the-right-way-to-divide-two-int-values-to-obtain-a-float
floatDiv :: Int -> Int -> Double
floatDiv = (/) `Function.on` fromIntegral

-- Berekend de support van een set
calcSupport :: Ord a => Set.Set a -> [Set.Set a] -> Double
calcSupport setX transacties = length [1 | t <- transacties, (setX `Set.intersection` t) == setX] `floatDiv` length transacties

-- Berekend de confidence van (X -> Y)
calcConf :: Ord a => Set.Set a -> Set.Set a -> [Set.Set a] -> Double
calcConf setX setY transacties = (calcSupport (setX `Set.union` setY) transacties) / (calcSupport setX transacties)

-- Berekend de lift van (X->y)
calcLift :: Ord a => Set.Set a -> Set.Set a -> [Set.Set a] -> Double
calcLift setX setY transacties = (calcConf setX setY transacties) / (calcSupport setY transacties)

-- calcBestLift :: Ord a => Set.Set a -> [Set.Set a] -> [Double]
-- calcBestLift setX transacties = [calcLift setX setY transacties | setY <- (setToListOfSets $ recursiveUnion transacties)]
