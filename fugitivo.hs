import Control.Monad

distance coord = sqrt ((fst coord)**2 + (snd coord)**2)

doTheJob 0 _ _ _ = "0"
doTheJob n coord max (x:xs) =
	if distance (newcoord x) > max then "1"
	else doTheJob (n-1) (newcoord x) max xs 
	where
		newcoord :: String -> (Double,Double)
		newcoord e | (words e)!!0 == "N" = ((fst coord), (snd coord) + (read ((words e)!!1)::Double))
			| (words e)!!0 == "S" = ((fst coord), (snd coord) - (read ((words e)!!1)::Double))
			| (words e)!!0 == "L" = ((fst coord) + (read ((words e)!!1)::Double), (snd coord))
			| (words e)!!0 == "O" = ((fst coord) - (read ((words e)!!1)::Double), (snd coord))	

main = do
	detail <- getLine
	entrada <- replicateM (read ((words detail)!!0)::Int) getLine
	putStrLn (doTheJob (read ((words detail)!!0)::Int) (0,0) (read ((words detail)!!1)::Double) entrada)
