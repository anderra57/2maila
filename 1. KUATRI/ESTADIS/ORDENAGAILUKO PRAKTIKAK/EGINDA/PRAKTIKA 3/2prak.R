#1.ARIKETA
lodierak<-c(1,2,3,3,2,1,2,5,2,4,4,4,5,3,2,5,3,4,1,4,2,3,1,1,2,5,3,4,1,3)
#a)
table(lodierak)
a<-as.data.frame(table(lodierak))
a
lodiera<-a$lodierak
Maiztasun.abs<-a $Freq #bektorea sortu
sum(Maiztasun.abs)
Maiztasun.erl<-Maiztasun.abs/30
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(lodiera,Maiztasun.abs,Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)
#b)
barplot(table(lodierak))
#c)
tags<-c("oso mehea","mehea","ertaina","lodia","oso lodia")
pie(table(lodierak),tags)

#-------------------------------------------#

#2.ARIKETA
#df<-read.table("./Hauste_tentsioa.txt",header=T)
#df

#-------------------------------------------#

#3.ARIKETA

#a)
bihurdurak <- c(33,21,32,44,35,22,40,36,22,37,20,37,42,31,23,44,32,30,44,44,42,35,40,36,32,31,37,43,24,40,25,30,26,35,33,41,25,44,36,27)
heina<-(max(bihurdurak)-min(bihurdurak))/6
tarteak1<-seq(min(bihurdurak),max(bihurdurak),heina)
bihurdurak.tarte<-cut(bihurdurak,tarteak1,right=F,include.lowest=T)
table(bihurdurak.tarte)
a<-as.data.frame(table(bihurdurak.tarte))
a
Tarteak<-a $bihurdurak.tarte
Maiztasun.abs<-a $Freq
sum(Maiztasun.abs)
Maiztasun.erl<-Maiztasun.abs/40
Met.maiztasun.abs<-cumsum(Maiztasun.abs)
Met.maiztasun.erl<-cumsum(Maiztasun.erl)
data.frame(Tarteak,Maiztasun.abs,Met.maiztasun.abs,Maiztasun.erl,Met.maiztasun.erl)

#b)
hist(bihurdurak,breaks = tarteak1,right = F, include.lowest = T)

klasemarka<-c(22,26,30,34,38,42)
plot(klasemarka,Maiztasun.abs,type="b",main="Maiztasun absolutuen poligonoa")

#c)