import Data.List
import Control.Monad
import Debug.Trace

stringToList :: String -> [Double]
stringToList l = map (read) (words l)

distance a b = sqrt( ((a!!0) - (b!!0))**2 + ((a!!1) - (b!!1))**2 )

canJump [] _  _ = "S"
canJump (x:xs) [] d = canJump xs [x] d
canJump (x:xs) ys d | canReachOneOf x ys d = canJump xs (x:ys) d
        | otherwise = "N" where
        canReachOneOf k [] d = False
        canReachOneOf k (n:ns) d | distance k n <= d = True
                | otherwise = canReachOneOf k ns d

main = do
        raw_params <- getLine
	let params = stringToList raw_params
	let n = floor (params!!0)
	let d = params!!1
        raw_entrada <- replicateM n getLine
	let entrada = map (stringToList) raw_entrada
	putStrLn $ canJump entrada [] d
	
