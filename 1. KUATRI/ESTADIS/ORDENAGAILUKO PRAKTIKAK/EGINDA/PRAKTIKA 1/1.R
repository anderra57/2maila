#ej1
ej1a<-((1+2)/(3+4))^2;ej1a
ej1b<-sqrt(exp(2)+log(3,2));ej1b
x<-seq(1,21,1)
ej1c<-prod(x);ej1c

#ej2
x<-c(20.5,12.6,-23,-6.98,24,32.8,7,-8.6)
f<-c(3,4,2,6,5,7,4,9)
fi<-f/cumsum(f);fi
z<-sum(x*f);z
zi<-sum(x*fi);zi
z2<-sum(x^2*fi);z2

#ej4
valores<-seq(0,20,1.2);valores
l<-length(valores);l
max<-max(valores);max
min<-min(valores);min
valores[10]=14.42
y<-exp(valores);y
plot(valores)
plot(y)
hist(valores)

#ej3
km<-c(31422,31801,32131,32691,33077,33514,33992);km
diff(km)
mean(diff(km))
mean(km)
#ej9
pares<-seq(2,40,2);v
cuadrados<-v^2;cuad
cubos<-v^3;cub
data<-data.frame(v,cuad,cub);data
write.table(data,"datos.txt")
read.table("datos.txt",header=T)
