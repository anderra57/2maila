#2.ARIKETA
erresistentziak<-c(203,229,215,220,223,233,208,228,209)
x=mean(erresistentziak)
mu=220
sigma=7.75
#X="Erresistentzien balioak"
  #a)
#H0:Batez bestekoa 220 da.
#Ha:Batez bestekoa ez da 220.
t.test(erresistentziak,mu=220)
#H0 onartu (p-balioa adierazgarritasun maila baino altuagoa delako)

  #b)
#H0:Desbiderazio tipikoa gehienez 7.75 da (dt<7.75)
#Ha:Desbiderazio tipikoa 7.75 edo handiagoa
Onarpen.eremua.bariantza<-c(0,qchisq(0.95,length(erresistentziak)-1))
Onarpen.eremua.bariantza
Estatistikoa<-(length(erresistentziak)-1)*var(erresistentziak)/7.75^2
Estatistikoa
#H0 onartu (estatistikoa onarpen eremuan baitago)

#irudikatu
curve(dchisq(x,8),0,30)
segments(0,0,30,0)
segments(qchisq(0.95,8),0,qchisq(0.95,8),dchisq(qchisq(0.95,8),8))
  #koloreztatu (ez da beharrezkoa)
xvals<-seq(qchisq(0.95,8),30,length=50)
yvals<-dchisq(xvals,8)
polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(yvals)),col='red')

#4.ARIKETA
pak<-c(15,11,16,14,13,12,16,10,9,11,14,15)
#X=pieza akastunen kopurua    X-N(mu,sigma)
  #a)
#H0:sigma=4
#Ha:sigma<4
Estatistikoa<-(12-1)*var(pak)/7^2
Estatistikoa
Onarp.eremua<-c(qchisq(0.95,11,lower.tail = F),Inf)   #qchisq(0.95,11,lower.tail = F)=qchisq(0.05,11)
Onarp.eremua
#H0 errefusatu, Ha onartu (sigma ez dago onarp eremuan, eremu kritikoan baizik)

  #b)
pbalioa<-pchisq(Estatistikoa,11)
pbalioa
