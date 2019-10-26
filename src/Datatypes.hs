module Datatypes where

import           Data.Set (Set, fromList, singleton)

data Product = Product (Set [Char]) deriving (Show, Eq, Ord)
data Transactie = Transactie (Set Product) deriving (Show, Eq, Ord)
data Transacties = Transacties [Transactie] deriving (Show, Eq, Ord)

-- | Variabelen om mee te debuggen
prodA = Product $ singleton "Appel"
prodB = Product $ singleton "Banaan"
prodC = Product $ singleton "Citroen"
prodD = Product $ singleton "Druif"
prodE = Product $ singleton "Eggplant"

transAB = Transactie $ fromList [prodA, prodB]
transDB = Transactie $ fromList [prodD, prodB]

transT1 = Transactie $ fromList [prodA, prodB, prodC, prodD, prodE]
transT2 = Transactie $ fromList [prodB, prodC, prodE]
transT3 = Transactie $ fromList [prodA, prodE]

alleTrans = Transacties [transT1, transT2, transT3]
