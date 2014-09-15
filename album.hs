import Data.List

stringToList :: String -> [Int]
stringToList l = map (read) (words l)

canFitVertically p p1 p2 = (p1!!1 + p2!!1) < p!!1 && p1!!0 < p!!0 && p2!!0 < p!!0

canFitHorizontally p p1 p2 = (p1!!0 + p2!!0) < p!!0 && p1!!1 < p!!1 && p2!!1 < p!!1

canFit page photo1 photo2
	| canFitVertically page photo1 photo2
	|| canFitHorizontally page photo1 photo2 = "S"
	| otherwise = "N"

main = do
	page <- getLine
	photo1 <- getLine
	photo2 <- getLine
	putStrLn $ canFit (stringToList page) (stringToList photo1) (stringToList photo2)
