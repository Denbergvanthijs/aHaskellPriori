-- | Module Lib bevat de belangrijkste functies van aHaskellPriori.

module Lib where

import           Tools
import           Datatypes

import           System.IO

import           Data.Set                       (singleton, empty)
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

-- | Berekend de support van één Transactie: Support(X)
--
--  De Transactie X moet één of meerdere Product bevatten.
--  Mocht Transactie X leeg zijn, dan is de support gelijk aan 0.0
support :: Transactie -> Transacties -> Double
support transX (Transacties ts) = length [ 1  | t <- ts, intersectie transX t == transX, transX /= Transactie empty ] `floatDiv` length ts


-- | Berekend de confidence van een Product ten opzichte van een ander Product: Confidence(X -> Y)
--
-- Mocht een van de Producten leeg zijn, dan is de confidence 0.0.
-- Mocht de support van Product X 0.0 zijn, dan is de confidence tevens 0.0.
-- Op deze manier worden zero division errors en NaN-waardes volkomen.
confidence :: Product -> Product -> Transacties -> Double
confidence (Product "") _ _     = 0.0
confidence _ (Product "") _     = 0.0
confidence prodX prodY ts       = support (vereniging (Transactie $ singleton prodX) (Transactie $ singleton prodY)) ts / supportX
    where
        supportX                = support (Transactie $ singleton prodX) ts


-- | Berekend de lift van een Product ten opzichte van een ander Product: Lift(X -> Y)
--
-- Mocht de support van Product Y 0.0 zijn, dan is de confidence tevens 0.0.
-- Op deze manier worden zero division errors en NaN-waardes volkomen.
lift :: Product -> Product -> Transacties -> Double
lift prodX prodY ts
    | supportY == 0.0 = 0.0
    | otherwise       = confidence prodX prodY ts / supportY
    where 
        supportY      = support (Transactie $ singleton prodY) ts

-- | Berekend het beste Product Y voor de formule: Lift(X -> Y)
-- 
-- Ondanks dat meerdere producten een even hoge lift kunnen hebben met setX zal alleen de laatste (alfabetisch gesoorteerde) waarde worden weergegeven.
bestLift :: Product -> Transacties -> (Double , Product)
bestLift prodX ts = listOfTuplesMax [(lift prodX prodY ts, prodY) | prodY <- setToListOfSets $ recursiveUnion ts, prodX /= prodY]