#####################
#X-N(10,4)
lagina <- rnorm(20,10,4)
#a)
t.test(lagina)$conf
#b)
KT99 <- c((((19)*var(lagina))/qchisq(0.995,20)),(((19)*var(lagina))/qchisq(0.005,20)))
KT99



#6

lanpara<-c(480,345,427,386,432,429,378,440,434,503,436,451,466,394,422,412,507,433,480,429)
t.test(lanpara)$conf






#8

#x=frui
olibondoak <-read.table("Olibondoak.txt",header = T)
tratamenduez <- olibondoak$Lehen
tratamenduez
tratamendubai <- olibondoak$Ondoren
tratamendubai

bariantza <- var(tratamenduez,na.rm = T)*(74)/75
desb.tip <- sqrt(bariantza)
desb.tip
sd(tratamenduez,na.rm = T)
##############################################
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

