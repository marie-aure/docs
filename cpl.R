setwd("D:/Desktop/creation/Quartier 2.0")
tab<-read.csv("sims.csv",header=T,sep=";",stringsAsFactors = FALSE)

crois�<-matrix(NA,nrow=nrow(tab),ncol=nrow(tab))
rownames(crois�)<-1:100
colnames(crois�)<-1:100
N<-nrow(tab)

for(l in 2:N){
     for(c in 1:(l-1)){
          if(tab[c,2]!=tab[l,6]|tab[c,6]!=tab[l,2]){
           crois�[l,c]<-0}else{crois�[l,c]<-1
           if(tab[c,5]==tab[l,5]){crois�[l,c]<-3}
           else if((tab[c,5]!="HM")&(tab[l,5]!="HM")){crois�[l,c]<-2}
           }
     }
}

couple<-matrix(NA,nrow=50,ncol=5)
couple[,1]<-c(1:50)
v�rif<-rep(0,100)
r=0
for(a in c(3:1)){
for(l in 2:N){
     for(c in 1:(l-1)){
          if(crois�[l,c]==a){
              r=r+1
              couple[r,2]<-l
              couple[r,3]<-tab[l,3]
              couple[r,4]<-c
              couple[r,5]<-tab[c,3]
              crois�[l,c(1:(l-1))]<-4
              crois�[c(min(N,(l+1)):N),l]<-4
              crois�[c(min(N,(c+1)):N),c]<-4
              crois�[c,c(1:(c-1))]<-4
              v�rif[c(l,c)]<-1
              
          }
              
          }
     }
          
}
              
couple<-couple[sample(c(1:r),r,replace=FALSE),]


# write.table(couple,"couple.csv",sep=";",dec=",")               
               
tab[which(v�rif==0),]
               
               
               