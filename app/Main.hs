module Main where

import           Lib

main :: IO ()
main = do
    putStrLn "Typ de bestandslocatie. Standaard is dit: data/store_data_short.csv"
    invoer <-  getLine
    putStrLn ("Bestand openen: " ++ invoer ++ "\n")
    bestandLezen invoer
