import Data.List

stringToList :: String -> [Int]
stringToList l = map (read) (words l)

middle xs = (sort xs)!!1

main = do
	entrada <- getLine
	putStrLn $ show $ middle (stringToList entrada)
