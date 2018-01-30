library(readr)
library(dplyr, tidyr)
# Unir data.frames

clima <- read_csv("C:/Users/Personal/Data-Science-Students/Tables/babs_open_data_year_2/201508_weather_data.csv")
trips <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/babs_open_data_year_2/201508_trip_data.csv', 
                  stringsAsFactors=FALSE)

View(clima)
View(trips)

# 
# idea: 

unlist(strsplit("a b c", " "))

strsplit("a b c", " ")

# Voy a usar mutate: 

trips %>% 
  mutate(Fecha = unlist(strsplit(Start.Date, " ")))

# Lo siento... 

# Yo encontré esta solución: 

tripsFecha <- trips %>% 
      select(Fecha = Start.Date) %>%
      mutate(Fecha = gsub(" .*$", "", Fecha))

View(tripsFecha)

# número de viajes diarios:

tripsFecha <- tripsFecha %>% group_by(Fecha) %>% 
                             summarize(Num.Viajes = n())

View(tripsFecha)


climaPromedio <- clima %>% select(Fecha = PDT, 
                                  `Mean TemperatureF`)

View(climaPromedio)

# dimensiones de los data.frames: 

dim(tripsFecha)
dim(climaPromedio)

# para resolver el problema de las temps múltiples: 

climaPP <- climaPromedio %>% group_by(Fecha) %>% 
                  summarize(Temp.Prom = mean(`Mean TemperatureF`))

View(climaPP)

dim(climaPP)


# Unamos las tablas: 
# Queremos una tabla que tenga las columnas: 
#   Fecha Num.Viajes Temp.Prom

ViajesClima <- inner_join(tripsFecha, climaPP, by = "Fecha")

#ViajesClima <- ViajesClima %>% mutate(Temp.Prom = (Temp.Prom - 32)*5/9)

View(ViajesClima)



