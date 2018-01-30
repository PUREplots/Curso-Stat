library(dplyr)
library(tidyr)
library(ggplot2)

Bundesliga <- 
  read.table("C:/Users/Personal/Data-Science-Students/Tables/Bundesliga-Spieler-All-Data_Pos_App.csv", 
             header = TRUE, sep =";")

View(Bundesliga)


Altura <- Bundesliga %>% select(cm)
View(Altura)

Altura %>% summarize(mean(cm)) 

ggplot(Altura, aes(x=cm)) + 
  geom_histogram(breaks = seq(150, 205, 5))

# Varianza: 
x <- data.frame(x = c(1, 2, 2, 10))
View(x)

x <- x %>% mutate(d2 = (x - mean(x))^2)
View(x)

x %>% summarize(sqrt(mean(d2)))


Altura_prom <- Altura %>% summarize(mean(cm)) 
sd_Altura <- Altura %>% 
  mutate(d2 = (cm - mean(cm))^2) %>% 
  summarize(sqrt(mean(d2)))


(201 - Altura_prom)/sd_Altura
(164 - Altura_prom)/sd_Altura


pesoAlt <- Bundesliga %>% select(cm, kg)
View(pesoAlt)


ggplot(pesoAlt, aes(x=kg, y=cm)) +
  geom_point() 

cor(pesoAlt$cm, pesoAlt$kg)

# Corr = 0 pero hay una relación. 
x <- seq(-3, 3, 0.2)
y <- x**2

cor(x, y)
Para <- data.frame(x, y)

ggplot(Para, aes(x=x, y=y)) + geom_point()

# Altura Padres e hijos.

galton <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/galton.csv', sep="\t",
                   stringsAsFactors=FALSE)
View(galton)

galton$Son

galton <- galton %>% mutate(Father = Father*2.54, 
                  Son = Son*2.54)

ggplot(galton, aes(x = Father, y = Son)) + 
  geom_point()

cor(galton)

breaks <- seq(145, 200, by=3)

ggplot(galton) + 
  geom_histogram(aes(Father), 
                 breaks = breaks, 
                 alpha = 0.5, 
                 fill = "blue") + 
  geom_histogram(aes(Son), 
                 breaks = breaks, 
                 alpha = 0.5, 
                 fill = "red")


# Padres super altos, hijos super altos? 

Paltos <- galton %>% filter(Father > 180)

View(Paltos)
ggplot(Paltos, aes(Son)) + 
  geom_histogram(breaks = breaks)


# Dibujar una línea de Regresión: 

ggplot(galton, aes(x = Father, y = Son)) + 
  geom_point() + 
  geom_smooth(method = lm, se = FALSE)

y <- galton$Father
x <- galton$Son

lm(y~x)

# funciones: 
x <- c(1, 2, 3, -8, 10, 5)

su <- function(u){
  
  p <- mean(u)
  s <- sd(u)
  
  xSU <- (u - p)/s 
  
  return(xSU)
}

x <- rep(0, 10)
su(x)


suma <- function(x, y){
  s <- x + y
  return(s)
}

suma(5, 4)


conerse_In_a_Cm <- function(w){
  u <- w*2.54
  return(u)
}

conerse_In_a_Cm(40)



l <- c('c', 's', 's', 'c', 's', 'c')

length(l[l == 'c'])


