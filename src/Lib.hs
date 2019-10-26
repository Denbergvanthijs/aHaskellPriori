module Lib where

import           Tools

import           Data.Set
import           System.IO

import qualified Data.List as List
import qualified Data.Ord  as Ord

-- | Leest een bestand met transacties in en print iedere transactie
--  credits: https://stackoverflow.com/questions/24234517/understanding-withfile-with-example
bestandLezen :: FilePath -> IO ()
bestandLezen path = do
                        handle <- openFile path ReadMode
                        contents <- hGetContents handle
                        putStr contents
                        hClose handle

-- | Berekend de support van een set: Support(X).
--  De set X kan uit één of meerdere producten bestaan.
support :: Ord a => Set a -> [Set a] -> Double
support setX transacties = length [1 | t <- transacties, setX == (setX `intersection` t)] `floatDiv` length transacties

-- | Berekend de confidence van een set: Confidence(X -> Y)
-- De sets X en Y kunnen uit één of meerdere producten bestaan
confidence :: Ord a => Set a -> Set a -> [Set a] -> Double
confidence setX setY transacties = support (setX `union` setY) transacties / support setX transacties

-- | Berekend de lift van een set: Lift(X->Y)
-- De sets X en Y kunnen uit één of meerdere producten bestaan
lift :: Ord a => Set a -> Set a -> [Set a] -> Double
lift setX setY transacties = confidence setX setY transacties / support setY transacties

-- | Berekend de beste Y voor de formule: Lift(X->Y)
bestLift :: Ord a => Set a -> [Set a] -> (Double, Set a)
bestLift setX transacties = listOfTuplesMax [(lift setX setY transacties, setY) | setY <- setToListOfSets $ recursiveUnion transacties, setY /= setX]
