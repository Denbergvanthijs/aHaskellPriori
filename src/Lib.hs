-- | Module Lib bevat de belangrijkste functies van aHaskellPriori.

module Lib where

import           Tools

import           Data.Set
import           System.IO

import qualified Data.List                     as List
import qualified Data.Ord                      as Ord

-- | Leest een bestand in en print iedere regel
--
--  Credits: <https://stackoverflow.com/questions/24234517/understanding-withfile-with-example>
bestandLezen :: FilePath -> IO ()
bestandLezen path = do
    handle   <- openFile path ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

-- | Berekend de support van één set: Support(X)
--
--  De set X moet uit één of meerdere producten bestaan.
-- Mocht setX leeg zijn, dan is de support gelijk aan 0.0
support :: Ord a => Set a -> [Set a] -> Double
support setX transacties  
    | setX == empty = 0.0
    | otherwise     = length [ 1 | t <- transacties, setX == (setX `intersection` t) ] `floatDiv` length transacties

-- | Berekend de confidence van een set ten opzichte van een andere set: Confidence(X -> Y)
--
-- De sets X en Y moeten uit één of meerdere producten bestaan.
-- Mocht een van de sets leeg zijn, dan is de confidence 0.0.
-- Mocht de support van setX 0.0 zijn, dan is de confidence tevens 0.0.
-- Op deze manier worden zero division errors en NaN-waardes volkomen.
--
-- De variabele `supportX` wordt aangemaakt zodat deze niet opnieuw hoeft te worden berekend bij verschillende guards.
confidence :: Ord a => Set a -> Set a -> [Set a] -> Double
confidence setX setY transacties
    | setX     == empty = 0.0
    | setY     == empty = 0.0
    | supportX == 0.0   = 0.0
    | otherwise         = support (setX `union` setY) transacties / supportX
    where supportX      = support setX transacties

-- | Berekend de lift van een set ten opzichte van een andere set: Lift(X -> Y)
--
-- De sets X en Y moeten uit één of meerdere producten bestaan.
-- Mocht de support van setY 0.0 zijn, dan is de confidence tevens 0.0.
-- Op deze manier worden zero division errors en NaN-waardes volkomen.
--
-- De variabele `supportY` wordt aangemaakt zodat deze niet opnieuw hoeft te worden berekend bij verschillende guards.
lift :: Ord a => Set a -> Set a -> [Set a] -> Double
lift setX setY transacties
    | supportY == 0.0 = 0.0
    | otherwise       = confidence setX setY transacties / supportY
    where supportY    = support setY transacties

-- | Berekend de beste Y voor de formule: Lift(X -> Y)
-- 
-- Ondanks dat meerdere producten een even hoge lift kunnen hbeben met setX zal alleen de laatste (alfabetisch gesoorteerde) waarde worden weergegeven.
bestLift :: Ord a => Set a -> [Set a] -> (Double, Set a)
bestLift setX transacties = listOfTuplesMax
    [ (lift setX setY transacties, setY) | setY <- setToListOfSets $ recursiveUnion transacties, setY /= setX ]
