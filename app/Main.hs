module Main where

import           Lib
import           Datatypes
import           Data.Set (Set, singleton, fromList)
import           Data.List.Split
import           Tools

main :: IO ()
main = do
    putStrLn "Typ de bestandslocatie. Standaard is dit: data/store_data.csv"
    invoerFilePath <-  getLine
    putStrLn ("Bestand openen: " ++ invoerFilePath ++ "\n")
    bestand <- readFile invoerFilePath
    -- bestand <- readFile "data/store_data.csv"

    let bestandRegelsSplit =             [splitOn "," t | t <- lines bestand]
    let bestandProducts    =             [[Product p | p <- t] | t <- bestandRegelsSplit]
    let bestandTransacties = Transacties [Transactie $ fromList t | t <- bestandProducts]

    putStrLn "U heeft de keuze uit de volgende producten:\n"
    print $ recursiveUnion bestandTransacties
    putStrLn "\nWelk van de volgende dingen wilt u berekenen:"
    putStrLn "1. De support van één product berekenen"
    putStrLn "2. De confidence tussen twee producten berekenen"
    putStrLn "3. De lift tussen twee producten berekenen"
    putStrLn "4. De beste productaanbeveling voor een product berekenen"
    invoerMenu <-  getLine
    putStrLn "Voer het productA in. Dit kan bijvoorbeeld 'soup' of 'shrimp' zijn."
    invoerSetA <- getLine 
    putStrLn "Voer het productB in. Dit kan bijvoorbeeld 'soup' of 'shrimp' zijn."
    putStrLn "U hoeft alleen een productB in te vullen voor keuze 2 of 3. Voor keuze 1 en 4 kunt u productB leeg laten."
    invoerSetB <- getLine 
    print $ keuze invoerMenu invoerSetA invoerSetB bestandTransacties


keuze :: String -> String -> String -> Transacties -> KeuzeOutput
keuze invMenu invoerA invoerB transacties
    | invMenu == "1"   = Waarde        $ support       (Transactie $ singleton $ Product invoerA)                      transacties
    | invMenu == "2"   = Waarde        $ confidence                             (Product invoerA)  (Product invoerB)   transacties
    | invMenu == "3"   = Waarde        $ lift                                   (Product invoerA)  (Product invoerB)   transacties 
    | invMenu == "4"   = WaardeProduct $ bestLift                               (Product invoerA)                      transacties 
    | otherwise        = Foutief       "Helaas, verkeerde input!"