### PRACTICA 2 ###

### EJERCICIO 1 ###

load("C:\\Users\\jorge\\Desktop\\JORGE\\CUNEF\\MASTER\\PROGRAMACIÓN R\\R\\datos guardados\\mi-WS-1.RData")
getwd()
setwd("C://Users//jorge//Desktop//JORGE//CUNEF//MASTER//PROGRAMACIÓN R//R//datos guardados")
ls.str()

### EJERCICIO 2 ###

dt.Ana <- data.frame(Edad.Ana, Gastos.Ana, Ingresos.Ana); dt1 <- (dt.Ana)
dt.Luis <- data.frame(Edad.Luis, Gastos.Luis, Ingresos.Luis); dt2 <- (dt.Luis)
dt.Maria <- data.frame(Edad.Maria, Gastos.Maria, Ingresos.Maria); dt3 <- (dt.Maria)ç

### EJERCICIO 3 ###

# JORGE FUERTES

2*A-B
C <- 2*A-B
typeof(C)
Numeros
Pares <- Numeros[seq(from=2, to=12, by=2)]; Pares
Impares <- Numeros[seq(from=1, to=11, by=2)]; Impares
ls()
ls.str()

### EJERCICIO 4 ###

ls()
F.Edades <- Edades(s.edades); print(F.Edades) 
secuencia <- Numeros[seq(from=3, to=7, by=1)]; secuencia
# Creamos un vector con el mismo nº de componentes que el de la secuencia, empezando por el siguiente primo de 3(inicio de la secuencia):
Primos[secuencia]

# Creamos un vector con el mismo nº de componentes que el de la secuencia, empezando por el 3(inicio de la secuencia):
Primos[secuencia-1]

# Creamos un vector con el mismo nº de componentes que el de la secuencia, empezando por el nº anterior a la secuencia:
Primos[secuencia-2]

# Creamos secuencia sumando 6 a cada elemento de la misma:
secuencia.siguiente<-secuencia+6; secuencia.siguiente

# Creamos un vector con el mismo nº de elementos que el vector secuencia. 
# Busca los numeros primos sumando 6 al vector primos, por lo que el primer componente es 23 y el resto no están definidas
# ya que el vector primos no tiene mas componentes definidos.
Primos[secuencia.siguiente]