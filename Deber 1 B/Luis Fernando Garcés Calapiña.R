library(dplyr)
library(tidyr)
library(rvest)
library(ggplot2)
#UN POCO DE R
#Pregunta 1
#Cuales de las sigientes pregntas valen 99, cuando x=10
x<-10
a<-(10*x)-1
a
b<-(x*x)-1
b
c<-abs(x*x)-abs(9-x)
c
d<-(11*x)-(x+1)
d

#Pregunta 2
#Un vector contiene una serie de ganancias ordenadas de manera creciente. Escriban los codigos que genera.
# *La suma de todas las ganacias.
# *La segunda ganancia mas grande.
# *La diferenia mas grande entre las ganacias.
# *Un boleano que responda a la pregunta: La mas grande diferencia entre dos gananciases mayor a 10?
# *La menor diferencia positiva entre dos ganancias.
# *El maximo numero de ganancias que pueden sumar sin pasar de 10000.


#Dplyr en los Aeropuertos.
# Vamos a estudiar los datos de los vuelos locales en Estados Unidos durante el 2011. Usen los verbos:
# select()   filter()   mutate()    arrange()     group_by()    summarise()  ,para manipular 3 data frames:
# Uno con los vuelos (flights), uno con los aviones (planes) y otro con el clima (weather). La descripción
# de todos los data frames está en la documentación del paquete nycflights13
# (https://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf).



#Pregunta 3 
# Instalen la librería nycflights13. Escriban el código para encontrar todos los vuelos que:
# *Fueron de SFO(San Francisco) hasta OAK(Oakland).
# *Salieron en Enero.
# *Tienen demoras de mas de una hora (las demoras están en minutos).
# *Salieron entre medianoche y las 5 a.m.
# *Tuvieron una demora de llegada 2 veces mas grande que la de salida.


#Pregunta 4 
# Lean la ayuda de select(). Escriban 2 formas de selecionar las dos variables de retraso.
#Pregunta 5 
# Ordenen la tabla por fecha de salida y tiempo. 
# Cuáles fueron los vuelos que sufrieron las mayores demoras? 
# Cuáles recuperaron la mayor cantidad de tiempo durante el vuelo?

#Pregunta 6 
# Calculen la velocidad en mph usando el tiempo (que está en minutos) y la distancia (que está en millas). 
#Cuál fué el avión que voló mas rápido?

#Pregunta 7 
#En dplyr el comando pipeline%>% se lee entonces.
#Significa:
 # x% > % f(y) ????! f(x; y):
 # Es decir pasa x como primer argumento de f.
#Qué significan las siguientes líneas de código:
 # flights % > % filter(! is:na(dep_delay))
#% > % group_by(date; hour)
#% > % summarise(delay = mean(dep_delay); n = n())
#% > % filter(n > 10)

#Pregunta 8 
#Cuál es la destinación que tiene las demoras promedio mas grandes? Cuántos vuelos diarios hay? 
#Cuál es la mejorhora para viajar sin retraso?