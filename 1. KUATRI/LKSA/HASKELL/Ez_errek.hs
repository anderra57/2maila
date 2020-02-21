module Ez_errek where


------------------------------------------------------------------

-- "pi2" funtzioa: Sarrerako daturik hartu gabe beti 3.1415 balioa 
-- itzuliko duen funtzioa.

pi2:: Float
pi2 = 3.1415

------------------------------------------------------------------

-- "f" funtzioa: Sarrerako datu bezala zenbaki oso bat hartu eta beti 
-- 100 balioa itzuliko duen funtzioa.

f:: Int -> Int
f x = 100

------------------------------------------------------------------

-- "bikoitia" funtzioa: Zenbaki oso bat emanda, zenbakia bikoitia 
-- al den ala ez erabakiko duen funtzioa.

bikoitia:: Int -> Bool
bikoitia x = (x `mod` 2) == 0

------------------------------------------------------------------

-- "bakoitia" funtzioa: Zenbaki oso bat emanda, zenbakia bakoitia 
-- al den ala ez erabakiko duen funtzioa.

bakoitia:: Int -> Bool
bakoitia x = not (bikoitia x)

------------------------------------------------------------------

-- "hand3" funtzioa: Hiru zenbaki oso emanda, balio handiena itzuliko
-- duen funtzioa.

hand3:: Int -> Int -> Int -> Int
hand3 x y z
	| x >= y && x >= z		= x
	| y > x && y >= z		= y
	| otherwise			= z

------------------------------------------------------------------