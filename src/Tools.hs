-- | Module Tools bevat alle hulpmiddelen om de hoofdfuncties in `Lib` te laten werken.

module Tools where

import           Data.List.Split (splitOn)
import           Data.Function (on)
import           Data.List     (foldr, maximumBy)
import           Data.Ord      (comparing)
import           Data.Set      hiding (foldr)
import           Datatypes

-- | Fold Transacties naar Transactie zodat alle unieke producten overblijven
--
--   Fold was eerst zelf uitgeschreven:
-- @ recursiveUnion (x:xs) = x \`union\` recursiveUnion xs @
recursiveUnion :: Transacties -> Transactie
recursiveUnion (Transacties ts) = foldr vereniging (Transactie empty) ts

-- | Veranderd Transactie naar een gesoorteerde lijst van Producten
setToListOfSets :: Transactie -> [Product]
setToListOfSets (Transactie t) = toAscList t

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

-- | Returned de vereniging van twee Transactie
vereniging :: Transactie -> Transactie -> Transactie
vereniging (Transactie set1) (Transactie set2) = Transactie $ union set1 set2

-- | Returned de intersectie van twee Transactie
intersectie :: Transactie -> Transactie -> Transactie
intersectie (Transactie set1) (Transactie set2) = Transactie $ intersection set1 set2

-- | Zet een csv-bestand om naar een bestand met lijsten van Strings.
-- Naast een bestand wordt er gevraagd naar een separator. Dit maakt de functie inzetbaar voor verschillende bestanden.
bestandSplit :: String -> String -> [[String]]
bestandSplit file sep = [splitOn sep t | t <- lines file]

-- | Zet een bestand met lijsten van Strings om naar het Transacties-datatype.
-- Iedere lijst van Strings wordt eerst een Transactie met Producten.
bestandTrans :: [[String]] -> Transacties
bestandTrans file = Transacties [Transactie $ fromList [Product p | p <- t] | t <- file]
