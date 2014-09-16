import Data.List

triangleType :: [Double] -> String
triangleType xs | xs!!0 == xs!!1 && xs!!1 == xs!!2 = "a"
	| xs!!2**2 == xs!!1**2 + xs!!0**2 = "r"
	| xs!!2 < xs!!1 + xs!!0 = "o"
	| otherwise = "n"

main = do
	entrada <- getLine
	putStrLn $ triangleType $ sort (map (read) (words entrada))
	
