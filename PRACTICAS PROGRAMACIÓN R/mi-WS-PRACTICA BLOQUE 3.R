######

set.seed(1)
height <- runif(100,150,230)
#distribucion uniforme talla zapato
shoe.size <- runif(100,6,14)
#Determinar covarianza
cov1<-cov(shoe.size,height)
#Determinar correlacion
cor1<-cor(shoe.size,height)

##### BLOQUE 3, TEMA 3

busqueda_dicotomica<-function(v,principio, fin, x) {

if (principio<=fin){
	m <- ((fin-principio)/2) + principio
	if(x<v[m]) res<-busqueda_dicotomica(v,principio,m-1,x)
	else if(x>v[m]) res<-busqueda_dicotomica(v,m+1,fin,x)
	else res<-true; }
	else res<- false 
	return res
	}
###########

fem<-read.csv("female_names.csv", skip=1, header=TRUE)
head(fem)
str(fem)
dim(fem)
fem$Frequency<-as.integer(fem$Frequency)
max(fem$Year)
fem.2010<-fem[fem$Year==2010,]
head(fem.2010)
fem.2010<-fem.2010[,c("Name", "Frequency")]
fem.2010<-fem.2010[order(fem.2010$Frequency, decreasing=TRUE),]
head(fem.2010$Name)
year.freq<-fem[fem$Name=="ISABEL", c("Year", "Frequency")]
plot(year.freq)

# Recorrer la base de datos female_names mediante el objeto fem y localizar 
## entradas de ISABEL salvando año y frecuencia.
res.Year<-NULL
res.Frequency <- NULL
for (i in 1:length(fem$Year)) {
	if (fem$Name[i] =="ISABEL") {res.Year<-c(res.Year,fem$Year[i])
	res.Frequency<- c(res.Frequency, fem$Frequency[i])
}
res<-data.frame(res.Year, res.Frequency)

### Igual pero utilizando que la base de datos está ordenada por nombres y dentro 
## de los nombres por años y utilizando también que el número de años está limitado

ini<-min(fem$Year); ini
fin<-max(fem$Year); fin
rango.anual<-fin-ini+1; rango.anual
i<-1
while (fem$Name[i]!="INGRID") {i<-i+1}; i
# ahora i apunta al primer INGRID
while (fem$Year[i]!=fin) {res.Year <- c(res.Year, fem$Year[i])
	res.Frequency<- c(res.Frequency, fem$Frequency[i])
	i<-i+1}
### no hemos metido el registro de INGRID del año último (fin)
res.Year <- c(res.Year, fem$Year[fin])
res.Frequency<- c(res.Frequency, fem$Frequency[fin]); i

###############################

ini<-min(fem$Year); ini
fin<-max(fem$Year); fin
rango.anual<-fin-ini+1; rango.anual
i<-1
while (fem$Name[i]!="INGRID") {i<-i+1}; i
# ahora i apunta al primer INGRID
j<-1
res.Year<-NULL
res.Frequency <- NULL
while (fem$Name[i]=="INGRID")
	{res.Year <- c(res.Year, fem$Year[i])
	res.Frequency<- c(res.Frequency, fem$Frequency[i])
	i<-i+1} 
res<-data.frame(res.Year, res.Frequency); res
fem$Frequency[33184]
fem$Year[33184]
# Ahora ya no hay que hacer lo anterior porque ya hemos metido dentro el último
· registro de INGRID también.


