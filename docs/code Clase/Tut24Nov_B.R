library(ggplot2)
library(ggplot2movies)
library(dplyr)
library(tidyr)
library(readxl)
library(readr)

NobelLaureates <- read_excel("C:/Users/Personal/Data-Science-Students/Tables/Tables_CS109/NobelLaureates.xlsx")
View(NobelLaureates)

# Muestra determinista: 
p <- c(1, 2, 666)
NobelLaureates %>% slice(p)

pares <- seq(2, 1052, 2)
NobelLaureates %>% slice(pares) %>% View() 

# Muestra aleatoria: 
d10 <- data.frame(cara = sample(1:10, 1e6, replace = TRUE))
View(d10)

ggplot(d10, aes(x=cara)) + 
  geom_histogram(breaks = 0:10) +
  scale_x_continuous(breaks = 0:10)


primeros10 <- sample(1:10, 3)
primeros10
NobelLaureates %>% slice(primeros10)


# mano de 5 cartas:
# Define suits, cards, values
suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
cards <- c("Ace", "Deuce", "Three", "Four","Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")

# Build deck, replicated proper number of times
deck <- data.frame(expand.grid(cards=cards, suits=suits))
View(deck)

mano <- sample(1:52, 5)
deck %>% slice(mano)


# Pregunta parcial: 

libros <- read_csv(file = "C:/Users/Personal/Data-Science-Students/Tables/parcial1/libros.csv")
notas_lector <- read_csv(file = "C:/Users/Personal/Data-Science-Students/Tables/parcial1/notas_lector.csv")

View(libros)
View(notas_lector)

nota_prom <- notas_lector %>% group_by(id_libro) %>%
            summarize(nota_prom = mean(nota))

View(nota_prom)

nota_prom %>% inner_join(libros, by="id_libro") %>% View()
