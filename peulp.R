#### S_EC_StGn ####
setwd("D:/Desktop/creation/Quartier 2.0")
traits<-read.csv2("traits.csv",header=FALSE,sep=";",stringsAsFactors=FALSE)
souhaits<-read.csv("souhaits.csv",header=FALSE,sep=";",stringsAsFactors=FALSE)

F=100
tab<-NULL

for (f in 1:F){
  sx<-sample(c("F","H"),1)
  nm<-sample(letters[1:26],1)
  pnm<-sample(letters[1:26],1)
  spc<-sample(c(rep("HM",7),"FE","VA","LG","SR","VG","GN","FA"),1)
  if(sx=="F"){ort<-sample(c("H","H","H","F"),1)}else{ort<-sample(c("H","F","F","F"),1)}           
  trt<-c(sample(c(1:21),1),sample(c(22:39),1),sample(c(40:71),1),sample(c(72:99),1),sample(c(1:99),1))
  slt<-sample(c(1:81),1)
  pea<-sample(c(1:100),1)
  pds<-sample(c(1:100),1)
  msc<-sample(c(1:100),1)
  chv<-sample(c(1:8),1)
  yco<-sample(c(1:8),1)
  vis<-sample(c(1:12),1)
  yeu<-sample(c(1:12),1)
  nez<-sample(c(1:24),1)
  bou<-sample(c(1:17),1)
  if(sx=="F"){ptn<-sample(c(1:100),1)}else{ptn<-NA}
  res<-c(f,sx,nm,pnm,spc,ort,pea,pds,msc,ptn,chv,yco,vis,yeu,nez,bou,traits[trt,2],souhaits[slt,2])
  tab<-rbind(tab,res)
}

colnames(tab)<-c("ID","SX","NM","PNM","SPC","ORT","PEA","PDS","MSC","PTN","CHV","vis","yco","yeu","nez","bou",paste("TRT",c(1:5)),"SLT")

# write.table(tab,"sims.csv",sep=";",dec=",")


