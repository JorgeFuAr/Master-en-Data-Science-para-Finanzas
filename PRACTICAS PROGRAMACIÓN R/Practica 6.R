### PRACTICA 6 ###

#Modelos basados en distancias. Agrupamiento.

# Primera diapositiva #

a<-c(1,1); b<-c(4,5)
sqrt(sum((a-b)^2))
a<-c(1,1,6)
b<-c(4,5,1)
(a-b)^2
a-b
sum((a-b)^2)
sqrt(sum((a-b)^2))

# Segunda diapositiva #

source("http://www.bioconductor.org/biocLite.R")
biocLite()
biocLite("multtest")
library(multtest)
data(golub)
golub.gnames[1042,]

# Tercera diapositiva #

index<-grep("Cyclin",golub.gnames[,2])
index
golub.gnames[index,2]

# Cuarta diapositiva #

dist.cyclin<-dist(golub[index,],method="euclidian")
diam<-as.matrix(dist.cyclin)
colnames(diam)<-golub.gnames[index,3]
rownames(diam)<-colnames(diam)
diam[1:5,1:5]
