import Data.List

stringToList :: String -> [Int]
stringToList l = map (read) (words l)

doTheJob c p | c!!0 <= p!!0 && c!!1 <= p!!1 = "S"
	| otherwise = "N"

main = do
	colchao <- getLine
	porta <- getLine
	putStrLn (doTheJob (sort (stringToList colchao)) (sort (stringToList porta)))
