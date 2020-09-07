module LKSA_2018_11_27_ where
import Data.List


-------------------------------------
--ZERRENDA-ERAKETA
-------------------------------------
--1.1

esanguratsuak :: Integer -> [Integer]
esanguratsuak x 
 | x <= 0     = error "Ez da positiboa."
 | otherwise  = [y | y <- [2..(x-1)], x `mod` y == 0]

-------------------------------------
--1.2

esang_zer :: [Integer] -> [[Integer]]
esang_zer s 
 | not (null [z | z <- s, z <= 0]) = error "Zerrendako zebakiren bat ez da positiboa."
 | otherwise = [esanguratsuak z | z <- s]

-------------------------------------
--1.3

guztietan :: Integer -> [[Integer]] -> Bool
guztietan n s = and [n `elem` y | y <- s]

-------------------------------------
--1.4

guztietan_zer :: [Integer] -> [[Integer]] -> [Integer]
guztietan_zer r s = [ y | y <- r, guztietan y s]

-------------------------------------
--1.5

guztiez_partekatuak :: [Integer] -> [Integer]
guztiez_partekatuak s 
 | not (null [z | z <- s, z <= 0]) = error "Zerrendako zebakiren bat ez da positiboa."
 | null s = error "Emandako zerrenda hutsa da."
 | otherwise = guztietan_zer (esanguratsuak (head s)) (esang_zer (tail s))

-------------------------------------

--1.6

partekaturik :: Integer -> Integer -> Bool
partekaturik x y
 | x <= 0 || y <= 0 = error "Zenbakiren bat ez da positiboa."
 | otherwise = not (null (guztiez_partekatuak [x,y]))

---
-------------------------------------

--1.7

hurrengoak :: Integer -> Integer -> [Integer]
hurrengoak x z
 | x <= 0 = error "Lehenengo zenbakia ez da positiboa (>= 0)." 
 | z <= (-1) = error "Bigarren zenbakia negatiboa da (<= -1)." 
 | (null (esanguratsuak x)) = error "Lehenengo zenbakiak ez du zatitzaile esanguratsurik."
 | otherwise = genericTake z [ y | y <- [(x + 1)..], partekaturik x y]

---
-------------------------------------
