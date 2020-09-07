dbinom(4,10,0.3) #prob
pbinom(4,10,0.3) #banaketa funtz

dpois(8,3)
ppois(8,3) #prob metatua

dhyper(2,4,6,3)  #(x, arrakasta kop, porrot kop, zenbat hartu)
phyper(2,4,6,3) #P(X>=2)
1-phyper(1,4,6,3) #P(X<1)

Dado<-1:6
sample(Dado,1) #behin
sample(Dado,10,replace = T) #hamar aldiz, errepikapenarekin
dadotrukatua<-c(0.1,0.1,0.1,0.1,0.1,0.5)
sample(Dado,10,replace = T,prob = dadotrukatua)

x<-0:5 #gutxienez 0 aldiz, gehienez 5
plot(x,dbinom(x,5,2/6),type = "h",ylab = "p(x)")

plot(x,pbinom(x,5,2/6),type = "s",ylab = "F(x)")
