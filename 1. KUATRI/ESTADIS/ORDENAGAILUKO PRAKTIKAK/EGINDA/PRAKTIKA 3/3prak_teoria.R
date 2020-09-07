datuak<- c(1,1,1,2,3,3,1,2,2,1,3,1,1)
N <- length(datuak)
bariantza <- var(datuak)*(N-1)/N
des.tip<- sqrt(bariantza)

library(moments)
skewness(datuak)
al<-datuak-rep(mean(datuak),length(datuak))
sum(al^3)/(length(datuak)*des.tip^3)
pearson<-(mean(datuak)-1)/des.tip
pearson
pearson1<-(mean(datuak)-median(datuak))/des.tip
pearson1
kurtosis(datuak)-3

boxplot(datuak,horizontal = T,col = "red")

####

datuak1<- c(115,232,181,161,155,137,165,171,139,130,406)
boxplot.stats(datuak1)
