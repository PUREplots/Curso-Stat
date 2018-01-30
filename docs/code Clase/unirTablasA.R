library(dplyr)
library(tidyr)

trips <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/babs_open_data_year_2/201508_trip_data.csv', 
                  stringsAsFactors=FALSE)

clima <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/babs_open_data_year_2/201508_weather_data.csv', 
                  stringsAsFactors=FALSE)

View(trips)
View(clima)

# manipular data frames
trips$Start.Date

# manipular vectores: 
x <- c(11,22,33,44,55,66,77)
x
x[7]

# "aaa bbb"
unlist(strsplit("a.b.c", "[.]"))
li <- strsplit("a.b.c", "[.]")
li[[1]]

# tengo "aaa bbb" y quiero "aaa" "bbb" 
unlist(strsplit("hola bbb nada", " "))[1]

# 2 veces la Duration
trips %>% mutate(Duration = sin(Duration))

# modificar la fecha en trips: 
tripsE <- trips %>% select(`Start Date` = Start.Date)

tripsFecha <- tripsE %>% select(Fecha = `Start Date`) %>% 
           mutate(Fecha = unlist(strsplit(Fecha, " "))[1])

View(tripsFecha)

# No funciona, todas las fechas son iguales... 

tripsFecha <- trips %>% select(Fecha = Start.Date) %>% 
              mutate(Fecha = gsub(" .*$", "", Fecha)) %>%
              group_by(Fecha) %>% 
              summarize(Viajes.Diarios = n())

View(tripsFecha)


climaFecha <- clima %>% select(Fecha = PDT, 
                               Temp = Mean.TemperatureF) %>%
              group_by(Fecha) %>%
              summarize(Temp = mean(Temp))

View(climaFecha)

dim(tripsFecha)
dim(climaFecha)
 
tripsClima <- 
  inner_join(tripsFecha, climaFecha, by = "Fecha") %>%
              mutate(Temp = (Temp - 32)*5/9)

View(tripsClima)

tripsClima %>% filter(Temp > 15) %>% 
               summarize(mean(Viajes.Diarios)) %>% View()

tripsClima %>% filter(Temp <= 15) %>% 
      summarize(mean(Viajes.Diarios)) %>% View()


# Días frios y calientes: 

x <- c(1, 2, 1, 2, 2, 1)
x

factor(x, labels = c('Frio', 'Caliente'))

x <- c(1, 2, 3, 5, 5, 2, 2, 1)
x > 2

factor(x > 2, labels = c('Frio', 'Caliente'))

tripsClima %>% 
  mutate(Temp = factor(Temp > 15, 
                       labels = c('Frio', 'Caliente'))) %>%
  View()


clima %>% group_by(Events) %>% 
          summarize(Num.Dias = n()) %>%
          View()

# seco, húmedo, mojado

f <- factor(clima$Events)
levels(f) <- c('Humedo', 'Humedo', 'Mojado', 'Mojado', 'Seco')


