library(ggplot2)
library(ggplot2movies)
library(dplyr)
library(tidyr)
library(readxl)


NobelLaureates <- read_excel("C:/Users/Personal/Data-Science-Students/Tables/Tables_CS109/NobelLaureates.xlsx")
View(NobelLaureates)


# Determinista
index <- c(1, 6, 666)
NobelLaureates %>% slice(index) %>% View()

# Aleatorio (Uniforme)
a <- sample(1:1052, 3)
a
NobelLaureates %>% slice(a) 


View(movies)
ggplot(movies, aes(x=rating, y=..count../sum(..count..))) + 
  geom_histogram(breaks = seq(0, 10, 1)) + 
  scale_x_continuous(breaks = seq(0, 10, 1))

N <- 6
dado <- data.frame(cara = sample(1:6, N, replace = TRUE))
View(dado)

ggplot(dado, aes(x=cara, y=..count../sum(..count..))) + 
  geom_histogram(breaks=seq(0, 6, 1)) +
  scale_x_continuous(breaks = seq(0, 6, 1))


