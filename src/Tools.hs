module Tools where

import           Data.Set

import qualified Data.Function as Function
import qualified Data.List     as List
import qualified Data.Ord      as Ord

-- Maakt een set met alle unieke producten in een lijst met transacties
recursiveUnion :: Ord a => [Set a] -> Set a
recursiveUnion []     = empty  -- Lege Set
recursiveUnion xs =  List.foldr union empty xs

-- Veranderd een set met elementen om naar een lijst met elementen
setToAscList :: Ord a => Set a -> [a]
setToAscList = toAscList -- Set.toAscList

-- Veranderd een set met elementen naar een lijst met set per element
setToListOfSets :: Ord a => Set a -> [Set a]
setToListOfSets set = [singleton product | product <- setToAscList set]

-- credits: stackoverflow.com/questions/3275193/whats-the-right-way-to-divide-two-int-values-to-obtain-a-float
floatDiv :: Int -> Int -> Double
floatDiv = (/) `Function.on` fromIntegral

-- Credits: stackoverflow.com/questions/52910840/haskell-finding-maximum-value-in-a-list-of-tuples
-- Returned een tuple met de maximale fst uit een lijst met tuples
listOfTuplesMax :: Ord a => [(a, b)] -> (a, b)
listOfTuplesMax = List.maximumBy (Ord.comparing fst)
