module Fitxategiak1 where

import Data.List -- h6 funtzioan genericLength funtzio aurredefinitua erabiltzeko


g :: IO()
g = do
       putStrLn "Fitxategia irakurtzen..."
       edukia <- readFile "fitxategia1.txt"
       putStrLn ("Edukia honako hau da: \n" ++ edukia)

g2 :: IO()
g2 = do
       putStrLn "Fitxategia irakurtzen..."
       edukia <- readFile "S/fitxategia2.txt"
       putStrLn ("Edukia honako hau da: \n" ++ edukia)

g3 :: FilePath -> IO()  -- FilePath mota String motaren sinonimoa da
g3 fitx = do
            putStrLn "Fitxategia irakurtzen..."
            edukia <- readFile fitx
            putStrLn ("Edukia honako hau da: \n" ++ edukia)

h :: FilePath -> IO()
h fitx = do
            putStrLn "Fitxategia irakurtzen..."
            edukia <- readFile fitx
            putStrLn (fitx ++ " fitxategiaren hasierako edukia honako hau da: \n" ++ edukia)
            putStrLn "Fitxategia idazten..."
            writeFile fitx "Haskell funtzioetan oinarritutako\nlengoaia da."
            putStrLn "Fitxategia irakurtzen..."
            edukia <- readFile fitx
            putStrLn (fitx ++ " fitxategiaren bukaerako edukia honako hau da: \n" ++ edukia)

h1 :: FilePath -> String -> IO()
h1 fitx testua = 
  do
    putStrLn "Fitxategia irakurtzen..."
    edukia <- readFile fitx
    putStrLn (fitx ++ " fitxategiaren hasierako edukia honako hau da: \n" ++ edukia)
    putStrLn "Fitxategia idazten..."
    writeFile fitx testua
    putStrLn "Fitxategia irakurtzen..."
    edukia <- readFile fitx
    putStrLn (fitx ++ " fitxategiaren bukaerako edukia honako hau da: \n" ++ edukia)

h2 :: FilePath -> String -> IO()
h2 fitx testua = 
  do
    putStrLn "Fitxategia irakurtzen..."
    edukia <- readFile fitx
    putStrLn (fitx ++ " fitxategiaren hasierako edukia honako hau da: \n" ++ edukia)
    putStrLn "Fitxategiari eduki berria eransten..."
    appendFile fitx testua
    putStrLn "Fitxategia irakurtzen..."
    edukia <- readFile fitx
    putStrLn (fitx ++ " fitxategiaren bukaerako edukia honako hau da: \n" ++ edukia)

h3 :: FilePath -> FilePath -> FilePath -> IO()
h3 fitx1 fitx2 fitx3 = 
  do
    putStrLn "Hirugarren fitxategia irakurtzen..."
    edukia3 <- readFile fitx3
    putStrLn (fitx3 ++ " fitxategiaren hasierako edukia honako hau da: \n" ++ edukia3)
    putStrLn "Lehenengo fitxategia irakurtzen..."
    edukia1 <- readFile fitx1
    putStrLn "Hirugarren fitxategian idazten..."
    writeFile fitx3 edukia1
    putStrLn "Hirugarren fitxategia irakurtzen..."
    edukia3 <- readFile fitx3
    putStrLn (fitx3 ++ " fitxategiaren edukia une honetan honako hau da: \n" ++ edukia3)
    putStrLn "Bigarren fitxategia irakurtzen..."
    edukia2 <- readFile fitx2
    putStrLn "Hirugarren fitxategiari eduki berria eransten..."
    appendFile fitx3 ("\n" ++ edukia2)
    putStrLn "Hirugarren fitxategia irakurtzen..."
    edukia3 <- readFile fitx3
    putStrLn (fitx3 ++ " fitxategiaren bukaerako edukia honako hau da: \n" ++ edukia3)

h4 :: FilePath -> IO()
h4 fitx = 
     do
       putStrLn "Fitxategia irakurtzen..."
       edukia <- readFile fitx
       let lerroka = (lines edukia)
       putStrLn ("Lehenengo hiru lerroetako edukia honako hau da: \n")
       putStrLn ("-Lehenengo lerroa: \n" ++ (head lerroka))
       putStrLn ("-Bigarren lerroa: \n" ++ (head (tail lerroka)))
       putStrLn ("-Hirugarren lerroa: \n" ++ (head (tail (tail lerroka))))

h5 :: FilePath -> IO()
h5 fitx = 
     do
       putStrLn "Fitxategia irakurtzen..."
       edukia <- readFile fitx
       let lerroka = (lines edukia)
       putStrLn ("Lerro bakoitzeko edukia honako hau da: \n")
       h6 lerroka 1

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


  	   