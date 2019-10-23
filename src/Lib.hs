module Lib where

import           Tools

import           Data.Set
import           System.IO

import qualified Data.List as List
import qualified Data.Ord  as Ord

--credits: https://stackoverflow.com/questions/24234517/understanding-withfile-with-example
bestandLezen :: FilePath -> IO ()
bestandLezen path = do
                        handle <- openFile path ReadMode
                        contents <- hGetContents handle
                        putStr contents
                        hClose handle

-- Berekend de support van een set
calcSupport :: Ord a => Set a -> [Set a] -> Double
calcSupport setX transacties = length [1 | t <- transacties, setX == (setX `intersection` t)] `floatDiv` length transacties

-- Berekend de confidence van (X -> Y)
calcConf :: Ord a => Set a -> Set a -> [Set a] -> Double
calcConf setX setY transacties = (calcSupport (setX `union` setY) transacties) / (calcSupport setX transacties)

-- Berekend de lift van (X->y)
calcLift :: Ord a => Set a -> Set a -> [Set a] -> Double
calcLift setX setY transacties = (calcConf setX setY transacties) / (calcSupport setY transacties)

calcBestLift :: Ord a => Set a -> [Set a] -> (Double, Set a)
calcBestLift setX transacties = listOfTuplesMax [(calcLift setX setY transacties, setY) | setY <- setToListOfSets $ recursiveUnion transacties, setY /= setX]
