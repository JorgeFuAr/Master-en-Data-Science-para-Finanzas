## EJERCICIO 1##

#llamamos a la libreria "stats".
require(stats)
str(swiss)
head(swiss)
x <- swiss$Education[1:25]
sort(x, method="sh",index.return = TRUE)
#se puede sustituir "sh" por "shell" o por "s"
#también podemos generar una secuencia aleatoria y realizar una ordenación rápida de los datos
x <- as.integer(rnorm(200, 5, 7))
sort(x, method="quick") 
#para ordenar tan solo la parte de 1 a 5 esta ordenada, el resto sin ordenar.
sort(x,partial= 1:5)

## EJERCICIO 2##

# creamos la variable npie para la talla de pie con 100 numeros aleatorios~N(42,2.5):
npie<-as.integer(rnorm(100,42,2.5))

# creamos la variable yalt para la altura con 100 numeros aleatorios~N(177,10):
yalt<-as.integer(rnorm(100,177,10))

## a) Crear data frame llamado "data":##
data<-data.frame(npie,yalt)
data

## b) Media y varianza de las variables: ## usamos lapply al aplicar sobre lista.
data.media<-lapply(data,mean)
data.media
data.vari<-lapply(data,var)
data.vari

## c) Calcular covarianza y correlacion y representar: ##
covarianza<-cov(npie,yalt)
covarianza
correlacion<-cor(npie,yalt)
correlacion
plot(npie,yalt)

## d) Determinar regresion lineal entre variables y representar resultados:##
regresion<-lm(yalt~npie)
abline(regresion)

## EJERCICIO 3: ##

## Calcular una matriz de k1 filas por k2 columnas cuyas componentes sean números aleatorios
## según una distribución de Poisson de parámetro Lambda. Calcular la traspuesta de dicha matriz y comprobar los
## resultados usando la función t de R. 
k1<-3
k2<-5
lambda<-3
x<- rpois(k1*k2,lambda)
matriz<-matrix(x, nrow = k1,ncol = k2)
matriz
matriz2<-matriz

#completando por filas:
for(i in 1:k1){
  for(j in 1:k2){
    matriz2[i,j]<- x[k2*(i-1)+j]
  }
}
#completando por columnas:
matriz3<-matriz
for(j in 1:k2){
  for(i in 1:k1){
    matriz3[i,j]<- x[k1*(j-1)+i]
  }
}
#calcular la matriz traspuesta
mattraspuesta<-matrix(0,k2,k1)
for(i in 1:k2) {
  for(j in 1:k1){
    mattraspuesta[i,j]<-matriz3[j,i]
  }
}
mattraspuesta