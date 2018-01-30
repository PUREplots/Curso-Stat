library(ggplot2)

# Repaso for loop: 
x <- rep(0, 10)
for(i in 1:10){
  x[i] <- i
}
x

# for(i in vector){
#   ejecutar este código
# }

sum <- 1 
for(i in 1:10){
  sum <- sum*i 
}
sum

# Estimar 

Nbuses = 500

alumnosde1ero <- 10000
numMax <- rep(0, alumnosde1ero)

for(i in 1:alumnosde1ero){
  buses <- sample(1:Nbuses, 20, replace = TRUE)
  numMax[i] <- max(buses)
}

numMax <- data.frame(numMax = numMax)
View(numMax)

ggplot(numMax, 
       aes(x = numMax, y=..count../sum(..count..))) + 
    geom_histogram(breaks = 300:(Nbuses+1))


# promedio por 2 ??????
Nbuses = 500

alumnosde1ero <- 10000
prom2 <- rep(0, alumnosde1ero)

for(i in 1:alumnosde1ero){
  buses <- sample(1:Nbuses, 20, replace = TRUE)
  prom2[i] <- 2*mean(buses)
}

prom2 <- as.data.frame(prom2) 

ggplot(prom2, aes(x=prom2)) + 
    geom_histogram(breaks = 0:(2*Nbuses))


ggplot() + 
  geom_histogram(data = prom2, alpha = 0.3, fill = "red", 
                 aes(x=prom2), breaks = 0:(2*Nbuses)) + 
  geom_histogram(data = numMax, alpha = 0.3, fill = "blue",
                 aes(x=numMax), breaks = 0:(2*Nbuses))

# Promedio:



