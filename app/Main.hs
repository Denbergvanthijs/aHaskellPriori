module Main where

import           Datatypes
import           DatatypesOld
import           Lib
import           Matrix

main :: IO ()
main = do
    putStrLn "Typ de bestandslocatie. Standaard is dit: data/store_data_short.csv"
    invoer <-  getLine
    putStrLn ("Bestand openen: " ++ invoer ++ "\n")
    bestandLezen invoer
