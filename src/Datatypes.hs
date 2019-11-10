-- | Module Datatypes bevat de nieuwe versie van alle data om mee te testen en debuggen.
--  Deze waardes vervangen in het verloop van het project de data in `DatatypesOld`.
--  Op dit moment werkt deze data helaas nog niet met de functies uit `Lib`.

module Datatypes where

import           Data.Set                    (Set, fromList, singleton)

-- | Het Product-datatype. Deze is opgebouwd uit één enkele string.
newtype Product     = Product String            deriving (Show, Eq, Ord)

-- | Het Transactie-datatype. Deze is opgebouwd uit een set van producten.
newtype Transactie  = Transactie (Set Product)  deriving (Show, Eq, Ord)

-- | Het Transacties-datatype. Deze is opgebouwd uit een lijst van één of meer Transactie.
newtype Transacties = Transacties [Transactie]  deriving (Show, Eq, Ord)

-- | Het KeuzeOutput-datatype. Dit datatype wordt gebruikt om het resultaat van de gebruiker in `Main.hs` goed te tonen.
data KeuzeOutput = Support Double | Confidence Double | Lift Double | Combi (Double, Product) | Foutief String deriving (Show)

-- | Product om mee te debuggen
prodA = Product "Appel"
-- | Product om mee te debuggen
prodB = Product "Banaan"
-- | Product om mee te debuggen
prodC = Product "Citroen"
-- | Product om mee te debuggen
prodD = Product "Druif"
-- | Product om mee te debuggen
prodE = Product "Eggplant"

-- | Product dat niet voorkomt in de transacties om mee te debuggen
prodF = Product "Fruitvliegjes"

-- | Subset van een transactie om mee te debuggen
transAB = Transactie $ fromList [prodA, prodB]
-- | Subset van een transactie om mee te debuggen
transDB = Transactie $ fromList [prodD, prodB]

-- | Transactie om mee te debuggen
transT1 = Transactie $ fromList [prodA, prodB, prodC, prodD, prodE]
-- | Transactie om mee te debuggen
transT2 = Transactie $ fromList [prodB, prodC, prodE]
-- | Transactie om mee te debuggen
transT3 = Transactie $ fromList [prodA, prodE]

-- | Lijst van Transactie om mee te debuggen
--
-- Deze variabele moet een dataset simuleren.
alleTrans = Transacties [transT1, transT2, transT3]
