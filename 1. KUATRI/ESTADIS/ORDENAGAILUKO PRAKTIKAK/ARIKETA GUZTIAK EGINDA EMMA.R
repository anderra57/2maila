#IKASTEKO ARIKETAK
#########################################################################################################
#1.Praktika. Sarrera.
#########################################################################################################

#1.Ariketa
#a)
((1+2)/(3+4))^2

#b)
sqrt(exp(2)+ log(3,2))

#c)
prod(1:21)


#2.Ariketa
x=c(20.5,12.6,-23,-6.98,24,32.8,7,-8.6)
f = c(3,4,2,6,5,7,4,9) 

f/cumsum(f)
sum(f*x)
sum(x*(f/cumsum(f)))
sum(x^2*f)


#3.Ariketa
#a)
km = c(31422, 31801, 32131, 32691, 33077, 33514, 33992)

#b) Ondoz ondoko bektorearen elementuen arteko kenketa
diff(km)

#c)
mean(km) #Bektorearen balioen batez bestekoa kalkulatu
mean(diff(km)) #Diferentzen batez bestekoa


#4.Ariketa
#a)
x1 = seq(0,1.2, length=20)

#b)
length(x1)

#c)
min(x1)
max(x1)

#d)
x1[1] = 10
x1[1]

#e)
y1 = exp(x1)

#g)
plot(x1,y1)

#h)
hist(x1)


#5.Ariketa
bak = seq(1,200,2)
sort(bak)


#6.Ariekta
bik = seq(100,199,2)
plot(bik,log(bik))
plot(bik,cos(bik))


#7.Ariketa
bb = function(x) sum(x)/length(x)
bektorea = c(1,23,3423,445,23,0.57,-678)
bb(bektorea)


#8.Ariketa
funtzioa = function(x) sin(x^2+x^3)
funtzioa(-3*pi)
funtzioa(-2*pi)
funtzioa(-1*pi)
funtzioa(0)
funtzioa(pi)
funtzioa(2*pi)
funtzioa(3*pi)
plot(funtzioa,-1*pi,pi)


#9.Ariketa
bik20 = seq(0,40,2)
bik20ber2 = bik20^2
bik20ber3 = bik20^3

markoa = data.frame(bik20,bik20ber2,bik20ber3)
write.table(markoa,"bikoitiak")


#10.Ariketa




#########################################################################################################
#2.Praktika. Estatistika Deskribatzailea I.
#########################################################################################################

#1.Ariketa
lodierak <- c(1,2,3,3,2,1,2,5,2,4,4,4,5,3,2,5,3,4,1,4,2,3,1,1,2,5,3,4,1,3)
#a)
table(lodierak)
a<-as.data.frame(table(lodierak))#Taula datu-marko batean bihurtu dugu.
a
Balioak <- a$lodierak
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/30
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Balioak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#b)
barplot(table(lodierak))

#c)
pie(table(lodierak), labels = c( "oso mehea", "mehea", "ertaina", "lodia", "oso lodia"))


#2.Ariketa
#b)
hauste_tentsioa <- read.table("Hauste_tentsioa.txt ", header = T)

#c)
tn.cm2 <- hauste_tentsioa$Hauste_tentsioa.Tn.cm2.
stem(tn.cm2, scale = 2)

#d)Errorea?
min(tn.cm2)
max(tn.cm2)
hist(table(tn.cm2),breaks = c(3.27,3.47,3.67,3.87,4.07,4.27,4.47,4.67,4.87))

#e)
mean(tn.cm2)
median(tn.cm2)
Moda <- names(table(tn.cm2))[which(table(tn.cm2)==max(table(tn.cm2)))]
Moda


#f)
bariantza <- var(tn.cm2)*(length(tn.cm2)-1)/length(tn.cm2)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip
cv <- desb.tip/mean(tn.cm2)
cv
heina <- max(tn.cm2)-min(tn.cm2)
heina

#g)
quantile(tn.cm2,type=2)


#3.Ariketa
bihurdurak <- c(33,21,32,44,35,22,40,36,22,37,20,37,42,31,23,44,32,30,44,44,42,35,40,36,32,31,37,43,24,40,25,30,26,35,33,41,25,44,36,27)
max(bihurdurak)
min(bihurdurak)

