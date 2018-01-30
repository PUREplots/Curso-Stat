library(ggplot2)
library(dplyr)
library(tidyr)

for(i in 1:10){
  print(i)
}

# simulación: 

Nbuses <- 500
alumnosde1ero <- 1000

maxBuses <- rep(0, alumnosde1ero)

for(i in 1:alumnosde1ero){
  buses <- sample(1:Nbuses, 20, replace = TRUE)
  maxBuses[i] <- max(buses)
}

maxBuses <- data.frame(maxBuses)

ggplot(maxBuses, aes(x=maxBuses)) + 
  geom_histogram(breaks = seq(300, Nbuses, 10))


View(maxBuses)

maxBuses %>% summarise(mean(maxBuses))


# promedio x 2:

Nbuses <- 500
alumnosde1ero <- 1000

promx2 <- rep(0, alumnosde1ero)

for(i in 1:alumnosde1ero){
  buses <- sample(1:Nbuses, 20, replace = TRUE)
  promx2[i] <- 2*mean(buses)
}

promx2 <- data.frame(promx2)

ggplot(promx2, aes(x=promx2)) + 
  geom_histogram(breaks = seq(200, Nbuses + 250, 10))



ggplot() + 
  geom_histogram(data = maxBuses, alpha = 0.3, fill = "blue", 
                 aes(x=maxBuses),
                 breaks = seq(200, Nbuses + 250, 10)) +
  geom_histogram(data =  promx2, alpha = 0.3, fill = "red", 
                 aes(x=promx2),
                 breaks = seq(200, Nbuses + 250, 10))
