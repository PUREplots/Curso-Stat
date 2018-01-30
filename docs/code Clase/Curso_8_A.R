library(ggplot2)
library(dplyr, tidyr)
library(ggplot2movies)

View(movies)
dim(movies)


# Quiero estas películas: 2, 6, 66, 666, última.

index <- c(2, 6, 66, 666, 58788)
index

Muestra0 <- movies %>% slice(index)
# slice(movies, index)
View(Muestra0)

# las 50 primeras películas pares. 
nombre1 <- seq(from=2, to=100, by=2) # seq(2, 100, 2)
nombre1
Muestra1 <- movies %>% slice(nombre1)
View(Muestra1)

# Prueba
# Usen movies:
#     - Lista de todas las películas del año en le que nacieron.
#     - Mejor y peor película. 
#     - Nota promedio. 



#pelisAño <- movies %>% group_by(year=1995)
pelisAño <- movies %>% filter(year==1995)

View(pelisAño)

# Mejor/pero peli. 
pelisAño %>% arrange(desc(rating)) %>% View()
pelisAño %>% filter(rating > mean(rating) + 2*sd(rating)) %>% 
    View()
pelisAño %>% filter(rating > 9) %>% View()
pelisAño %>% filter(rating == 10) %>% View()


# Nota Promedio 
pelisAño %>% summarize(prom = mean(rating))
pelisAño %>% group_by(year) %>% summarize(prom = mean(rating)) 
movies %>% group_by(year) %>% 
    summarize(prom = mean(rating)) %>%
    filter(year == 1995)

nombre <- movies %>% group_by(year) %>% 
            summarize(max(rating)) 
View(nombre)


Instrumentos <- data.frame(
                      nombre =c('Justin B.', 
                                'Max. Escalera', 
                                'Alci Acosta'), 
                      instrumento =c('Belleza', 
                                     'Pianola', 
                                     'Canta'))

View(Instrumentos)

Grupo <- data.frame(
                  nombre =c('Justin B.', 
                            'R.R Martin', 
                            'Alci Acosta'), 
                  grupo =c('No', 
                                 'Si', 
                                 'Si'))

View(Grupo)


Instrumentos %>% inner_join(Grupo, by = 'nombre') %>% View()
left_join(Instrumentos, Grupo, by = 'nombre') %>% View()
semi_join(Instrumentos, Grupo, by = 'nombre') %>% View()


# plots: 
View(pelisAño)

ggplot(pelisAño, aes(x=rating, y=..count../sum(..count..))) + 
    geom_histogram(breaks=seq(0, 11, 1))


library(readr)
MusicStore <- read_csv("C:/Users/Personal/Data-Science-Students/Tables/Tables_CS109/MusicStore.csv")
View(MusicStore)

DiscosCont <- MusicStore %>% select(Region, Genre) %>% 
                group_by(Region, Genre) %>% 
                summarize(Num.Discos =n())

View(DiscosCont)

ggplot(DiscosCont, aes(x=Region, y=Num.Discos)) +
    geom_bar(stat='identity', aes(fill=Genre))





