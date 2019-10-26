module Matrix where

import           Lib
import           Tools

import qualified Data.Matrix as Matrix
import qualified Data.Set    as Set

-- Returned de lengte van een set
setLen :: Set.Set a -> Int
setLen = Set.size

emptySupportMatrix :: Num b => Set.Set a -> Matrix.Matrix b
emptySupportMatrix a = Matrix.zero (setLen a)  (setLen a)

zipSupport x d = zip (replicate (setLen $ recursiveUnion d) x) [Set.singleton y | y <- setToAscList $ recursiveUnion d]

unionZip x d = [x `Set.union` y | (x, y) <- zipSupport x d] -- Alle unieke combinaties met x
