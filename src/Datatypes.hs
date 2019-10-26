-- | Module Datatypes bevat de nieuwe versie van alle data om mee te testen en debuggen.
--  Deze waardes vervangen in het verloop van het project de data in `DatatypesOld`.
--  Op dit moment werkt deze data helaas nog niet met de functies uit `Lib`.

module Datatypes where

import              Data.Set                    (Set, fromList, singleton)

newtype Product     = Product (Set String)      deriving (Show, Eq, Ord)
newtype Transactie  = Transactie (Set Product)  deriving (Show, Eq, Ord)
newtype Transacties = Transacties [Transactie]  deriving (Show, Eq, Ord)

-- | Product om mee te debuggen
prodA = Product $ singleton "Appel"
-- | Product om mee te debuggen
prodB = Product $ singleton "Banaan"
-- | Product om mee te debuggen
prodC = Product $ singleton "Citroen"
-- | Product om mee te debuggen
prodD = Product $ singleton "Druif"
-- | Product om mee te debuggen
prodE = Product $ singleton "Eggplant"

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

-- | Transacties om mee te debuggen
--
-- Deze variabele moet een dataset simuleren.
alleTrans = Transacties [transT1, transT2, transT3]