#a)
limiteak<-c(20,24,28,32,36,40,44)#Tarte bakoitzaren limiteak
bihurdurak.tarte<-cut(bihurdurak,limiteak,right=F,include.lowest =T)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
bihurdurak.tarte
table(bihurdurak.tarte)
a<-as.data.frame(table(bihurdurak.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$bihurdurak.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/35
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)


#b)
hist(table(bihurdurak))
Klasemarka<-c(22,26,30,34,38,42) #Poligonoa
plot(Klasemarka,Maiztasun.abs,type="b",main = "Maiztasun absolutuak")

#c)
mean(bihurdurak)
median(bihurdurak)
Moda <- names(table(bihurdurak))[which(table(bihurdurak)==max(table(bihurdurak)))]
Moda
bariantza <- var(bihurdurak)*(length(bihurdurak)-1)/length(bihurdurak)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip


#4.Ariketa
datuak<-c(51,55,42,53,46,60,29,56,20,52,51,33,61,57,55,59,38,56,41,47,68,24,67,52,64,69,43,47,42,65,96,21,48,47,25,82,37,60,12,77,56,97,28,45,63,28,45,63,28,52,60,51,61,62,52,97,73,45,69,67,29,75,63,30,17,69,68,74,16,83,47,16)
max(datuak)

#a)
limiteak<-c(10.5,21.5,32.5,43.5,54.5,65.5,76.5,87.5,98.5)#Tarte bakoitzaren limiteak
datuak.tarte<-cut(datuak,limiteak,right=F)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
datuak.tarte
table(datuak.tarte)
a<-as.data.frame(table(datuak.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$datuak.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/72
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#b)
hist(datuak)
stem(datuak,scale=1)

#c)
mean(datuak)
median(datuak)
bariantza <- var(datuak)*(length(datuak)-1)/length(datuak)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip


#5.Ariketa
kalitatea <- c(1,2,2,3,3,2,3,3,4,3,1,3,1,5,4,3,2,3)
#a)
barplot(table(kalitatea))
pie(table(kalitatea))

#b)
mean(kalitatea)
median(kalitatea)


#6.Ariketa
aptitudea<-c(37,37.2,37.2,37.2,37.2,37.2,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,37.5,38,38,38,38,38,38,38.1,38.1,38.1,38.1,38.1,38.1,38.1,38.1,38.1,38.1,38.5,38.5,38.5,38.5,38.5)
#a)
mean(aptitudea)
median(aptitudea)
Moda <- names(table(aptitudea))[which(table(aptitudea)==max(table(aptitudea)))]
Moda
bariantza <- var(aptitudea)*(length(aptitudea)-1)/length(aptitudea)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#b)
quantile(aptitudea,0.65,type = 2)
quantile(aptitudea,0.9,type = 2)


#7.Ariketa
#a)
datuak2 <- rep(c(15,25,35,50),c(22,26,6,4))
datuak2
mean(datuak2)
median(datuak2)
bariantza <- var(datuak2)*(length(datuak2)-1)/length(datuak2)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#b)
limiteak<-c(10,20,30,40,60)#Tarte bakoitzaren limiteak
datuak2.tarte<-cut(datuak2,limiteak,right=F)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
datuak2.tarte
table(datuak2.tarte)
a<-as.data.frame(table(datuak2.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$datuak2.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/58
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#c)
quantile(datuak2,seq(0,1,0.1),type = 2)
quantile(datuak2,type = 2)
RIC <- quantile(datuak2,0.75,type = 2) - quantile(datuak2,0.25,type = 2)
RIC

#8.Ariketa
#a)
erregaia <- read.table("Kotxeak.txt", header = T)
erregaia

#b)
guztiak <- erregaia$Gasolina.kotxeak + erregaia$Gas.oil.kotxeak
mean(guztiak)

median(guztiak)

bariantza1 <- var(guztiak)*(length(guztiak)-1)/length(guztiak)
bariantza1
desb.tip1 <- sqrt(bariantza1)
desb.tip1

#c)Nola hartu x datu??
gasoil<-erregaia$Gas.oil.kotxeak*0.9
besteak <- erregaia$Beste.kotxeak*1.145
guztiak2 <- gasoil+besteak+erregaia$Gasolina.kotxeak

mean(guztiak2)
bariantza2 <- var(guztiak2)*(length(guztiak2)-1)/length(guztiak2)
bariantza2
desb.tip2 <- sqrt(bariantza2)
desb.tip2

#d)
total <- erregaia$Gasolina.kotxeak+erregaia$Gas.oil.kotxeak+erregaia$Beste.kotxeak
total
sort(total)
total21 <- sort(total)[1:21]
total21

max(total21)-min(total21)
sqrt(21)
210052/4.6
limiteak<-c(41154,86817.48,132480.96,178144.44,223807.92,269471.4)#Tarte bakoitzaren limiteak
total21.tarte<-cut(total21,limiteak,right=F)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
total21.tarte
table(total21.tarte)
a<-as.data.frame(table(total21.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$total21.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/21
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#9.Ariketa
Potentzia <- c(5,6,7,8,9,10,11,12)
Maiztasun.abs <- 480* c(7.5,5,20,18.75,15,17.5,8.75,7.5)/100
sum(Maiztasun.abs)
Maiztasun.erl <- Maiztasun.abs/480
Met.maiztasun.abs<- cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Potentzia,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#a)
plot(Potentzia,Maiztasun.abs,type = "h")
barplot(Maiztasun.abs)

#b)
datuak1 <- rep(Potentzia,Maiztasun.abs)
mean(datuak1)

#c)
bariantza <- var(datuak1)*(length(datuak1)-1)/length(datuak1)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#d)
Datu.90gabe <- datuak1[-seq(391,480,1)]
Datu.berriak <- c(Datu.90gabe, rep(5,90))
Datu.berriak
mean(Datu.berriak)
Jaitsiera <- (mean(datuak)-mean(Datu.berriak))/mean(datuak)*100
Jaitsiera


#########################################################################################################
#3.Praktika. Estatistika Deskribatzailea II.
#########################################################################################################

library(moments)

#1.Ariketa
umeak<- c(0,2,3,2,4,1,2,3,3,0,2,6,2,1,2, 3, 1, 2, 3, 1, 2, 7, 2, 1, 4, 2, 3, 3, 1, 0)

#a)
table(umeak)
a<-as.data.frame(table(umeak))#Taula datu-marko batean bihurtu dugu.
a
Umeak<-a$umeak 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/30
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Umeak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#b)
barplot(table(umeak))
plot(Umeak,Met.maiztasun.abs,type="s")

#c)
mean(umeak)
median(umeak)
Moda <- names(table(umeak))[which(table(umeak)==max(table(umeak)))]
Moda

#d)
bariantza <- var(umeak)*(length(umeak)-1)/length(umeak)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip
heina <- max(umeak)-min(umeak)
heina
cv <- desb.tip / mean(umeak)
cv
RIC <- quantile(umeak,0.75,type = 2)-quantile(umeak,0.25,type = 2)
RIC

#e)
quantile(umeak,0.5,type = 2)
quantile(umeak,0.1,type = 2)
quantile(umeak,0.4,type = 2)
quantile(umeak,0.9,type = 2)
quantile(umeak,0.3,type = 2)
quantile(umeak,0.85,type = 2)

#f)
skewness(umeak) #eskuinerantz alboratua
kurtosis(umeak)-3 #leptokurtikoa

#g)
boxplot(umeak, horizontal = T)
boxplot.stats(umeak)
#Balio arraro bat: 7


#2.Ariketa
txakurrak <- c(2,2,3,3,3,3,4,4,4,5,5,5,5,8)
elefanteak <- c(3500,3500,4000,4000,4000,4000,4500,4500,4500,5000,5000,5000,5000,5500,5500)

bbt <- mean(txakurrak)
bbt
bbe <- mean(elefanteak)
bbe

bariantzat <- var(txakurrak)*(length(txakurrak)-1)/length(txakurrak)
bariantzat
desb.tipt <- sqrt(bariantzat)
desb.tipt

bariantzae <- var(elefanteak)*(length(elefanteak)-1)/length(elefanteak)
bariantzae
desb.tipe <- sqrt(bariantzae)
desb.tipe

zt <- (3-bbt)/desb.tipt
zt
ze <- (4000-bbe)/desb.tipe
ze
#ze < zt, beraz txarrurrak erlatiboki gehiago pisatzen du

cvt <- desb.tipt/bbt
cvt
cve <- desb.tipe/bbe
cve
# cve < cvt, beraz elefantearena da adierazgarriagoa
#Sakabanaketa txikiagoa: elefantea


#3.Ariketa
soldatak <- c(1200, 1500,1300, 2000, 3000)
#a)
mean(soldatak)
bariantza <- var(soldatak)*(length(soldatak)-1)/length(soldatak)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#b)
soldatak1 <- soldatak*1.2
mean(soldatak1)
bariantza <- var(soldatak1)*(length(soldatak1)-1)/length(soldatak1)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#c)
soldatak2 <- soldatak+200
mean(soldatak2)
bariantza <- var(soldatak2)*(length(soldatak2)-1)/length(soldatak2)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#d)
soldatak3 <- soldatak*1.1+150
mean(soldatak3)
bariantza <- var(soldatak3)*(length(soldatak3)-1)/length(soldatak3)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#e)
#Hasierako soldataren arabera


#4.Ariketa
gasolina_kontsumoa <- c(2.1,4.7,3.3,3.3,2.8,4.4,4.4,4.8,3.1,3,3.9,4,4,2.3,3.7,5,3.8,2.5,2.7,2.8,2.7,2.6,3,5.1,4.8,3.7,4.7)
length(gasolina_kontsumoa)

#a)
limiteak<-c(2.1,2.7,3.3,3.9,4.5,5.1)#Tarte bakoitzaren limiteak
gasolina_kontsumoa.tarte<-cut(gasolina_kontsumoa,limiteak,right=F, include.lowest = T)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
gasolina_kontsumoa.tarte
table(gasolina_kontsumoa.tarte)
a<-as.data.frame(table(gasolina_kontsumoa.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$gasolina_kontsumoa.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/27
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

hist(gasolina_kontsumoa)

#b)
mean(gasolina_kontsumoa)
median(gasolina_kontsumoa)
Moda <- names(table(gasolina_kontsumoa))[which(table(gasolina_kontsumoa)==max(table(gasolina_kontsumoa)))]
Moda
bariantza <- var(gasolina_kontsumoa)*(length(gasolina_kontsumoa)-1)/length(gasolina_kontsumoa)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip
cv <- desb.tip/mean(gasolina_kontsumoa)
cv

#c)
quantile(gasolina_kontsumoa,0.25,type = 2)
quantile(gasolina_kontsumoa,0.75,type = 2)
RIC <- quantile(gasolina_kontsumoa,0.75,type = 2)-quantile(gasolina_kontsumoa,0.25,type = 2)
RIC
Heina <- max(gasolina_kontsumoa)-min(gasolina_kontsumoa)
Heina

#d)
pearson <- (mean(gasolina_kontsumoa))/desb.tip
pearson
#Eskuinerantz alboratua
kurtosis(gasolina_kontsumoa)-3
#platikurtikoa


#5.Ariketa
kontsumoa <- c(4.3,4.4,4.5,4.5,4.5,4.6,4.6,4.6,4.6,4.7,4.7,4.7,4.7,4.7,4.8,4.8,4.8,4.8,4.8,4.8,4.8,4.9,4.9,4.9,4.9,4.9,5,5,5.1,5.1,5.2,5.6)
#a)
mean(kontsumoa)
median(kontsumoa)
bariantza <- var(kontsumoa)*(length(kontsumoa)-1)/length(kontsumoa)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip
Moda <- names(table(kontsumoa))[which(table(kontsumoa)==max(table(kontsumoa)))]
Moda

#b)
boxplot(kontsumoa, horizontal = T)

#c)Balio arraroak: 5.6
boxplot.stats(kontsumoa)
length(kontsumoa)
kontsumoaberria <- kontsumoa[-32]
kontsumoaberria
mean(kontsumoaberria)
bariantza <- var(kontsumoaberria)*(length(kontsumoaberria)-1)/length(kontsumoaberria)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip


#6.Ariketa
hezetasun_maila <- c(40.6,33.7,32.7,44.1,34.8,33.5,41,35.1,34.6,39.8,34.8,35.8,39.4,38.9,46.1,42.6,37.4,41.8,36.5,45.5,37.6,43.8,35.8,42.4,34.5,41.5,31.1,42.3,31.2)
#a)
mean(hezetasun_maila)
median(hezetasun_maila)

boxplot.stats(hezetasun_maila)
#ez dago balio arrarorik

#b)
bariantza <- var(hezetasun_maila)*(length(hezetasun_maila)-1)/length(hezetasun_maila)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#c)
hezetasun_maila_berria <- hezetasun_maila*0.77
hezetasun_maila_berria
mean(hezetasun_maila_berria)

#d)
min(hezetasun_maila)
max(hezetasun_maila)
limiteak<-c(31.1,34.1,37.1,40.1,43.1,46.1)#Tarte bakoitzaren limiteak
hezetasun_maila.tarte<-cut(hezetasun_maila,limiteak,right=F,include.lowest = T)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
hezetasun_maila.tarte
table(hezetasun_maila.tarte)
a<-as.data.frame(table(hezetasun_maila.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$hezetasun_maila.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/29
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

hist(hezetasun_maila,breaks =c(31.1,34.1,37.1,40.1,43.1,46.1))


#7.Ariketa
#a)
zuntzak <- read.table("Zuntzak.txt",header = T)
zuntzak
attach(zuntzak)

#b)
max(zuntzak$Luzera_.mm.)
min(zuntzak$Luzera_.mm.)
hist(zuntzak$Luzera_.mm., breaks = 15)

#c)
mean(zuntzak$Diametroa_.mm.)
bariantza <- var(zuntzak$Diametroa_.mm.)*(length(zuntzak$Diametroa_.mm.)-1)/length(zuntzak$Diametroa_.mm.)
bariantza
desb.tip <- sqrt(bariantza)
desb.tip

#d)
quantile(zuntzak$Diametroa_.mm.,0.88,type = 2)
length(which(zuntzak$Diametroa_.mm.>5.19))

#e)
volumena <- pi*zuntzak$Luzera_.mm.*(zuntzak$Diametroa_.mm./2)^2
masa <- volumena * 0.74 
masa

max(masa)
min(masa)
length(masa)
limiteak<-c(15,130,245,360,475,590,705,820,935,1050,1165,1280)#Tarte bakoitzaren limiteak
masa.tarte<-cut(masa,limiteak,right=F)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
masa.tarte
table(masa.tarte)
a<-as.data.frame(table(masa.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$masa.tarte
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/115
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)


#########################################################################################################
#4.Praktika. Zorizko Aldagaiak.
#########################################################################################################

#1.Ariketa
#X."Aholkularitza enpresa batek urtean batezbeste alholkua eman dion persona kopurua"
#X-Possion(1200)
#a) P(X > 1085)
ppois(1085,1200,lower.tail = F)

#b) P(1200<=X<=1300)
ppois(1300,1200)-ppois(1199,1200)


#2.Ariketa
#X: "Ikasleen puntuazioak"
#X-N(60,10)
#a)p(X>=70)
pnorm((69-60)/10,0,1, lower.tail = F)
pnorm(69,60,10, lower.tail = F)

#b) P(39<=X<=80)
pnorm((80-60)/10,0,1)-pnorm((38-60)/10,0,1)
pnorm(80,60,10)-pnorm(38,60,10)

#c) P(40<=X<=80)
pnorm((80-60)/10,0,1)-pnorm((39-60)/10,0,1)
pnorm(80,60,10)-pnorm(39,60,10)

#d) 1-P(40<=X<=80)
1-(pnorm((80-60)/10,0,1)-pnorm((39-60)/10,0,1))
1-(pnorm(80,60,10)-pnorm(39,60,10))

#e) 
200*pnorm((70-60)/10,0,1, lower.tail = F)
200*pnorm(70,60,10, lower.tail = F)


#3.Ariketa
#X1:Tresna elektroniko baten bizi-iraupena orduko
#X2:Bigarren tresna elektroniko baten bizi-iraupena orduko
#X1-E(40)
#X2-E(45)
#a) P(X>=45)
pexp(44,1/40,lower.tail = F)
pexp(44,1/45,lower.tail = F)
#Bigarrena

#b)
balioak <- 0:60
curve(dexp(x,1/40),0,60)


#4.Ariketa
#X:Sistema batean era egokian funtzionatzen duten osagai kopurua
#X-Bin(9,1,0.95)
#a)P(X>=6)
pbinom(5,9,0.95,lower.tail = F)

#b)
osagai <- 0:9
plot(osagai,dbinom(osagai,9,0.95),type = "h",ylab = "p(x)")


#5.Ariketa
#X:"Okindegi batean saltzen diren ogi kopurua"
#X-N(700,30)
#a)P(X<=x)=0.99
qnorm(0.99,700,30)

#b)
curve(dnorm(x,700,30),600,800)


#6.Ariketa
#X:"Zirkuitu mota zehatz baten bizi-itxaropena"
#X-E(1000)
#a)P(900<=X<=1200)
pexp(1200,1/1000)-pexp(899,1/1000)

#b)P(X>800)
pexp(800,1/1000,lower.tail = F)

#c)P(X>x)=0.95
qexp(0.05,1/1000)


#7.Ariketa
#X:"Inprimategi zehatz batean inprimatutako liburu ez akastun kopurua"
#X-H(15,2,12/15)
#a)P(X>=1)
phyper(0,12,3,2,lower.tail = F)

#b)
liburuak <- 0:15
plot(liburuak,phyper(liburuak,12,3,2),type = "h")


#8.Ariketa
#X:"Lantegi batean segurtasun faltagatik izandako istripu kopurua"
#X-Bin(n,0.7)
#a)X-Bin(4,0.7); P(X=2)
dbinom(2,4,0.7)

#b)X-Bin(4,0.7); P(X>=2)
pbinom(1,4,0.7,lower.tail = F)


#9.Ariketa
#X:"Alarma akastun kopurua"
#X-H(200,3,6/200)
#a)P(X=1)
dhyper(1,6,194,3)

#b)P(X>=2)
phyper(1,6,194,3,lower.tail = F)


#10.Ariketa
#a)
#Probabilitateak
Ord.gabe.itzul.gabe <- 24*(4/40)*(4/39)*(4/38)*(28/37)
Ord.gabe.itzul.gabe

Ord.gabe.itzul <- 24*(4/40)*(4/40)*(4/40)*(28/40)
Ord.gabe.itzul

Ord.itzul.gabe <- (4/40)*(4/39)*(4/38)*(28/37)
Ord.itzul.gabe

Ord.itzul <- (4/40)*(4/40)*(4/40)*(28/40)
Ord.itzul

#X:"Arrakasta kopurua"
#X-Bin(200,p)
dbinom(5,200,Ord.gabe.itzul.gabe)
dbinom(5,200,Ord.gabe.itzul)
dbinom(5,200,Ord.itzul.gabe)
dbinom(5,200,Ord.itzul)

#b)P(X>5)
pbinom(5,200,Ord.itzul.gabe,lower.tail = F)
pbinom(5,200,Ord.itzul,lower.tail = F)


#11.Ariketa
#X:"Hartutako hodi kopurua"
#Aluminio->X1-H(465,9,120/465)
#Kobre->X2-H(465,9,145/465)
#PVC->X3-H(465,9,200/465)
#a)P(X2=9)
dhyper(9,145,320,9)

#b)P(X1>=4)
phyper(3,120,345,9,lower.tail = F)

#c)P(3<=X<=7)
phyper(7,320,145,9)-phyper(2,320,145,9)

#d)
hodiak <- 0:9
plot(hodiak,dhyper(hodiak,145,320,9),type = "h")


#12.Ariketa
#X:"Ondo erantzundako galdera kopurua"
#X-Bin(n,0.5)
#a)P(X>50)
#1. 40 daki beraz 80-40=40 , 50-40=10
pbinom(10,40,0.5,lower.tail = F)
#2. 20 daki beraz 80-20=60 , 50-20=30
pbinom(30,60,0.5, lower.tail = F)

#b) 55-20=35 P(X>=35)
pbinom(34,60,0.5,lower.tail = F)

#c) P(X>=40)
pbinom(39,80,0.5,lower.tail = F)


#########################################################################################################
#5.Praktika. Errepasoa.
#########################################################################################################

#1.Ariketa
#X:"Minutu bakoitzean batezbeste bidegurutzera herltzen diren auto kopurua"
#X-Poisson(1)
#a)P(X>=3)
ppois(2,1,lower.tail = F)

#b)P(X>3)
ppois(3,1,lower.tail = F)
#Ez, probabilitatea nahiko txikia den arren


#2.Ariketa
#EGINDA 2.Praktika, 9.Ariketa


#3.Ariketa
#EGINDA 4.Praktika, 10.Ariketa


#4.Ariketa
#EGINDA 3.Praktika, 6.Ariketa


#5.Ariketa
#X:"Trokelatzeko makina batek egindako pieza onargarri kopurua"
#X-H(50,20,45/50)
#a)P(X=20)
dhyper(20,45,5,20)

#b)P(X=15)+P(X=16)
dhyper(15,45,5,20)+dhyper(16,45,5,20)

#c)
20*45/50


#6.Ariketa
#a)
tuboak <- read.table("Tuboak.txT",header = T)
tuboak
attach(tuboak)
luzera <- tuboak$Tubo.luzera

#b)
sort(luzera)
bariantza <- var(luzera)*(length(luzera)-1)/length(luzera)
bariantza
kurtosis(luzera)-3 #platikurtikoa
skewness(luzera) #Eskuinerantz alboratua

#c)
max(luzera)
min(luzera)
length(luzera)
limiteak<-c(43,43.9,44.8,45.7,46.6,47.5,48.4,49.3,50.2,51.1)#Tarte bakoitzaren limiteak
luzera.tarte<-cut(luzera,limiteak,right=F)#Tarteak eskuinetik irekiak nahi ditugunez right=F.
luzera.tarte
table(luzera.tarte)
a<-as.data.frame(table(luzera.tarte))#Taula datu-marko batean bihurtu dugu.
a
Tarteak<-a$luzera.tarte 
Maiztasun.abs<-a$Freq 
sum(Maiztasun.abs)#Datu guztien batuketa
Maiztasun.erl<-Maiztasun.abs/140
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs, Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#d)
quantile(luzera,0.42,type = 2)
length(which(luzera > 45.856))

quantile(luzera,0.5,type = 2)
length(which(luzera > 46.3955))

#e)
boxplot(luzera,horizontal = T)


#########################################################################################################
#6.Praktika. Estimazioa.
#########################################################################################################

#1.Ariketa
bitxitegi1 <- c(1320,1495,990,1250,1290,1900,1500,1100,1250,1100,1930)
bitxitegi2 <- c(1110,1405,985,1290,1300,1705,1200,1105,1150,1210)

#a)alpha = 0.05
t.test(bitxitegi1)$conf

#b) alpha = 0.01
t.test(bitxitegi1,conf.level = 0.99)$conf

#c)
t.test(bitxitegi1,bitxitegi2,conf.level = 0.99,var.equal = F)$conf

#d)
t.test(bitxitegi1,bitxitegi2,var.equal = T)$conf

#e)
length(bitxitegi1)
KT95 <- c(((10*var(bitxitegi1))/qchisq(0.975,10)),((10*var(bitxitegi1))/qchisq(0.025,10)))
KT95

#f)
var.test(bitxitegi1,bitxitegi2)$conf

#g)1 balioa tartearen barnean dagoenez, bariantzak berdinak direla ondoriozta daiteke


#2.Ariketa
#X."Lote batean dauden pieza akastunen proportzioa"
#n=200, p=0.15, alpha = 0.05
prop.test(200*0.15,200)$conf


#3.Ariketa
#X:"Marka bateko auto berren artean konponketak behar dituzten kopurua"
#n1=200 , x1=9
#n2=300 , x2=15
#alpha = 0.01
p1=9/200
q1=1-p1
p2=15/300
q2=1-p2
KT99 <- c(((p1-p2)-qnorm(0.995,0,1)*sqrt(p1*q1/200+p2*q2/300)),((p1-p2)+qnorm(0.995,0,1)*sqrt(p1*q1/200+p2*q2/300)))
KT99


#4.Ariketa
#X-N(10,4)
lagina <- rnorm(20,10,4)
#a)
t.test(lagina)$conf

#b)
KT99 <- c(((19*var(lagina))/qchisq(0.995,19)),((19*var(lagina))/qchisq(0.005,19)))
KT99


#5.Ariketa
#x:"Unibertsitate zehatz bateko ikasle ez erretzaileen proportzioa"
#n=101, x=82, alpha = 0.01
prop.test(82,101,conf.level = 0.99)$conf


#6.Ariketa
#X:"Lanpara halogenoen bizi iraupena"
#X-N(mu,sigma)
lanpara<-c(480,345,427,386,432,429,378,440,434,503,436,451,466,394,422,412,507,433,480,429)
t.test(lanpara)$conf


#7.Ariketa
#X:"Mota bereko 25 aberrei egindako proba baten emaitzak"
#X-N(82,sigma)
s = 0.85
KT90 <- c((24*s^2/qchisq(0.95,24)),(24*s^2/qchisq(0.05,24)))
KT90


#8.Ariketa
olibondoak <- read.table("Olibondoak.txt", header = T)
olibondoak

#a)
#x1:"Tratamendua jaso ez duten fruituen diametroa"
#x2:"Tratamendua jaso duten fruituen diametroa"
tratamenduez <- olibondoak$Lehen
tratamenduez
tratamendubai <- olibondoak$Ondoren
tratamendubai

mean(tratamenduez,na.rm = T)
mean(tratamendubai,na.rm = T)

var(tratamenduez,na.rm = T)
var(tratamendubai,na.rm = T)

sd(tratamenduez, na.rm = T)
sd(tratamendubai, na.rm = T)

#b)
t.test(tratamendubai, conf.level = 0.98)$conf
t.test(tratamenduez, conf.level = 0.98)$conf

#c)
var.test(tratamendubai,tratamenduez)$conf
t.test(tratamendubai,tratamenduez)$conf


#########################################################################################################
#7.Praktika. Hipotesi Kontrastea.
#########################################################################################################

#1.Ariketa
salmentak <- read.table("Salmentak.txt", header = T)
salmentak
bitxitegiA <- salmentak$SalmentaA
bitxitegiB <- salmentak$SalmentaB
#a)
#H0: sigma1^2 = sigma2^2
#Ha: sigma1^2 desberdin sigma2^2
var.test(bitxitegiA,bitxitegiB)
#p balioa=7.775e-10 < 0.05, beraz desberdinak dira

#b)
mu1 = mean(bitxitegiA, na.rm = T)
mu1
mu2 = mean(bitxitegiB, na.rm = T)
mu2
#H0: mu1 = mu2
#Ha: mu1 desberdin mu2
t.test(bitxitegiA, bitxitegiB, conf.level = 0.99)
#alpha = 0.01, p=0.2867>0.01 denez, onartzen da hipotesi nulua, berdina dira


#2.Ariketa
#X."Fabrikatzaile batek hornitzen duen materialen erresistentzia"
#X-N(220,7.75)
erresistentziak <- c(203,229,215,220,223,233,208,228,209)
#a)
#H0: mu = 220
#Ha: mu desberdin 220
t.test(erresistentziak, mu=220)
#Hipotesi nulua onartzen da, p=0.7130>0.05 delako

#b)
#H0: sigma^2 = 7.75^2
#Ha: sigma^2 > 7.75^2
EK <- c(qchisq(0.95,8),Inf)
EK
Onarpen.eremu <- c(0,qchisq(0.95,8))
Onarpen.eremu
Estatistikoa <- 8*var(erresistentziak)/7.75^2
Estatistikoa
#Onarpen eremuan dagoenez, hipotesi nulua onartzen da


#3.Ariketa
#X:"Txanpona 100 aldiz jaurti ondoren lortutako aurpegi kopurua"
#X-Bin(100,0.5)
#H0: txanpona egokia da (p=0.5)
#Ha: txanpona ez egokia (p/=0.5)
#a) I motako errorea
1-(pnorm(60,50,5)-pnorm(39,50,5))

#b)
curve(dnorm(x,50,5),35,65)
segments(20,0,80,0)
segments(39.5,0,39.5,dnorm(39.5,50,5))
segments(60.5,0,60.5,dnorm(60.5,50,5))

#c) II motako errorea, p=0.7
pnorm(60,70,sqrt(21))-pnorm(39,70,sqrt(21))

#d) P(X>=55)
#X:"Lortutako aurpegi kopurua"
#X-Bin(100,0.5)
pbinom(54,100,0.5,lower.tail = F)
1-pbinom(54,100,0.5)

#4.Ariketa
#X:"Makina batek ondoko 12 txandetan ekoiztutako pieza akastun kopurua"
#X-N(mu,sigma)
piezak<-c(15,11,16,14,13,12,16,10,9,11,14,15)
#a)
#H0: sigma^2 = 16
#Ha: sigma^2 < 16
EK <- c(0,qchisq(0.05,11))
EK
Onarpen.eremu <- c(qchisq(0.05,11),Inf)
Onarpen.eremu
Estatistikoa <- 11*var(piezak)/16
Estatistikoa
#Eskualde kritikoaren barnean dagoenez, hipotesi alternatiboa onartzen da

#b)pbalioa
pbalioa <- pchisq(Estatistikoa, 11)
pbalioa 


#5.Ariketa
#X:"Esperimentua osorik burukotzeko behar izan duen denbora"
#X-N(mu,sigma)
denborak <- c(78.6,65.1,55.2,80.9,57.4,55.4,62.3)
#a)
#H0: mu=72
#Ha: mu/=72
#alpha = 0.005
t.test(denborak, mu=72, conf.level = 0.995)
#Hipotesi nulua onartzen da, p=0.1345>0.005 delako

#b)pbalioa = 0.1345


#6.Ariketa
#aldagaiak dependenteak dira
amoniakoa.hasieran <-c(7.0,9.1,7.8,8.1,7.2,9.0)
amoniakoa.amaieran <-c(7.5,8.7,7.6,8.4,7.5,9.1)
amoniakoa.totala = amoniakoa.hasieran-amoniakoa.amaieran
amoniakoa.totala
#X:"Amoniakoaren kontzentrazioa"
#X-N(mu,sigma)
#alpha = 0.01
#H0: mu = 0
#Ha: mu /= 0
t.test(amoniakoa.totala, conf.level = 0.99)
#Hipotesi nulua onartzen da, p=0.5042>0.01 delako


#7.Ariketa
#X:"5 urte pasa ondoren korrosiorik jasaten ez duten habe kopurua"
#a) alpha = 0.05
#H0: p = 0.95
#Ha: p < 0.95
prop.test(104,120,p=0.95, alternative = "less")
#Hipotesi alternatioboa onartzen da, p=3.459e-05<0.05 delako

#b)p=3.459e-05


#8.Ariketa
kgabe <- c(20.4,62.5,61.3,44.2,11.1,23.7)
k <- c(1.2,6.9,38.7,20.4,17.2)
#X:"Irudien tamainak"
#X-N(mu,sigma)
#a) alpha=0.1
#H0:sigma1/sigma2 = 1
#Ha: sigma1/sigma2 /= 1
var.test(kgabe,k,conf.level = 0.9)
#Hiptesi nulua onartzen da, p=0.4359>0.1 delako

#b)
Onarpen.eremu <- c(qf(0.05,5,4),qf(0.95,5,4))
Onarpen.eremu
#EK = onarpen eremutik kanpoan dagoena
curve(df(x,5,4),0,8)
segments(0,0,8,0)
segments(0.1925978,0,0.1925978,df(0.1925978,5,4))
segments(6.2560565,0,6.2560565,df(6.2560565,5,4))

#c)alpha = 0.05
#H0:mu1 = mu2
#Ha: mu1 > mu2
t.test(kgabe,k,alternative = "greater")
#Hipotesi nulua onartzen da, p=0.05033>0.05


#9.Ariketa
zementua <- read.table("Zementua.txt",header = T)
zementua
karea <- zementua$Kare.portzentaia

#X:"140 egunetan zehar egindako zementuaren kare kontzentrazioa"
#X-N(mu,sigma)
#a) alpha = 0.15
#H0: mu = 5
#Ha: mu > 5
t.test(karea, mu = 5, alternative = "greater", conf.level = 0.85)
#p-value = 0.1002 < 0.15 denez, Ha onartzen da

#b)
length(karea)
EK <- c(pt(0.85,139),Inf)
EK
curve(dt(x,139),0,5)
segments(0,0,5,0)
segments(0.8016066,0,0.8016066,dt(0.8016066,139))

#c) alpha = 0.02
#H0: sigma^2 = 0.8^2
#Ha: sigma^2 /= 0.8^2
EK <- c(0, qchisq(0.01,139),qchisq(0.99,139),Inf)
EK
Onarpen.eremu <- c(qchisq(0.01,139),qchisq(0.99,139))
Onarpen.eremu
Estatistikoa <- 139*var(karea)/0.8^2
Estatistikoa
#Hipotesi alternatiboa onartuko da, estatistikoa eskualde kritikoan dagoelako

#d)alpha = 0.15
kareaberria <- karea*0.975
kareaberria

#H0: mu = 5
#Ha: mu > 5
t.test(kareaberri, mu = 5, alternative = "greater", conf.level = 0.85)
#p-value = 0.6014 > 0.15 denez, H0 onartzen da
























































