library(ggplot2movies)
library(dplyr, tidyr)

movies %>% group_by(year) %>% 
  summarize(mean(rating)) %>% View()


movies %>% group_by(year, length) %>% 
  summarize(sum(votes)) %>% View()


instrumentos <- data.frame(nombre=c('Bob', 'John', 
                                    'Fred', 'Max'), 
           instrumento=c('voz', 'guitarra', 
                         'harmónica', 'pianola'))


View(instrumentos)

grupo <- data.frame(nombre=c('Bob', 'Juan', 'Fred'), 
                           grupo=c('si', 'no', 'si'))

View(grupo)

inner_join(grupo, instrumentos, by="nombre") %>% View()
left_join(instrumentos, grupo, by="nombre") %>% View()



movies %>% select(title, votes, rating) %>% 
    mutate(Nota_Votos = rating*votes) %>% View()

movies %>% select(title, votes, rating) %>% 
  mutate(Nota_Votos = 2*rating) %>% View()

movies %>% arrange(-rating) %>% View()
