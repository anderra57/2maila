#6.ARIKETA
  #X="lanpara halogenoen bizi iraupena"
datuak6<-c(480,345,427,386,432 ,429, 378, 440 ,434 ,503,436 ,451, 466, 394, 422, 412, 507, 433, 480 ,429)
batbest<-mean(datuak6)

#4.ARIKETA
  #X="populazioa"
  #10 batbest
  #4 bar
  #n=20
#a)
baloreak4<-rnorm(20,10,2)
t.test(baloreak4)$conf
#
bar4b<-c(19*var(baloreak4)/qchisq(0.995,19),19*var(baloreak4)/qchisq(0.005,19))
bar4b

#2.ARIKETA
  #X="Lote bateko pieza akastunak"
  #n=200
  #p=0.85
  #alpha 0.95
prop.test(0.15*200,200)$conf

#3.ARIKETA
  #X1="I markako autoek konponketak behar"
  #n=200
  #p1=9/200
  #X2="II  ''             ''             "
  #m=300
  #p2=15/300
ktprop99<-c((9/200-15/300)-qnorm(0.995,0,1)*sqrt((9/200)*(191/200)/200+(15/300)*(285/300)/300),(9/200-15/300)-qnorm(0.995,0,1)*sqrt((9/200)*(191/200)/200-(15/300)*(285/300)/300))
ktprop99  

#8.ARIKETA
  #x1="ongarria baino lehen"
  #x1="ongarria eta gero"
#a)
df<-read.table("./olibondoak.txt",header=T)
df    
names(df)
#attach(df)
batezbestekoa.lehen=mean(Lehen,na.rm = T)
batezbestekoa.lehen
batezbestekoa.ondoren=mean(Ondoren,na.rm = T)
batezbestekoa.ondoren

des.lehen<-sd(Lehen,na.rm=T) #kuasidesbiderazio tip
des.ondoren<-sd(Ondoren,na.rm=T) #kuasidesbiderazio tip

#b)

t.test(Lehen,conf.level = 0.98)$conf
t.test(Ondoren,conf.level = 0.98)$conf

#c)

