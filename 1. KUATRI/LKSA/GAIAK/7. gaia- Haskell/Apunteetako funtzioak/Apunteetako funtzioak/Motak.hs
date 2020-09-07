module Motak where


hh :: Integer -> Integer

hh x
 | x < 0 || x > 12   = error "Datua ez da egokia."
 | x < 12            = x + 1
 | x == 12           = 1
-------------------------------------------------------------------

type Hilabete_zenb = Integer

hh2 :: Hilabete_zenb -> Hilabete_zenb

hh2 x
 | x < 0 || x > 12   = error "Datua ez da egokia."
 | x < 12            = x + 1
 | x == 12           = 1
-------------------------------------------------------------------

bikote_batura :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)

bikote_batura (x, y) (z, w) = (x + z, y + w)

-------------------------------------------------------------------

type Oso_bikote = (Integer, Integer)

bikote_batura2 :: Oso_bikote -> Oso_bikote -> Oso_bikote

bikote_batura2 (x, y) (z, w) = (x + z, y + w)
-------------------------------------------------------------------

boskote_pos :: Integer -> (t,t,t,t,t) -> t

boskote_pos p (v, w, x, y, z)
 | p < 0 || p > 5	= error "Posizioa ez da egokia."
 | p == 1            	= v
 | p == 2            	= w
 | p == 3            	= x
 | p == 4            	= y
 | p == 5            	= z
-------------------------------------------------------------------

type Posizioa = Integer

type Boskotea t = (t,t,t,t,t) 

boskote_pos2 :: Posizioa -> Boskotea t -> t

boskote_pos2 p (v, w, x, y, z)
 | p < 0 || p > 5	= error "Posizioa ez da egokia."
 | p == 1            	= v
 | p == 2            	= w
 | p == 3            	= x
 | p == 4            	= y
 | p == 5            	= z
-------------------------------------------------------------------

type Boskotea2 t1 t2 = (t1,t2,t2,t2,t2) 

lehenengoa_berdina :: Eq t1 => t1 -> [Boskotea2 t1 t2] -> [Boskotea2 t1 t2]

lehenengoa_berdina e [] = []
lehenengoa_berdina e ((v, w, x, y, z):s)
 | e == v	= (v, w, x, y, z):(lehenengoa_berdina e s)
 | otherwise    = lehenengoa_berdina e s

-------------------------------------------------------------------

type Nan_zenb = Integer
type Nan_letra = Char
type Txartel_zenb = Integer
type Pertsona = (Nan_zenb, Nan_letra, Txartel_zenb)
type Bezeroak = [Pertsona]

bezeroaren_kreditu_txartela :: Nan_zenb -> Nan_letra -> Bezeroak -> Txartel_zenb

bezeroaren_kreditu_txartela nan_z nan_l [] = error "Erregistratu gabeko bezeroa."

bezeroaren_kreditu_txartela nan_z nan_l ((nz, nl, tz):s)
 | nan_z == nz && nan_l == nl   = tz
 | otherwise                    = bezeroaren_kreditu_txartela nan_z nan_l s

-------------------------------------------------------------------

data Urtaroak = Negua | Udaberria | Uda | Udazkena
  deriving (Eq, Ord, Show, Read, Enum, Bounded)
-------------------------------------------------------------------
data Irudiak = Zirkulua Float | Karratua Float | Laukizuzena Float Float
  deriving (Eq, Ord, Show, Read)
-------------------------------------------------------------------
azalera :: Irudiak -> Float

azalera (Zirkulua erradioa) = pi * (erradioa^2)
area (Karratua alde_luzera) = alde_luzera * alde_luzera
area (Laukizuzena oinarria altuera) = oinarria * altuera 
-------------------------------------------------------------------
data Nat = Zero | H Nat
  deriving (Eq, Ord, Show, Read)
-------------------------------------------------------------------
batura_nat :: Nat -> Nat -> Nat

batura_nat Zero y = y
batura_nat (H x) y = H (batura_nat x y)
-------------------------------------------------------------------

data Nat2 = Zero2 | H2 Nat2
  deriving (Eq, Ord, Read)

