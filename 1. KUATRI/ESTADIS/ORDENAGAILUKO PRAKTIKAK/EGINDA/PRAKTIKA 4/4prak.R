#1.ARIKETA
#X="Aholkularitza enpresa baten aholkuak jasotzen dituen pertsona kopurua"
#poisson, lambda=1200

#a)   P(X>1085)
1-ppois(1085,1200)

#b)   P(1200<=X<=1300)
ppois(1300,1200)-ppois(1199,1200) #1200 barne egon behar denez, 1199tik hartu


#edo
1-pnorm(1085.5,1200,sqrt(1200)) #a)
pnorm(1300.5,1200,sqrt(1200))-pnorm(1199.5,1200,sqrt(1200))

#2.ARIKETA
#X="puntu kopurua"
#mu=60 ; sigma=10




#4.ARIKETA
#a)
1-pbinom(5,9,0.95) #gutxienez 6 osagai ondo funtzionatzeko prob

#b)
osagaiak<-0:9
plot(osagaiak,dbinom(osagaiak,9,0.95),type = "h",ylab = "F(x)")
