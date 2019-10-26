module DatatypesOld where

import qualified Data.Set as Set

-- Variabelen om mee te debuggen
setA = Set.singleton "Appel"
setB = Set.singleton "Banaan"
setC = Set.singleton "Citroen"
setD = Set.singleton "Druif"
setE = Set.singleton "Eggplant"

setAB = Set.fromList ["Appel", "Banaan"]
setDB = Set.fromList ["Druif", "Banaan"]

setT1 = Set.fromList ["Appel", "Banaan", "Citroen", "Druif", "Eggplant"]
setT2 = Set.fromList ["Banaan", "Citroen", "Eggplant"]
setT3 = Set.fromList ["Appel", "Eggplant"]

listTrans = [setT1, setT2, setT3]

