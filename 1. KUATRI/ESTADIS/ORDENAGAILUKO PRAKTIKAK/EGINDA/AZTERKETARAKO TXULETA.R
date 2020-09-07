library(moments)
read.table("Kotxeak.txt", header = T)
attach(datuak)
#MAIZTASUN TAULA:
	limiteak<-c(.............)#Tarte bakoitzaren limiteak
	bihurdurak.tarte<-cut(bihurdurak,limiteak,right=F,include.lowest =T)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
	bihurdurak.tarte
	table(bihurdurak.tarte)
datuak <- c(.............)
table(datuak)
a<-as.data.frame(table(datuak))#Taula datu-marko batean bihurtu dugu.
a
Balioak <- a$datuak
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/30
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Balioak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)
#IRUDIKATZEKO ERAK:
barplot(table(datuak)) #BARRA DIAGRAMA
pie(table(datuak), labels = c( "label1", "label2", "label3", "...")) #GAZTA
hist(datuak) #HISTOGRAMA
plot(datuak,Met.maiztasun.abs,type="s") #MAIZTASUN METATUEN GRAFIKOA
stem(datuak,scale=1) #ZURTOIN
Klasemarka<-c(,,,,,,) #Poligonoa
plot(Klasemarka,Maiztasun.abs,type="b",main = "Maiztasun absolutuak") #POLIGONO
boxplot(datuak, horizontal = T) #KUTXA DIAGRAMA
boxplot.stats(datuak) #KUTXA DIAG. STATS
#JOERA ZENTRALEKO NEURRIAK:
mean(datuak) #BATAZ BESTEKOA
median(datuak) #MEDIANA
Moda <- names(table(datuak))[which(table(datuak)==max(table(datuak)))] #MODA
na.rm = T #DATU NULURIK BALEGO
#SAKABANAKETA NEURRIAK:
var(datuak) #KUASIBARIANTZA
bariantza <- var(datuak)*(length(datuak)-1)/length(datuak) #BARIANTZA
desb.tip <- sqrt(bariantza) #DESB. TIP. 1
sd(datuak) #DESB. TIP. 2
cv <- desb.tip/mean(datuak)
#POSIZIOZKO NEURRIAK:
heina <- max(datuak)-min(datuak)
quantile(datuak,type=2) #KUARTIL GUZTIAK
quantile(datuak,probs=seq(0,1,0.1),type=2) #DEZILAK
quantile(datuak,0.5,type = 2) #KUANTILA KONKRETUA
RIC <- quantile(datuak,0.75,type = 2)-quantile(datuak,0.25,type = 2)
Heina <- max(datuak)-min(datuak)
#NOLA HARTU X DATU? 	$-REKIN
a<-erregaia$col1
b <- erregaia$col2
guztira<-a+b
#ASIMETRIA moments
skewness(datuak) #(ezkerrera alboratuta, simetrikoa, eskuinera alboratuta)
#KURTOSIA moments
kurtosis(datuak)-3 #(plati-, meso-, leptokurtikoa)
#PROBABILITATEA
ppois(a,lambda,lower.tail = F)#a pertsona baino gehiago
ppois(a,lambda) #a pertsona baino gutxiago
ppois(b,lambda)-ppois(a-1,lambda) #P(a<=X<=b)|(a tartearen barruan dagoenez a-1)
#ZORIZ LAGINA SORTU
rnorm(n,mu,sigma)
#KONFIANTZA TARTEAK
t.test(datuak,conf.level = 0.99)$conf #tartea, batezbestekoarena, lagin 1, alpha = 0.01 (berez, alpha=0.05)
t.test(d1,d2,var.equal = T)$conf #tartea, batezbestekoarena, bi lagin, bariantzak berdinak
KT95 <- c((((n-1)*var(d1))/qchisq(1-alpha/2,n-1)),(((n-1)*var(d1))/qchisq(alpha/2,n-1))) #tartea, bariantzarena, a=0.05
var.test(bitxitegi1,bitxitegi2)$conf #bariantzen zatiketaren tartea
prop.test(x,n,conf.level = 0.99)$conf #proportzioen tartea
N1<-length(which(datuak<=tartearenhasiera)) #zenbat balio ezkerrean?
N2<-length(which(datuak>=tartearenbukaera)) #zenbat balio eskuinean?
N1+N2 #zenbat balio kanpoan guztira?
#HIPOTESI KONTRASTEA
xxxx.test() #p-value>alpha, H0 onartu ; p<alpha, H0 errefusatu
t.test(datuak, mu=uste dena)
EK <- c(erh,erb) #eremu kritikoa
Onarpen.eremu <- c(erh,erb) #onarpen eremua
Estatistikoa <- (n-1)*var(piezak)/(uste den sigma^2)
pbalioa <- pchisq(Estatistikoa, (n-1))
curve(dbanaketa(x,,),mugaezk,mugaesk)
segments(0,0,x,0)
segments(erh,0,erh,df(erh,5,4)) #erh eremu hasiera
segments(erb,0,erb,df(erb,5,4)) #erb eremu bukaera