instance Num Nat2 where
 Zero2 + x = x
 (H2 y) + x = (H2 (y + x))

 Zero2 - Zero2 = Zero2
 Zero2 - (H2 x) = Zero2
 (H2 x) - Zero2 = (H2 x)
 (H2 x) - (H2 y) = (x - y)

 Zero2 * x = Zero2
 (H2 x) * Zero2 = Zero2
 (H2 x) * (H2 y) = (H2 x) + ((H2 x) * y)

 negate x = error "Zenbaki negatiboak ez dira zenbaki arruntak."

 abs x = x

 signum x = 1

 fromInteger x
  | x < 0 = error "Zenbaki negatiboak ez dira zenbaki arruntak."
  | x == 0 = Zero2
  | otherwise = H2 (fromInteger (x - 1))

instance Show Nat2 where
 show x = show (arruntetik_osora x)


arruntetik_osora :: Nat2 -> Integer
arruntetik_osora Zero2 = 0
arruntetik_osora (H2 x) = 1 + (arruntetik_osora x)
-------------------------------------------------------------------
data Pila t = Phutsa | Pilaratu t (Pila t)
  deriving (Eq, Ord, Show, Read)

-------------------------------------------------------------------

pila_batura :: Pila Integer -> Integer

pila_batura Phutsa = 0
pila_batura (Pilaratu x s) = x + (pila_batura s) 
-------------------------------------------------------------------
altuera :: Pila t -> Integer

altuera Phutsa = 0
altuera (Pilaratu x s) = 1 + (altuera s) 
-------------------------------------------------------------------
hainbeste_ezabatu :: Integer -> Pila t -> Pila t

hainbeste_ezabatu x Phutsa
 | x == 0 = Phutsa
 | otherwise = error "Datua ez da egokia."

hainbeste_ezabatu x (Pilaratu y s)
 | x < 0     = error "Datua ez da egokia."
 | x == 0    = Pilaratu y s
 | otherwise = hainbeste_ezabatu (x - 1) s

-------------------------------------------------------------------
elementua_ezabatu :: Eq t => t -> Pila t -> Pila t

elementua_ezabatu x Phutsa = Phutsa

elementua_ezabatu x (Pilaratu y s)
 | x == y     = elementua_ezabatu x s
 | otherwise  = Pilaratu y (elementua_ezabatu x s)

-------------------------------------------------------------------

hainbeste_ezabatu2 :: Integer -> Pila t -> Pila t

hainbeste_ezabatu2 x p
 | x < 0 || x > (altuera p) = error "Datua ez da egokia."
 | x == 0                   = p
 | otherwise		    = hainbeste_ezabatu2 (x - 1) (despilatu p) 
-------------------------------------------------------------------
despilatu :: Pila t -> Pila t

despilatu Phutsa         = error "Pila hutsa."
despilatu (Pilaratu x s)   = s 
-------------------------------------------------------------------
data Ilara t = Ihutsa | Ipini (Ilara t) t
  deriving (Eq, Ord, Show, Read)
-------------------------------------------------------------------
i_lehenengoa :: Eq t => Ilara t -> t

i_lehenengoa Ihutsa = error "Ilara hutsa."

i_lehenengoa (Ipini s x)
 | s == Ihutsa  = x
 | otherwise    = i_lehenengoa s
-------------------------------------------------------------------
i_azkena :: Ilara t -> t

i_azkena Ihutsa = error "Ilara hutsa."

i_azkena (Ipini s x) = x

-------------------------------------------------------------------
i_elkartu :: Ilara t -> Ilara t -> Ilara t

i_elkartu r Ihutsa = r

i_elkartu r (Ipini s x) = Ipini (i_elkartu r s) x

-------------------------------------------------------------------
data Zuhbit t = Zhutsa | Eraiki t (Zuhbit t) (Zuhbit t)
  deriving (Eq, Ord, Show, Read)
-------------------------------------------------------------------

elem_kop :: Zuhbit t -> Integer

elem_kop Zhutsa = 0

elem_kop (Eraiki x a b) = 1 + (elem_kop a) + (elem_kop b)

-------------------------------------------------------------------

azpizuhaitzak_ezabatu :: Eq t => t -> Zuhbit t -> Zuhbit t

azpizuhaitzak_ezabatu x Zhutsa = Zhutsa

azpizuhaitzak_ezabatu x (Eraiki y a b)

 | x == y        = Eraiki y Zhutsa Zhutsa
 | otherwise     = Eraiki y (azpizuhaitzak_ezabatu x a) (azpizuhaitzak_ezabatu x b)

-------------------------------------------------------------------
data Bildura t1 t2 = A t1 | B t2
  deriving (Eq, Ord, Show, Read)
-------------------------------------------------------------------

hurrengoa :: Bildura Integer Char -> Bildura Integer Char

hurrengoa (A x) = A (x + 1)

hurrengoa (B x) = B (succ x)

-------------------------------------------------------------------


newtype Multzoa = Mul [Integer]
 deriving (Eq, Ord, Show, Read)



newtype Multzoa_orok t = Mulorok [t]
 deriving (Eq, Ord, Show, Read)

-------------------------------------------------------------------

multzokoa_da :: Integer -> Multzoa -> Bool

multzokoa_da x (Mul s) = x `elem` s

-------------------------------------------------------------------
bildura :: Multzoa -> Multzoa -> Multzoa

bildura (Mul r) (Mul s) = Mul (r ++ s)
-------------------------------------------------------------------
ebakidura :: Multzoa -> Multzoa -> Multzoa

ebakidura (Mul []) (Mul s) = Mul []
ebakidura (Mul (x:r)) (Mul s)
 | s == []       = Mul []
 | x `notElem` s = ebakidura (Mul r) (Mul s)
 | x `elem`s     = Mul (x: w)
                 where (Mul w) = (ebakidura (Mul r) (Mul s))  
-------------------------------------------------------------------
forma_normala :: Multzoa -> Multzoa

forma_normala (Mul []) = Mul []
forma_normala (Mul (x:s))
 | x `elem` s       = forma_normala (Mul s)
 | x `notElem`s     = Mul (x: w)
                          where (Mul w) = (forma_normala (Mul s))
-------------------------------------------------------------------

bildura_fn :: Multzoa -> Multzoa -> Multzoa

bildura_fn x y = forma_normala (bildura x y)
-------------------------------------------------------------------
ebakidura_fn :: Multzoa -> Multzoa -> Multzoa

ebakidura_fn x y = forma_normala (ebakidura x y) 
 
------------------------------------------------------------------
------------------------------------------------------------------

multzokoa_da_orok :: Eq t => t -> Multzoa_orok t -> Bool

multzokoa_da_orok x (Mulorok s) = x `elem` s

-------------------------------------------------------------------
bildura_orok :: Multzoa_orok t -> Multzoa_orok t -> Multzoa_orok t

bildura_orok (Mulorok r) (Mulorok s) = Mulorok (r ++ s)
-------------------------------------------------------------------
ebakidura_orok :: Eq t => Multzoa_orok t -> Multzoa_orok t -> Multzoa_orok t

ebakidura_orok (Mulorok []) (Mulorok s) = Mulorok []
ebakidura_orok (Mulorok (x:r)) (Mulorok s)
 | s == []       = Mulorok []
 | x `notElem` s = ebakidura_orok (Mulorok r) (Mulorok s)
 | x `elem`s     = Mulorok (x: w)
                 where (Mulorok w) = (ebakidura_orok (Mulorok r) (Mulorok s))  
-------------------------------------------------------------------

forma_normala_orok :: Eq t => Multzoa_orok t -> Multzoa_orok t

forma_normala_orok (Mulorok []) = Mulorok []
forma_normala_orok (Mulorok (x:s))
 | x `elem` s       = forma_normala_orok (Mulorok s)
 | x `notElem`s     = Mulorok (x: w)
                          where (Mulorok w) = (forma_normala_orok (Mulorok s))
-------------------------------------------------------------------

bildura_orok_fn :: Eq t => Multzoa_orok t -> Multzoa_orok t -> Multzoa_orok t

bildura_orok_fn x y = forma_normala_orok (bildura_orok x y)
-------------------------------------------------------------------
ebakidura_orok_fn :: Eq t => Multzoa_orok t -> Multzoa_orok t -> Multzoa_orok t

ebakidura_orok_fn x y = forma_normala_orok (ebakidura_orok x y)  
-------------------------------------------------------------------
data Hiru = AA | BB | CC
 deriving (Eq, Ord, Show, Read, Enum, Bounded)

-------------------------------------------------------------------
data Hiru2 = AA2 | BB2 | CC2
 deriving (Read, Enum, Bounded)

