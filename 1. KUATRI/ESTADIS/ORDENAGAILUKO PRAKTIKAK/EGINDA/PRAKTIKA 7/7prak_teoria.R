kloromaila<- c(2.2,1.9,1.7,1.6,1.7,1.8,1.7,1.9,2.0,2.0)
t.test(kloromaila, mu=1.9)
x<-c(2.2,1.9,1.7,1.6,1.7,1.8,1.7,1.9,2.0,2.0)
bariantza.test<- function(x,conf.level=0.95){
+ n = length(x)
+ alfa = 1-conf.level
+ balkrit1 = qchisq(1-alfa/2,n-1)
+ balkrit2 = qchisq(alfa/2,n-1)
+ c((n-1)*var(x)/balkrit1,(n-1)*var(x)/balkrit2)}
bariantza.test(kloromaila)