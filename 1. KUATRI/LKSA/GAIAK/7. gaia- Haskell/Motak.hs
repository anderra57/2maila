module Motak where

type Sinboloa = Char
type Alfabetoa = [Sinboloa]
type Hitza = [Sinboloa]
type Egoera = Integer
type Egoerak = [Egoera]

type A_trantsizioa = (Egoera, Sinboloa, Egoera)
type E_trantsizioa = (Egoera, Egoera)
type A_trantsizioak = [A_trantsizioa]
type E_trantsizioak = [E_trantsizioa]
type Af = (Egoerak, Alfabetoa, A_trantsizioak, E_trantsizioak, Egoera, Egoerak)

data Af_motak = Afd | Afed | E_afed
		deriving(Eq, Ord, Show, Read, Enum, Bounded)
