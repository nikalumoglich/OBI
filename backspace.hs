-- https://codeforces.com/problemset/problem/1553/D

import Data.List
import Data.Maybe
import Control.Monad

splitInTuples [] = []
splitInTuples (x:y:ys) = [(x,y)] ++ (splitInTuples ys)

process (a, b) = if _process (reverse a) (reverse b) == False then "NO" else "YES"
  
_process _ [] = True
_process a (b:bs)
  | bIndexOnA == -1  = False
  | otherwise        = if bIndexOnA `mod` 2 == 0 then _process (drop (bIndexOnA + 1) a) bs else _process (drop (bIndexOnA + 1) a) (b:bs)
  where 
    bIndexOnA = fromMaybe (-1) (elemIndex b a)
    k = drop (bIndexOnA + 1) a

main = do
  input <- getLine
  inputs <- replicateM ((read input) * 2) getLine
  mapM_ putStrLn (map process (splitInTuples inputs))