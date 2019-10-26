-- | Module DatatypesOld bevat de oude versie van alle data om mee te testen en debuggen.
--  Deze waardes worden in het verloop van het project vervangen voor de data in `Datatypes`.

module DatatypesOld where

import Data.Set (singleton, empty, fromList)

-- | Product om mee te debuggen
setA = singleton "Appel"
-- | Product om mee te debuggen
setB = singleton "Banaan"
-- | Product om mee te debuggen
setC = singleton "Citroen"
-- | Product om mee te debuggen
setD = singleton "Druif"
-- | Product om mee te debuggen
setE = singleton "Eggplant"

-- | Product dat niet voorkomt in de transacties om mee te debuggen
setF = singleton "Fruitvliegjes"
-- | Geen product om mee te debuggen
setG = empty

-- | Subset van een transactie om mee te debuggen
setAB = fromList ["Appel", "Banaan"]
-- | Subset van een transactie om mee te debuggen
setDB = fromList ["Druif", "Banaan"]

-- | Transactie om mee te debuggen
setT1 = fromList ["Appel", "Banaan", "Citroen", "Druif", "Eggplant"]
-- | Transactie om mee te debuggen
setT2 = fromList ["Banaan", "Citroen", "Eggplant"]
-- | Transactie om mee te debuggen
setT3 = fromList ["Appel", "Eggplant"]

-- | Transacties om mee te debuggen
--
-- Deze variabele moet een dataset simuleren.
listTrans = [setT1, setT2, setT3]

