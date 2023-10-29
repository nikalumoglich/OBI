-- https://codeforces.com/problemset/problem/1874/C

import qualified Data.Map as Map
import Control.Monad
import Data.Maybe

data Road = Road {
    start :: Int,
    end :: Int
} deriving (Show)

stringToIntArray :: String -> [Int]
stringToIntArray str = map read (words str)

removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates (x:xs) = x : removeDuplicates (filter (/= x) xs)
removeDuplicates [] = []

calculateFromStructure structure n startCity = 
    if isNothing destinations then 0
    else foldr (\destination acc -> acc + (1 / (fromIntegral (length (fromJust destinations)))) * (if n == destination then 1 else calculateFromStructure structure n destination)) 0.0 (fromJust destinations) where
        destinations = Map.lookup startCity structure

readTestCase = do
    mAndN <- getLine
    let n = head (stringToIntArray mAndN)
    let m = stringToIntArray mAndN!!1

    rows_ <- replicateM m getLine
    let rows = map stringToIntArray rows_
    let roads = map (\[s, e] -> Road { start = s, end = e }) rows

    let structure = foldr (\road theMap -> Map.insertWith (++) (start road) [end road] theMap) Map.empty roads

    print structure

    return $ calculateFromStructure structure n 1

main = do
    numberOfTestCases_ <- getLine
    let numberOfTestCases = read numberOfTestCases_ :: Int

    results <- replicateM numberOfTestCases readTestCase

    mapM_ print results
