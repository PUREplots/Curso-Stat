library(ggplot2)
library(ggplot2movies)
library(dplyr)
library(tidyr)


dado <- data.frame(cara = 1:6)
View(dado)

N <- 10 
index <- sample(1:6, N, replace=TRUE)
lanzamientos <- dado %>% slice(index)
#View(lanzamientos)

ggplot(lanzamientos, aes(x = cara, y=..count../sum(..count..))) + 
  geom_histogram(breaks = seq(0, 6, 1)) +
  scale_x_continuous(breaks = seq(0, 6, 1))
  
# N <- 1000
# data.frame(l1 = sample(1:6, N, replace=TRUE), l2=...)
sample(c('a', 'b', 'c'), 2)

View(movies)
index <- sample(1:50000, 3)
index
movies %>% slice(index)

index <- seq(2, 50000, 2)
movies %>% slice(index)


# Número de buses: 
Nbuses <- 500
personas <- 100
obs <- 20

maxPersona <- rep(0, personas)

for(i in 1:personas){
  maxPersona[i] <- max(sample(1:Nbuses, obs))
}

maxPersona

