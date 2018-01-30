library(nycflights13)
library(dplyr)
library(tidyr)
library(ggplot2)

# Varianza: 

View(flights)

numeros <- data.frame(x = c(1, 2, 2, 10))
View(numeros)

numeros <- numeros %>% 
  mutate(dif2 = (x - mean(x))^2)

numeros %>% summarize(sqrt(mean(dif2)))
View(numeros)

# Altura normal: 

Bundesliga <- 
  read.table("C:/Users/Personal/Data-Science-Students/Tables/Bundesliga-Spieler-All-Data_Pos_App.csv", 
             header = TRUE, sep =";")

View(Bundesliga)

altura <- Bundesliga %>% select(cm)
View(altura)

altura %>% summarize(mean(cm))

(201 - 182.8882)/6.522197
(164 - 182.8882)/6.522197

altura %>% 
  mutate(dif2 = (cm - mean(cm))^2) %>% 
  summarize(sqrt(mean(dif2)))

library(ggplot2)
ggplot(altura, aes(x=cm)) + 
  geom_histogram(breaks = seq(150, 220, 5)) 

(201 - 182.8882)/6.522197
(164 - 182.8882)/6.522197


# Relación entre dos variables: 

pesoAltura <- Bundesliga %>% select(cm, kg)
View(pesoAltura)

ggplot(pesoAltura, aes(x=cm, y=kg)) + geom_point()


sat <- read.table(file = "C:/Users/Personal/Data-Science-Students/Tables/sat.csv", header = TRUE, sep = "\t")
View(sat)

ggplot(sat, aes(x=Math, y=Reading)) + geom_point()

ggplot(sat, aes(x=Participation, y=Math)) + geom_point()

cor(sat$Math, sat$Reading)
cor(sat$Math, sat$Participation)

# asociación no lineal: 
x <- seq(-3, 3, 0.2)
y <- x^2

parabola <- data.frame(x, y)
ggplot(parabola, aes(x=x, y=y)) + geom_point()
cor(x, y)


