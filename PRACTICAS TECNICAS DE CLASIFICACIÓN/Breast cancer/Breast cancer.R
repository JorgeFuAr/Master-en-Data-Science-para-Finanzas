setwd("C:/Users/jorge/Desktop/JORGE/CUNEF/MASTER/TECNICAS DE CLASIFICACION/Clase02")
# Wisconsin Breast Cancer dataset
# La base de datos contiene 699 casos donde 458 (65.5%) son benignos y 241 (34.5%) malignos.

# Preparamos la base de datos

loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"

ds <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"

url <- paste(loc, ds, sep="")

# Denominamos breast al data frame original

breast <- read.table(url, sep=",", header=FALSE, na.strings="?")

# Asignamos nombres a las variables

names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion",
                   "singleEpithelialCellSize", "bareNuclei",
                   "blandChromatin", "normalNucleoli", "mitosis", "class")

# Creamos un nuevo data frame df, eliminando la variable ID, ya que solo queremos las variables explicativas, no la variable explicada

df <- breast[-1]

# Transformamos la variable class en un factor, cuyos valores son 
# 2=benigno y 4=maligno

df$class <- factor(df$class, levels=c(2,4),
                   labels=c("benigno", "maligno"))

# Semilla aleatoria, utilizando una sola muestra para estimar el arbol para que no sobre aprenda

set.seed(1234)

# Definimos una muestra aleatoria de aprendizaje del arbol, "sample" es el colectivo que quiero mostrar

train <- sample(nrow(df), 0.7*nrow(df)); train

# Data frame para la muestra de aprendizaje y otro para la muestra de validaci?n

df.train <- df[train,]

df.validate <- df[-train,]

# Vemos la distribucion de ambas muestras y comprobamos que est?n balanceadas, Con "table calcula una distribuci?n de frecuencias.

table(df.train$class)
329/489 # Muestra el % de cancer benigno respecto del total de canceres.
table(df.validate$class) #Nos dir? el numero de individuos de cada tipo (tanto benigno como si es maligno)
129/210 # Muestra el % de cancer benigno respecto del total de canceres.
# Cargamos la libreria rpart

install.packages("rpart")
library(rpart)

# Estimamos el arbol. La funcion "rpart" coindide con el nombre del paquete

arbol <- rpart(class ~ ., data=df.train, method="class", #data=df.train es porque queremos que el arbol tenga los datos de la variable df.train
               parms=list(split="information"))

print(arbol) #Estructura: que tipo de (node) nodo) es, la division(split), funcion de p?rdida(loss), valor de prediccion(yval) y la probabilidad(yprob) correspondiente.
              
summary(arbol) #Establece un resumen mas detallado del arbol

# Tabla de complejidad paramatrica

arbol$cptable # CP=coeficiente de complejidad. xerror=medida que coge la variabilidad (mirar siempre el minimo). nsplit=son las divisiones que se hacen en el arbol
              
# Representamos graficamente la curva cp

plotcp(arbol)  #El plotcp representa el arbol de un objeto rpart

# Podamos el arbol a partir del parametro de complejidad(cp)

arbol.podado <- prune(arbol, cp=.0125); arbol.podado

# Cargamos la librer?a para representar graficamente el ?rbol

library(rpart.plot)

#?prp para ver las distintas opciones de la representaci?n gr?fica del arbol
#type= 2, caracteristicas graficas de la forma de la rama, informacion que aparece en el nodo...etc
#type=2 explicita la etiquetas de divisi?n debajo de cada nodo
#extra=104 incluye las probabilidades de cada clase junto con el porcentaje de casos en cada nodo
#fallen.leaves=TRUE dibuja los nodos terminales en la parte inferior del arbol

prp(arbol.podado, type = 2, extra = 104,   #prp es una funcion de representaci?n grafica para rpart.plot
    fallen.leaves = TRUE, main="Decision Tree")

# Prediccion con la muestra de validaci?n

arbol.pred <- predict(arbol.podado, df.validate, type="class")

arbol.perf <- table(df.validate$class, arbol.pred,
                    dnn=c("Actual", "Predicted"))

arbol.perf

# Instalamos el paquete partykit, para dibujar el arbol podado de diferente forma

install.packages("partykit")

library(partykit)

plot(as.party(arbol.podado))

# ARBOLES BASADOS EN LA INFERENCIA. CONDITIONAL INFERENCE TREE

install.packages("party")

library(party)

fit.ctree <- ctree(class~., data=df.train)

plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")

ctree.perf <- table(df.validate$class, ctree.pred,
                    dnn=c("Actual", "Predicted"))

ctree.perf
