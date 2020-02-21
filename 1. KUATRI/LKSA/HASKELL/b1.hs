module B1 where
import Zerrendak

erre :: (Eq t)->[t]-> Bool
erre [] = False
erre (x:s)
	| badago x s = True
	|otherwise = False

kendu :: (Eq t)=> [t]->t
kendu x [] = []
kendu x (y:s)
	| x == y = kendu x s
	| x /= y = y:(kendu x s)
	
erre_kendu :: [t] -> [t]
erre_kendu [] =
erre_kendu (x:s) =