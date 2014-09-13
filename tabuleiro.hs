import Data.List

stringToList :: String -> [Int]
stringToList l = map (read) (words l)

holes = [(1,3),(2,3),(2,5),(5,4)]

move (a,b) c | c == 1 = (a+1,b+2)
	| c == 2 = (a+2,b+1)
	| c == 3 = (a+2,b-1)
	| c == 4 = (a+1,b-2)
	| c == 5 = (a-1,b-2)
	| c == 6 = (a-2,b-1)
	| c == 7 = (a-2,b+1)
	| c == 8 = (a-1,b+2)
	| otherwise = (a,b)

movimentos [] _ = 0
movimentos (x:xs) (a,b) = if (move (a,b) x) `elem` holes then 1
	else 1 + movimentos xs (move (a,b) x)

main = do
	entrada <- getLine
	putStrLn (show (movimentos (stringToList entrada) (4,3)))