instance Eq Hiru2 where
 AA2 == AA2 	= True
 AA2 == x 	= False
 BB2 == AA2 	= False
 BB2 == x 	= True
 CC2 == AA2 	= False
 CC2 == x 	= True

instance Ord Hiru2 where
 AA2 <= AA2 	= True
 AA2 <= x 	= False
 BB2 <= x 	= True
 CC2 <= x 	= True

instance Show Hiru2 where
 show AA2 = "Bat"
 show BB2 = "Bi"
 show CC2 = "Hiru"
-------------------------------------------------------------------

data Tinta = Horia | Zian | Urdina | Magenta | Arrosa | Beltza
 deriving (Eq, Ord, Show, Read, Enum, Bounded)

-------------------------------------------------------------------
data Tinta2 = Horia2 | Zian2 | Urdina2 | Magenta2 | Arrosa2 | Beltza2
 deriving (Read, Enum, Bounded)

instance Eq Tinta2 where
 Horia2 == Horia2 = True
 Horia2 == x = False
 Urdina2 == Urdina2 = True
 Urdina2 == Zian2 = True
 Urdina2 == x = False
 Zian2 == Zian2 = True
 Zian2 == Urdina2 = True
 Zian2 == x = False
 Magenta2 == Magenta2 = True
 Magenta2 == Arrosa2 = True
 Magenta2 == x = False 
 Arrosa2 == Arrosa2 = True
 Arrosa2 == Magenta2 = True
 Arrosa2 == x = False
 Beltza2 == Beltza2 = True
 Beltza2 == x = False

instance Ord Tinta2 where
 Horia2 <= x = True
 Zian2 <= Horia2 = False
 Zian2 <= x = True
 Urdina2 <= Horia2 = False
 Urdina2 <= x = True
 Magenta2 <= Horia2 = False
 Magenta2 <= Zian2 = False
 Magenta2 <= Urdina2 = False
 Magenta2 <= x = True
 Arrosa2 <= Horia2 = False
 Arrosa2 <= Zian2 = False
 Arrosa2 <= Urdina2 = False
 Arrosa2 <= x = True
 Beltza2 <= Beltza2 = True
 Beltza2 <= x = False

instance Show Tinta2 where
 show Horia2 = "Horia"
 show Zian2 = "Zian"
 show Urdina2 = "Zian"
 show Magenta2 = "Magenta"
 show Arrosa2 = "Magenta"
 show Beltza2 = "Beltza"

-------------------------------------------------------------------

newtype Multzoa_orok2 t = Mulorok2 [t]
 deriving (Read)

instance Eq t => Eq (Multzoa_orok2 t) where
  s == r = ((azpimultzoa_orok2 s r) && (azpimultzoa_orok2 r s))

instance Eq t => Ord (Multzoa_orok2 t) where
  s <= r = (azpimultzoa_orok2 s r)

instance (Eq t, Show t) => Show (Multzoa_orok2 t) where
 show (Mulorok2 s) = ("{" ++ (elementu_katea s) ++ "}")



-------------------------------------------------------------------
azpimultzoa_orok2 :: Eq t => Multzoa_orok2 t -> Multzoa_orok2 t -> Bool
azpimultzoa_orok2 (Mulorok2 []) y = True
azpimultzoa_orok2 (Mulorok2 (x:s)) (Mulorok2 r)
 | x `notElem` r = False
 | otherwise = azpimultzoa_orok2 (Mulorok2 s) (Mulorok2 r)

-------------------------------------------------------------------
elementu_katea :: (Eq t,Show t) => [t] -> String

elementu_katea [] = ""
elementu_katea (x:s)
 | s == [] = show x
 | otherwise = (show x) ++ ", " ++ (elementu_katea s)

-------------------------------------------------------------------

-------------------------------------------------------------------

forma_normala_orok2 :: Eq t => Multzoa_orok2 t -> Multzoa_orok2 t

forma_normala_orok2 (Mulorok2 []) = Mulorok2 []
forma_normala_orok2 (Mulorok2 (x:s))
 | x `elem` s       = forma_normala_orok2 (Mulorok2 s)
 | x `notElem`s     = Mulorok2 (x: w)
                          where (Mulorok2 w) = (forma_normala_orok2 (Mulorok2 s))
-------------------------------------------------------------------

caracteres:: Char -> IO()

caracteres c = do
                 print c
                 let d = (succ c)
                 h <- getChar
                 caracteres d