#1.ARIKETA
  #X="denbora tarte finko bateanbidegurutze batera heltzen den auto kopurua"
  #X--Pois(1)
  #lambda=1
#a) P(X>=3)
  1-ppois(2,1)
#b) P(X>3)
  #ez
  
#2.ARIKETA
  potentziak<-c(5,6,7,8,9,10,11,12)
  ehunekoak<-c(7.5,5,20,18.75,15,17.5,8.75,7.5)
    ehunekokop<-ehunekoak*4.8
  Maiztasun.erl<-ehunekoak/100
  Maiztasun.abs<-Maiztasun.erl*480
  Datuak<-rep(potentziak,Maiztasun.abs)
#a)
  a<-table(Datuak)
  barplot(a)
    barplot(ehunekokop,names.arg =potentziak)  
#b)
  mean(Datuak)
    bba=sum(potentziak*ehunekokop)/480
#c)
  Bariantza<-var(Datuak)*479/480
  Bariantza
  Des.tip<-sqrt(Bariantza)
  Des.tip
#d)
  Datu.90gabe<-Datuak[-seq(391,480,1)]
  Datu.berriak<-c(Datu.90gabe,rep(5,90))
  Datu.berriak
  mean(Datu.berriak)
  Jaitsiera<-(mean(Datuak)-mean(Datu.berriak))/mean(Datuak) *100 
  Jaitsiera # %-tan
  
#3.ARIKETA
  #B:bateko E:errege T:txanka X:beste kartak
  #A="arrakasta kop"
  #ordena kontuan izan gabe eta itzulerarik gabe
  a<-factorial(4)*4/40*4/40*4/40*28/37
  #ordena kontuan izan gabe eta itzulerarekin
  b<-factorial(4)*4/40*4/40*4/40*28/40
  #ordena kontuan izanda eta itzulerarik gabe
  c<-4/40*4/40*4/40*28/37
  #ordena kontuan izanda eta itzulerarekin
  d<-4/40*4/40*4/40*28/40
  
#6.ARIKETA
  Tuboak<-read.table("Tuboak.txt",header=T)
  Luzerak<-Tuboak$Tubo.luzera 
  #b)
  sort(Luzerak)
  #c)  