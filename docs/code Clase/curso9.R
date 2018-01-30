library(ggplot2)
library(dplyr, tidyr)
library(ggplot2movies)

View(movies)
dim(movies)

# Muestreo Normal: 
index <- c(12, 13, 666, 1)
index

Muestra0 <- movies %>% slice(index) 
#Muestra0 <- slice(movies, index)
View(Muestra0)

# 1 de cada 40
unaCada40 <- seq(from = 1, to = 58788, by = 40)
unaCada40[1:10]

Muestra1 <- movies %>% slice(unaCada40)
View(Muestra1)


# Muestreo con proba:

# sin reemplazo. 
sample(1:10, 1)

index <- sample(1:10000, 10)
Muestra2 <- movies %>% slice(index)
View(Muestra2)

# con reemplazo: 
indexR <- sample(1:10, 4, replace = TRUE)
Muestra3 <- movies %>% slice(indexR)
View(Muestra3)


# Histograma de la población y el histograma de una muestra: 
dado <- data.frame(Caras = 1:6)
View(dado)

ggplot(dado, aes(x=Caras, y=..count../sum(..count..))) + 
    geom_histogram(breaks = seq(0,6), color = "gray") + ylab("")


index <- sample(1:6, 1000000, replace = TRUE)
#index

lanzamientosDado <- dado %>% slice(index)
#View(lanzamientosDado)

ggplot(lanzamientosDado, aes(x=Caras, y=..count../sum(..count..))) +
  geom_histogram(breaks = seq(0,6))






