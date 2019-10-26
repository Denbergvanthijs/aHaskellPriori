-- | Module Tools bevat alle hulpmiddelen om de hoofdfuncties in `Lib` te laten werken.

module Tools where

import           Data.Set hiding (foldr)
import           Data.List (foldr, maximumBy)
import           Data.Function (on)
import           Data.Ord (comparing)

-- | Fold een lijst met transacties zodat alle unieke producten overblijven
--
--   Fold was eerst zelf uitgeschreven:
-- @ recursiveUnion (x:xs) = x \`union\` recursiveUnion xs @
recursiveUnion :: Ord a => [Set a] -> Set a
recursiveUnion [] = empty
recursiveUnion xs = foldr union empty xs

-- | Veranderd een set van elementen naar een gesoorteerde lijst van (Set) singletons
setToListOfSets :: Ord a => Set a -> [Set a]
setToListOfSets set = [ singleton product | product <- toAscList set ]

-- | Deelt twee integers en geeft een float terug
--
--   Credits: <stackoverflow.com/questions/3275193/whats-the-right-way-to-divide-two-int-values-to-obtain-a-float>
floatDiv :: Int -> Int -> Double
floatDiv = (/) `on` fromIntegral

-- | Returned een tuple met de maximale first uit een lijst met tuples
--
--   Credits: <stackoverflow.com/questions/52910840/haskell-finding-maximum-value-in-a-list-of-tuples>
listOfTuplesMax :: Ord a => [(a, b)] -> (a, b)
listOfTuplesMax = maximumBy $ comparing fst
