A <- c(5);A
B <- c(4);B
Edades <- c(10, 23, 42, 35, 71, 23);Edades
s.edades <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE);s.edades
Numeros <- c(1,2,3,4,5,6,7,8,9,10,11,12);Numeros
Primos <- c(2,3,5,7,11,13,17,19,23);Primos
#
#Ejercicio 3 rm(list=ls())
Nombre.Ana <- "Ana"
Edad.Ana <- 21
Ingresos.Ana <- 25000
Gastos.Ana <- 23400
Nombre.Luis <- "Luis"
Edad.Luis <- 23
Ingresos.Luis <- 26400
Gastos.Luis <- 32000
Nombre.Maria <- "Maria"
Edad.Maria <- 25
Ingresos.Maria <- 31200
Gastos.Maria <- 17400
#Ejercicio 4
Edades <- c(Edad.Ana, Edad.Luis, Edad.Maria)
MediaEdades <- mean(Edades)
MediaEdades <- (Edad.Ana + Edad.Luis + Edad.Maria) / 3; MediaEdades
MediaIngresos <- (Ingresos.Ana + Ingresos.Luis + Ingresos.Maria) / 3; MediaIngresos
MediaGastos <- (Gastos.Ana + Gastos.Luis + Gastos.Maria) / 3; MediaGastos
#
Diferencia.Ana <- Ingresos.Ana - Gastos.Ana; Diferencia.Ana
Diferencia.Luis <- Ingresos.Luis - Gastos.Luis; Diferencia.Luis
Diferencia.Maria <- Ingresos.Maria - Gastos.Maria; Diferencia.Maria
ls()
ls.str()
#PRACTICA 2