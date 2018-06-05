setwd("D:/Desktop/creation/Quartier 2.0")
tab<-read.csv("sims.csv",header=T,sep=";",stringsAsFactors = FALSE)

croisé<-matrix(NA,nrow=nrow(tab),ncol=nrow(tab))
rownames(croisé)<-1:100
colnames(croisé)<-1:100
N<-nrow(tab)

for(l in 2:N){
     for(c in 1:(l-1)){
          if(tab[c,2]!=tab[l,6]|tab[c,6]!=tab[l,2]){
           croisé[l,c]<-0}else{croisé[l,c]<-1
           if(tab[c,5]==tab[l,5]){croisé[l,c]<-3}
           else if((tab[c,5]!="HM")&(tab[l,5]!="HM")){croisé[l,c]<-2}
           }
     }
}

couple<-matrix(NA,nrow=50,ncol=5)
couple[,1]<-c(1:50)
vérif<-rep(0,100)
r=0
for(a in c(3:1)){
for(l in 2:N){
     for(c in 1:(l-1)){
          if(croisé[l,c]==a){
              r=r+1
              couple[r,2]<-l
              couple[r,3]<-tab[l,3]
              couple[r,4]<-c
              couple[r,5]<-tab[c,3]
              croisé[l,c(1:(l-1))]<-4
              croisé[c(min(N,(l+1)):N),l]<-4
              croisé[c(min(N,(c+1)):N),c]<-4
              croisé[c,c(1:(c-1))]<-4
              vérif[c(l,c)]<-1
              
          }
              
          }
     }
          
}
              
couple<-couple[sample(c(1:r),r,replace=FALSE),]


# write.table(couple,"couple.csv",sep=";",dec=",")               
               
tab[which(vérif==0),]
               
               
               