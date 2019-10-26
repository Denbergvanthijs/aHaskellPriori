-- | Module Matrix bevat alle code van de oude opzet voor het Apriori algoritme.
--   Na verloop van tijd bleek het per keer berekenen van de support, confidence en lift snel genoeg.
--   Het van te voren berekenen van de waardes in de verschillende matrixen blijkt dus niet nodig.

module Matrix where

import           Lib
import           Tools

import qualified Data.Matrix                   as Matrix
import qualified Data.Set                      as Set

-- | Returned de lengte van een set
setLen :: Set.Set a -> Int
setLen = Set.size

-- | Genereerd een leeg matrix met de lengtes van het aantal unieke producten in een dataset
---  Dit matrix kan vervolgens worden gevuld met data die elders wordt berekend
emptySupportMatrix :: Num b => Set.Set a -> Matrix.Matrix b
emptySupportMatrix a = Matrix.zero (setLen a) (setLen a)

-- | Berekend alle unieke combinaties tussen setX en transacties
zipSupport setX transacties = zip (replicate (setLen $ recursiveUnion transacties) setX) [ Set.singleton y | y <- Set.toAscList $ recursiveUnion transacties ]

-- | Berekend alle sets tussen setX en transacties
--   Als er per product een unionZip word berekend zijn er genoeg gegevens om het volledige matrix te vullen.
unionZip setX transacties = [ a `Set.union` b | (a, b) <- zipSupport setX transacties ] -- Alle unieke combinaties met x
