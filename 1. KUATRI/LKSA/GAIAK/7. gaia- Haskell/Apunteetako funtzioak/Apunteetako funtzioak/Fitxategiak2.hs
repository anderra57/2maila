module Fitxategiak2 where

import Data.List -- h6 funtzioan genericLength funtzio aurredefinitua erabiltzeko
import System.IO -- openFile, hClose, hGetChar, hGetLine, hGetContents,
-- hPutChar, hPutStr, hPutStrLn eta hIsEOF aurredefinitutako funtzioak erabiltzeko

i :: FilePath -> IO()
i fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       lerroa <- hGetLine sarbidea
       putStrLn ("Lehenengo lerroa: " ++ lerroa)
       lerroa <- hGetLine sarbidea
       putStrLn ("Bigarren lerroa: " ++ lerroa)
       lerroa <- hGetLine sarbidea
       putStrLn ("Hirugarren lerroa: " ++ lerroa)
       putStrLn "Fitxategia ixten..."
       hClose sarbidea

i2 :: FilePath -> IO()
i2 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       putStrLn (show sarbidea) -- Handle motako elementua aurkezteko
       lerroa <- hGetLine sarbidea
       putStrLn ("Lehenengo lerroa: " ++ lerroa)
       lerroa <- hGetLine sarbidea
       putStrLn ("Bigarren lerroa: " ++ lerroa)
       lerroa <- hGetLine sarbidea
       putStrLn ("Hirugarren lerroa: " ++ lerroa)
       putStrLn "Fitxategia ixten..."
       hClose sarbidea


i3 :: FilePath -> IO()
i3 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       putStrLn ("Lerro bakoitzeko edukia honako hau da: \n")
       i4 sarbidea 1
       putStrLn "Fitxategia ixten..."
       hClose sarbidea       

i4 :: Handle -> Integer -> IO()
i4 sarbide_izena lerro_zenbakia = 
     do
        bukaera <- hIsEOF sarbide_izena
        if bukaera == True 
          then putStrLn "Fitxategiaren bukaera."
          else do
                    lerroa <- hGetLine sarbide_izena
                    putStrLn ("Lerroa " ++ (show lerro_zenbakia) ++ ": \n" ++ lerroa) 
                    i4 sarbide_izena (lerro_zenbakia + 1) 


i5 :: FilePath -> IO()
i5 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea
       putStrLn ("Edukiak:\n" ++ edukia)
       putStrLn "Fitxategia ixten..."
       hClose sarbidea





i6 :: FilePath -> IO()
i6 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea
       let lerroka = (lines edukia)
       putStrLn ("Lerro bakoitzeko edukia honako hau da: \n")
       h6 lerroka 1
       putStrLn "Fitxategia ixten..."
       hClose sarbidea

h6 :: [String] -> Integer -> IO()
h6 kate_zerrenda lerro_zenbakia = 
     do
       if (genericLength kate_zerrenda) == 0 
          then putStrLn "Hutsa"
          else if (genericLength kate_zerrenda) == 1 
                  then putStrLn ((show lerro_zenbakia) ++ ". lerroa" ++ ": \n" ++ (head kate_zerrenda))
                  else do
                        putStrLn ((show lerro_zenbakia) ++ ". lerroa" ++ ": \n" ++ (head kate_zerrenda)) 
                        h6 (tail kate_zerrenda) (lerro_zenbakia + 1)        


j :: FilePath ->IO()
j fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       karak <- hGetChar sarbidea
       putStr "Lehenengo karakterea: "
       putChar karak
       karak <- hGetChar sarbidea
       putStr "\nBigarren karakterea: "
       putChar karak
       putStrLn "\nFitxategia ixten..."
       hClose sarbidea


j2 :: FilePath -> IO()
j2 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       putStr ("Karakterez karaktere edukia honako hau da: ")
       j3 sarbidea 1
       putStrLn "\nFitxategia ixten..."
       hClose sarbidea       

j3 :: Handle -> Integer -> IO()
j3 sarbide_izena lerro_zenbakia = 
     do
        bukaera <- hIsEOF sarbide_izena
        if bukaera == True 
          then putStr "\nFitxategiaren bukaera."
          else do
                    karak <- hGetChar sarbide_izena
                    putStr ("\n" ++ (show lerro_zenbakia) ++ ". karakterea: ")
                    putChar karak 
                    j3 sarbide_izena (lerro_zenbakia + 1) 

j4 :: FilePath -> IO()
j4 fitx = 
     do
       putStrLn "Fitxategia irekitzen..."
       sarbidea <- openFile fitx ReadMode
       putStr ("Karakterez karaktere edukia honako hau da: ")
       j5 sarbidea 1
       putStrLn "\nFitxategia ixten..."
       hClose sarbidea       

j5 :: Handle -> Integer -> IO()
j5 sarbide_izena lerro_zenbakia = 
     do
        bukaera <- hIsEOF sarbide_izena
        if bukaera == True 
          then putStr "\nFitxategiaren bukaera."
          else do
                    karak <- hGetChar sarbide_izena
                    if karak == '\n'
                      then do
                             putStr ""  -- Testu hutsa
                             j5 sarbide_izena lerro_zenbakia 
                      else do
                             putStr ("\n" ++ (show lerro_zenbakia) ++ ". karakterea: ")
                             putChar karak 
                             j5 sarbide_izena (lerro_zenbakia + 1) 



k :: FilePath -> IO()
k fitx = 
     do
       putStrLn "Fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren hasierako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten..."
       hClose sarbidea1
