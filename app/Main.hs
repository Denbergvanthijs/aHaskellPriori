module Main where

import Lib
import MatrixLib

import qualified Data.Set as Set

main :: IO ()
main = bestandLezen "data/store_data_short.csv"

-- Variabelen om mee te debuggen
setA = Set.singleton "A"
setB = Set.singleton "B"
setC = Set.singleton "C"
setD = Set.singleton "D"
setE = Set.singleton "E"

setAB = Set.fromList ["A", "B"]
setDB = Set.fromList ["D", "B"]

setT1 = Set.fromList ["A", "B", "C", "D", "E"]
setT2 = Set.fromList ["B", "C", "E"]
setT3 = Set.fromList ["A", "E"]

listTrans = [setT1, setT2, setT3]