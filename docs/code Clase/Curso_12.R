library(ggplot2)
library(tidyverse)

galton <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/galton.csv', sep="\t",
                   stringsAsFactors=FALSE)
View(galton)

galton <- galton %>% 
  mutate(Father = Father*2.54, Son = Son*2.54)

View(galton)

ggplot(galton, aes(x=Father, y=Son)) +
  geom_point()

breaks = seq(140, 200, 3)

ggplot(galton) + 
  geom_histogram(aes(Father), 
                 breaks = breaks, 
                 alpha = 0.5, 
                 fill = "blue") + 
  geom_histogram(aes(Son), 
                 breaks = breaks, 
                 alpha = 0.5, 
                 fill = "red")
  

PAltos <- galton %>% filter(Father >= 185)
View(PAltos)

ggplot(PAltos, aes(Son)) + 
    geom_histogram(breaks=breaks)


# Dibujar una línea de regresión.

ggplot(galton, aes(x=Father, y=Son)) +
  geom_point() + # puntos  
  geom_smooth(method = 'lm', se = FALSE) 


cor(galton)

# regresión lineal

x <- galton$Father
y <- galton$Son

model1 <- lm(y~x)
summary(model1)


