module Errek_zenb2 where


--A) ataleko soluzioak: Zenbaki osoen gaineko eragiketak

------------------------------------------------------------------

-- Zero edo handiagoa den zenbaki oso bat emanda, bere faktoriala 
-- itzultzen duen funtzioa. Emandako zenbakia negatiboa baldin bada, 
-- errore-mezua aurkeztuko du.
-- Zenbaki handiak erabili ahal izateko Integer mota ipini da.

faktoriala:: Integer -> Integer
faktoriala x
	| x <= (-1)		= error "Zenbaki negatiboa."
	| x == 0		= 1
	| otherwise		= x * (faktoriala (x - 1))


-------------------------------------------------------------------
-- Zero edo handiagoa den zenbaki oso bat emanda, bere fibonaccia 
-- itzultzen duen funtzioa. 
-- Emandako zenbakia negatiboa baldin bada, errore-mezua aurkeztuko du.

fib:: Int -> Int
fib x
	| x <= (-1)		= error "Zenbaki negatiboa."
	| x == 0		= 0
	| x == 1		= 1
	| otherwise		= (fib (x - 1)) + (fib (x - 2))

--OHARRA: funtzio hau Murgilketa.hs moduluan ere agertzen da.

-------------------------------------------------------------------