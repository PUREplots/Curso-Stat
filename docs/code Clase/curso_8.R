library(ggplot2)
library(dplyr, tidyr)
library(ggplot2movies)

dim(movies)
View(movies)

# Gráfico de base:
ggplot(movies, aes(x = rating)) +
  geom_histogram(breaks = seq(from=0, to=10, by=2))

# Gráfico completo
ggplot(movies, aes(x = rating)) +
  geom_histogram(breaks = seq(from=0, to=10, by=2)) + 
  scale_x_continuous(breaks = seq(0, 10, 2)) + 
  xlab('Nota') + ylab('Número de películas') +
  ggtitle('Título')

# Histograma con proporciones: 
ggplot(movies, aes(x = rating, y = ..count../sum(..count..))) +
  geom_histogram(breaks = seq(from=0, to=10, by=2))


# Prueben diferentes tamaños de bins:
ggplot(movies, aes(x = rating)) +
  geom_histogram(breaks = seq(from=0, to=10, by=0.5))





