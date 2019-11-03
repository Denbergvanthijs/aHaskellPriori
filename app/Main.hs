module Main where

import           Data.List.Split
import           Data.Set        (Set, fromList, singleton)
import           Datatypes
import           Lib
import           Tools

main :: IO ()
main = do
    putStrLn "Typ de bestandslocatie. Standaard is dit: data/store_data.csv"
    invoerFilePath <-  getLine
    putStrLn ("Bestand openen: " ++ invoerFilePath ++ "\n")
    bestand <- readFile invoerFilePath
    -- bestand <- readFile "data/store_data_short.csv"

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
    putStrLn "5. Het populairste product berekenen."
    invoerMenu <- getLine

    putStrLn "Voer het productA in. Dit kan bijvoorbeeld 'soup' of 'shrimp' zijn."
    putStrLn "U hoeft alleen een productA in te vullen voor keuzes 1, 2, 3 of 4."
    putStrLn "Voor keuze 5 kunt u productA leeg laten."
    invoerSetA <- getLine 

    putStrLn "Voer het productB in. Dit kan bijvoorbeeld 'soup' of 'shrimp' zijn."
    putStrLn "U hoeft alleen een productB in te vullen voor keuze 2 of 3."
    putStrLn "Voor keuzes 1, 4 en 5 kunt u productB leeg laten."
    invoerSetB <- getLine 

    print $ keuze invoerMenu invoerSetA invoerSetB bestandTransacties


keuze :: String -> String -> String -> Transacties -> KeuzeOutput
keuze invMenu invoerA invoerB transacties
    | invMenu == "1" = Support    $ support    (Transactie $ singleton $ Product invoerA)                   transacties
    | invMenu == "2" = Confidence $ confidence                          (Product invoerA) (Product invoerB) transacties
    | invMenu == "3" = Lift       $ lift                                (Product invoerA) (Product invoerB) transacties 
    | invMenu == "4" = Combi      $ bestLift                            (Product invoerA)                   transacties 
    | invMenu == "5" = Combi      $ bestSupport                                                             transacties 
    | otherwise      = Foutief    "Helaas, verkeerde input!"