--
       putStrLn "Fitxategia idazketarako irekitzen..."
       sarbidea2 <- openFile fitx WriteMode
       hPutChar sarbidea2 'W'
       hPutChar sarbidea2 'X'
       hPutChar sarbidea2 'Y'
       hPutChar sarbidea2 'Z'
       putStrLn "Fitxategia idazketarako ixten..."
       hClose sarbidea2
--
       putStrLn "Fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren bukaerako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten..."
       hClose sarbidea1

k2 :: FilePath ->IO()
k2 fitx = 
     do
       putStrLn "Fitxategia irakurketarako irekitzen... "
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren hasierako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten... "
       hClose sarbidea1
--
       putStrLn "Fitxategia eransketarako irekitzen... "
       sarbidea2 <- openFile fitx AppendMode
       hPutStr sarbidea2 "\nuvw"
       putStrLn "Fitxategia eransketarako ixten... "
       hClose sarbidea2
--
       putStrLn "Fitxategia irakurketarako irekitzen... "
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren bukaerako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten... "
       hClose sarbidea1

k3 :: FilePath -> String -> IO()
k3 fitx testua = 
     do
       putStrLn "Fitxategia irakurketarako irekitzen... "
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren hasierako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten... "
       hClose sarbidea1
--
       putStrLn "Fitxategia eransketarako irekitzen... "
       sarbidea2 <- openFile fitx AppendMode
       hPutStr sarbidea2 ("\n" ++ testua)
       putStrLn "Fitxategia eransketarako ixten... "
       hClose sarbidea2
--
       putStrLn "Fitxategia irakurketarako irekitzen... "
       sarbidea1 <- openFile fitx ReadMode
       edukia <- hGetContents sarbidea1
       putStrLn ("Fitxategiaren bukaerako edukia honako hau da: ")
       putStrLn edukia
       putStrLn "Fitxategia irakurketarako ixten... "
       hClose sarbidea1


fbikoitza :: FilePath -> FilePath -> IO()
fbikoitza fitx1 fitx2 = 
     do
       putStrLn "Lehenengo fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx1 ReadMode
       putStrLn ("Lehenengo fitxategiaren edukia honako hau da: \n")
       edukia1 <- hGetContents sarbidea1
       putStrLn edukia1
       putStrLn "Lehenengo fitxategia irakurketarako ixten..."
       hClose sarbidea1
--
       putStrLn "Lehenengo fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx1 ReadMode
       putStrLn "Bigarren fitxategia idazketarako irekitzen..."
       sarbidea2 <- openFile fitx2 WriteMode
       fbikoitza_lag sarbidea1 sarbidea2
       putStrLn "Lehenengo fitxategia irakurketarako ixten..."
       hClose sarbidea1 
       putStrLn "Bigarren fitxategia idazketarako ixten..."
       hClose sarbidea2
--
       putStrLn "Bigarren fitxategia irakurketarako irekitzen..."
       sarbidea2 <- openFile fitx2 ReadMode
       putStrLn ("Bigarren fitxategiaren bukaerako edukia honako hau da: \n")
       edukia2 <- hGetContents sarbidea2
       putStrLn edukia2
       putStrLn "Bigarren fitxategia irakurketarako ixten..."
       hClose sarbidea2
      

fbikoitza_lag :: Handle -> Handle -> IO()
fbikoitza_lag sarbide_izena1 sarbide_izena2 = 
     do
        bukaera <- hIsEOF sarbide_izena1
        if bukaera == True 
          then putStrLn "Fitxategiaren bukaera."
          else do
                    lerroa <- hGetLine sarbide_izena1
                    let zenb = (read lerroa :: Integer)
                    hPutStrLn sarbide_izena2 (show (zenb * 2)) 
                    fbikoitza_lag sarbide_izena1 sarbide_izena2



fbatura :: FilePath -> FilePath -> IO()
fbatura fitx1 fitx2 = 
     do
       putStrLn "Lehenengo fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx1 ReadMode
       putStrLn ("Lehenengo fitxategiaren edukia honako hau da: \n")
       edukia1 <- hGetContents sarbidea1
       putStrLn edukia1
       putStrLn "Lehenengo fitxategia irakurketarako ixten..."
       hClose sarbidea1
--
       putStrLn "Lehenengo fitxategia irakurketarako irekitzen..."
       sarbidea1 <- openFile fitx1 ReadMode
       putStrLn "Bigarren fitxategia idazketarako irekitzen..."
       sarbidea2 <- openFile fitx2 WriteMode
       b <- (fbatura_lag sarbidea1 0)
       hPutStr sarbidea2 (show b)
       putStrLn "Lehenengo fitxategia irakurketarako ixten..."
       hClose sarbidea1 
       putStrLn "Bigarren fitxategia idazketarako ixten..."
       hClose sarbidea2
--
       putStrLn "Bigarren fitxategia irakurketarako irekitzen..."
       sarbidea2 <- openFile fitx2 ReadMode
       putStrLn ("Bigarren fitxategiaren bukaerako edukia honako hau da: \n")
       edukia2 <- hGetContents sarbidea2
       putStrLn edukia2
       putStrLn "Bigarren fitxategia irakurketarako ixten..."
       hClose sarbidea2
      

fbatura_lag :: Handle -> Integer -> IO Integer
fbatura_lag sarbide_izena batura = 
     do
        bukaera <- hIsEOF sarbide_izena
        if bukaera == True 
          then return batura
          else do
                    lerroa <- hGetLine sarbide_izena
                    let zenb = (read lerroa :: Integer) 
                    fbatura_lag sarbide_izena (batura + zenb)
	   