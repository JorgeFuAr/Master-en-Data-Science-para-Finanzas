#   PRACTICA 5   #

### EJERCICIO 1 ###

datos<- read.csv("C:/Users/jorge/Desktop/JORGE/CUNEF/MASTER/PROGRAMACIÓN R/student_census.csv", sep=",", header = TRUE)
fix(datos) #Hacemos fix para ver la tabla de los datos
deporte<- datos$Physical #Asignamos a la columna physical de la tabla datos el nombre de "deporte"
a<- dim(datos) #Asignamos a la dimensión de los datos el nombre "a"
lista<- vector() #Asignamos a la funcion vector el nombre "lista"
contador<-1  #Asignamos a 1 el nombre "contador"
#Hacemos un if en el que cuando i este entre 1 y 200(a[1]) si en la columna de deporte(Physical) aparece "basketball"  
#devuelva la posicion en la que se encuentra.
for (i in 1:a[1]){ 
  if (deporte[i]=="Basketball"){
    lista[contador] = i
    contador = contador+1}}
lista

jugadores<- sample(lista, 5) #Coger 5 estudiantes de forma aleatoria

### EJERCICIO 2 ###

#Vamos a determinar distintos dataframes con columnas de la tabla datos, estableciendo la propia tabla como un dataframe
#que se llame "datos".
datos<- data.frame(datos)
height<- data.frame(datos$Height)
arm.span<- data.frame(datos$Arm.Span)
foot.size<- data.frame(datos$Foot.Size)
matriz<- data.frame(height, arm.span, foot.size)

cor(matriz) #Hacemos la correlacion de "matriz" que es un data frame formado por las columnas height, arm.span y foot.size 

(ii<- order(height, arm.span, foot.size)) #Ordenamos posiciones de las columnas
cbind(height, arm.span, foot.size)[ii,] #Una vez ordenadas, cbind establece el valor de cada una
plot(datos$Province) #Dibujamos un histograma de frecuencias la columna province dentro del dataframe datos


### EJERCICIO 4 ###

physical<- data.frame(datos$Physical)
province<- data.frame(datos$Province)

#vamos a quitar los valores duplicados de cada uno de los dataframes province y physical
province<- unique(province)
physical<- unique(physical)

#Una vez eliminados los duplicados sabremos las dimensiones que va a tener la matriz, en la que iremos contando el número de 
#deportistas de cada deporte que hay en cada provincia.
lphysical<- dim(physical)
lphysical<-lphysical[1]
lprovince<- dim(province)
lprovince<-lprovince[1]

matriz1<- matrix(0, nrow=lphysical, ncol=lprovince)
rownames(matriz1)<-physical[,1]
colnames(matriz1)<-province[,1]

#Al utilizar el método mapreduce, definiendo m y n para hacer los 20 grupos. En cada grupo buscamos el numero de deportistas
#que hay en cada provincia, por último se suman el total de deportistas de cada provincia de cada uno de los 20 grupos.
for (k in 1:lprovince){
  for (j in 1:lphysical){
    contador<-0
    l<-1
    while(l<=20){
      m<-1+10*(l-1)
      n<-l*10
      for (i in m:n){
        if (datos$Physical[i]==physical[j,1] & datos$Province[i]==province[k,1]){
          contador<-contador+1
        }
      }
      l<-l+1
    }
    matriz1[j,k]<-contador
  }
}
matriz1
sum(matriz1)


### EJERCICIO 5 ###

#nueva variable x que contenga un vector con los numeros del 1 al 80, del 78 al 34 y más numeros indicados.
x<- c(1:80, 78:34, 1,2,3,4,5,6,7,5,4,3,2) 
n<-5

#Para aplicar el map es necesario realizar grupos, por lo que se crea una funcion en la que se introduce como parámetros
#n igual al número de grupos y x igual al vector para saber su longitud.
divideenBloques <- function( x, n ){ 
			tam<-length(x)%/%n
			list<-NULL
			
			for (i in 0:(n-2)){
					list<-c(list,c(i*tam+1, (i+1)*tam))
					
							}
			list<-c(list,c(((i+1)*tam)+1, length(x)))
			return(list)
}
lista<-divideenBloques(x,n); lista

########################

#El map, alcula una tupla para cada subconjunto, la primera componente es la suma de todas las observaciones y la segunda la longitud 
#del vector. El reduce, coge todas las primeras componentes obteniendo la suma total del vector inicial y en las segundas componentes
#obtiene la longitud final del vector, dividiendo la primera componente entre la segunda obtenemos la media.
i<-1
pares_sumas<-function (lista, x, n){
 sumas<-NULL
 tams<-NULL
 for (i in 0:(n-1)){
		ini<-lista[i*2+1]
		fin<-lista[i*2+2]
		sumas<-c(sumas, sum(x[ini:fin]))
		tams<-c(tams,fin-ini+1)
		}
return(data.frame(sumas, tams))
}
ps<-pares_sumas(lista, x, n); ps

reduce<-function(ps){
resultado<- as.double(sum(ps$sumas)/sum(ps$tams))
return(resultado)
}
resultado_media<-reduce(ps); resultado_media

### EJERCICIO 6 ###

#El enunciado nos dice que l y h son dos números naturales donde:
#   - h está entre 0 y 51
#   - l entre 0 y h-1.
#El objetivo de esta fórmula, es que el resultado de la misma nos representa que la suma de los números dentro de los intervalos
#9-16 y 18-22 (ambos números inclusive en ambos intervalos) suman 100.

busca <- function (l, h, st){
  if (l<=st) {if (sum(l:h) ==st) {print(c(l, h))
    return(busca(l+1,l+1,st))}
    else {if (sum(l:h)<st) return(busca(l, h+1, st))
      else return(busca(l+1, l+1, st))}
  }
}
busca(0,100, 100)





