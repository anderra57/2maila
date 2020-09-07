#1.ARIKETA
library(moments)
semealabakop<-c(0, 2, 3, 2, 4, 1, 2, 3, 3, 0, 2, 6, 2, 1, 2, 3, 1, 2, 3, 1, 2, 7, 2, 1, 4, 2, 3, 3, 1, 0)
#a)
table(semealabakop)
a<-as.data.frame(table(semealabakop))
a
seme_alaba_kop<-a $semealabakop
Maiztasun.abs<-a $Freq #bektorea sortu
Maiztasun.erl<-Maiztasun.abs/30
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(seme_alaba_kop,Maiztasun.abs,Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#b)
barplot(table(semealabakop),main="Barra grafikoa")
barplot(Met.maiztasun.erl)
plot(seme_alaba_kop,Met.maiztasun.erl,main="Maiztasun metatuen grafikoa")

#c)
y<-table(semealabakop)
moda<-names(y)[which(y==max(y))]
moda #moda
median(semealabakop) #mediana
batbest<- mean(semealabakop)
batbest #batez bestekoa

#d)
max(semealabakop)-min(semealabakop) #heina
quantile(semealabakop,0.75,type=2)-quantile(semealabakop,0.25,type=2)
IQR(semealabakop)
bariantza<-var(semealabakop)*(30-1)/30 
bariantza #bariantza
des.tip<-sqrt(bariantza)
des.tip
CV<-des.tip/batbest
CV

#e)
quantile(semealabakop,0.5,type=2) #Q2
quantile(semealabakop,0.1,type=2) #D1
quantile(semealabakop,0.4,type=2) #D4
quantile(semealabakop,0.9,type=2) #D9
quantile(semealabakop,0.3,type=2) #P30
quantile(semealabakop,0.85,type=2) #P85

#f)
skewness(semealabakop) #fisher alborapen koef
pearson<-(mean(semealabakop)-median(semealabakop))/des.tip
pearson #pearson alb. koef.
pearson2<-(batbest-2)/des.tip
pearson2
#eskuineerantz alboratua
kurtosis(semealabakop)-3 #kurtosia

#g)
boxplot(semealabakop,horizontal = T,col = "red")
boxplot.stats(semealabakop)




#2.ARIKETA
#a)
xi<-c(2,3,4,5,8)
maiztasun.abs.x<-c(2,4,3,4,1)
yi<-c(3500,4000,4500,5000,5500)
maiztasun.abs.y<-c(2,4,3,4,2)
txakurrak<-rep(xi,maiztasun.abs.x)
elefanteak<-rep(yi,maiztasun.abs.y)

batezbeste.txakurra<-mean(txakurrak)
bar.txakurra<-var(txakurrak)*(length(txakurrak-1)/length(txakurrak))
des.tip.txakurra<-sqrt(bar.txakurra)

batezbeste.elefante<-mean(elefanteak)
bar.elefante<-var(elefanteak)*(length(elefanteak-1)/length(elefanteak))
des.tip.elefante<-sqrt(bar.elefante)

des.tip.txakurra
des.tip.elefante