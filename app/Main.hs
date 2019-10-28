module Main where

import           Lib
import           Datatypes
import           Data.Set (Set, singleton)

main :: IO ()
main = do
    -- putStrLn "Typ de bestandslocatie. Standaard is dit: data/store_data_short.csv"
    -- invoerFilePath <-  getLine
    -- putStrLn ("Bestand openen: " ++ invoerFilePath ++ "\n")
    -- bestand <- bestandLezen invoerFilePath
    -- print bestand
    putStrLn "Welk van de volgende dingen wilt u berekenen:"
    putStrLn "1. De support van één product berekenen"
    putStrLn "2. De confidence tussen twee producten berekenen"
    putStrLn "3. De lift tussen twee producten berekenen"
    putStrLn "4. De beste productaanbeveling voor een ander product berekenen"
    invoerMenu <-  getLine
    putStrLn "Voer het product voor setA in. Dit kan bijvoorbeeld 'Appel' of 'Banaan' zijn."
    invoerSetA <- getLine 
    putStrLn "Voer het product voor setB in. Dit kan bijvoorbeeld 'Appel' of 'Banaan' zijn."
    invoerSetB <- getLine 
    print $ keuze invoerMenu invoerSetA invoerSetB alleTrans


keuze :: String -> String -> String -> Transacties -> KeuzeOutput
keuze invMenu invoerA invoerB transacties
    | invMenu == "1"   = Waarde        $ support       (Transactie $ singleton $ Product invoerA)                      transacties
    | invMenu == "2"   = Waarde        $ confidence                             (Product invoerA)  (Product invoerB)   transacties
    | invMenu == "3"   = Waarde        $ lift                                   (Product invoerA)  (Product invoerB)   transacties 
    | invMenu == "4"   = WaardeProduct $ bestLift                               (Product invoerA)                      transacties 
    | otherwise        = Foutief       "Helaas, verkeerde input!"