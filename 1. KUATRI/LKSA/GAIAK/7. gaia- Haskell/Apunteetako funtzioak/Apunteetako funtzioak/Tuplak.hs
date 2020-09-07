module Tuplak where

import Data.List -- h1 funtzioan genericLength erabiltzeko


f :: [(Bool, Integer)] -> [(Bool, Integer)]
f [] = []
f ((x,y):s)
 | x == True   = (x,y):(f s)
 | x == False  = f s
-------------------------------------------------------------------
g :: [(Integer, Integer)] -> [(Integer, Integer)]
g [] = []
g ((x,y):s)
 | x > y     = (y,x):(g s)
 | x <= y    = (x,y):(g s)
-------------------------------------------------------------------

-- Funtzio honek, x eta bm bi zenbaki oso emanda, [bm..x]
-- tartekoak diren x zenbakiaren zatitzaileak itzuliko ditu.
-- x zenbakia 0 edo negatiboa baldin bada, errorea.
-- bm zenbakia 0 edo negatiboa baldin bada, errorea.

zatizer_lag:: Integer -> Integer -> [Integer]
zatizer_lag x bm
	| x < 0 || x == 0 	= error "Zenbakia ez da positiboa."
	| bm <= 0		= error "Beheko muga ez da positiboa."
	| bm > x		= []
	| bm > (x `div` 2)	= [x]
	| x `mod` bm == 0	= bm : (zatizer_lag x (bm + 1))
	| otherwise		= zatizer_lag x (bm + 1)
-------------------------------------------------------------------

-- Funtzio honek, x zenbaki oso bat emanda, [1..x]
-- tartekoak diren x zenbakiaren zatitzaileak itzuliko ditu
-- murgilketa erabiliz.
-- x zenbakia 0 edo negatiboa baldin bada, errorea.

zatizer:: Integer -> [Integer]
zatizer x = zatizer_lag x 1
-------------------------------------------------------------------

h1 :: [Integer] -> [(Integer, [Integer], Integer)]
h1 [] = []
h1 (x:s)
 | x <= 0     = (x, [], -1):(h1 s)
 | x >= 1     = (x, zatizer x, genericLength (zatizer x)):(h1 s)
-------------------------------------------------------------------

h2 :: [(Integer, [Integer], Integer)] -> [(Integer, [Integer], Integer)]
h2 [] = []
h2 ((x,y,z):s)
 | z == 2     = (x,y,z):(h2 s)
 | x /= 2     = h2 s
-------------------------------------------------------------------

h3 :: (t1, t2, t3) -> t3
h3 (x,y,z) = z

-------------------------------------------------------------------

h4 :: [(Integer, [Integer], Integer)] -> [(Integer, [Integer], Integer)]
h4 [] = []
h4 (x:s)
 | h3 x == 2     = x:(h4 s)
 | h3 x /= 2     = h4 s
-------------------------------------------------------------------

i :: [Integer] -> [(Integer, Integer)] -> [(Integer, Integer)]
i s [] = []
i s ((x,y):r)
 | x `elem` s       = (x, y + 1):(i s r)
 | x `notElem` s    = i s r
-------------------------------------------------------------------

gure_zip :: Eq t2 => [t1] -> [t2] -> [(t1, t2)]
gure_zip [] r = []
gure_zip (x:s) r
 | r == []       = []
 | r /= []       = (x, head r): (gure_zip s (tail r))
-------------------------------------------------------------------

gure_zip2 :: (Eq t1,Eq t2) => [t1] -> [t2] -> [(t1, t2)]
gure_zip2 s r
 | s == []	 = []
 | r == []       = []
 | otherwise     = (head s, head r): (gure_zip2 (tail s) (tail r))
-------------------------------------------------------------------