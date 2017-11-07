setwd("C:/Users/jorge/Desktop/JORGE/CUNEF/MASTER/TECNICAS DE CLASIFICACION/Clase02/Quiebras")

credit <- read.csv("http://www.biz.uiowa.edu/faculty/jledolter/DataMining/germancredit.csv")

head(credit, 2) # comprobamos el encabezado de credit 
fix(credit)
credit$Default <- factor(credit$Default, levels=c(0,1),
                         labels=c("no", "sí"))
library(rpart)
#Default ~ checkingstatus1 + duration + history + purpose + amount + savings + employ + installment + status + others + residence + property + age + otherplans + housing + cards + job+ liable , 
quiebra.rpart = rpart(Default ~ checkingstatus1 + duration + history + purpose + amount + savings + 
                        employ + installment + status + others + residence + property + age + otherplans 
                      + housing + cards + job+ liable,method="class", data = credit) 
quiebra.rpart

printcp(quiebra.rpart) # revisa los  resultados
plotcp(quiebra.rpart) # visualiza los resultados de la validaci?n cruzada
summary(quiebra.rpart) # resumen detallado de los cortes

set.seed(1234)

train <- sample(nrow(credit), 0.7*nrow(credit)); train

credit.train <- credit[train,]

credit.validate <- credit[-train,]

table(credit$Default)

table(credit$Default)


arbol <- rpart(Default ~ ., data=credit, method="class", 
               parms=list(split="information"))
print(arbol)
summary(arbol)

arbol$cptable 
plotcp(arbol)

arbol.podado <- prune(arbol, cp=0.0167); arbol.podado

library(rpart.plot)

prp(arbol.podado, type = 2, extra = 104,   
    fallen.leaves = TRUE, main="Decision Tree")

arbol.pred <- predict(arbol.podado, credit.validate, type="class")

arbol.perf <- table(credit.validate$Default, arbol.pred,
                    dnn=c("Actual", "Predicted"))

arbol.perf
