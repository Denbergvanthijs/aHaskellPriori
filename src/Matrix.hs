-- | Module Matrix bevat alle code van de oude opzet voor het Apriori algoritme.
--   Na verloop van tijd bleek het per keer berekenen van de support, confidence en lift snel genoeg.
--   Het van te voren berekenen van de waardes in de verschillende matrixen blijkt dus niet nodig.

module Matrix where

import          Lib
import          Tools
import          Datatypes

import          Data.Set (Set, singleton, toAscList, size, union)
import          Data.Matrix (Matrix, zero)
import qualified Data.Matrix                   as Matrix

-- | Returned de lengte van een set
setLen :: Set a -> Int
setLen = size

-- | Genereerd een leeg matrix met de lengtes van het aantal unieke producten in een dataset
---  Dit matrix kan vervolgens worden gevuld met data die elders wordt berekend
emptySupportMatrix :: Num b => Set a -> Matrix b
emptySupportMatrix a = zero (setLen a) (setLen a)

-- | Berekend alle unieke combinaties tussen setX en transacties
-- zipSupport setX transacties = zip (replicate (setLen $ recursiveUnion transacties) setX) [ singleton y | y <- toAscList $ recursiveUnion transacties ]

-- | Berekend alle sets tussen setX en transacties
--   Als er per product een unionZip word berekend zijn er genoeg gegevens om het volledige matrix te vullen.
-- unionZip setX transacties = [ a `union` b | (a, b) <- zipSupport setX transacties ] -- Alle unieke combinaties met x
