library(dplyr)
library(tidyr)
library(readr)

pop_us <- read_csv("C:/Users/Personal/Data-Science-Students/Tables/pop_us.csv")
View(pop_us)

pop_Mas_Simple <- select(pop_us, SEX, AGE, pop = POPESTIMATE2014)

View(pop_Mas_Simple)

# funciones: Ponerle un nombre a algunas líneas de código. 

rango <- function(x){
  max(x) - min(x)
} 

rango(c(1,2,3,4))

porcentaje <- function(p){
  round(100*p, 2)
}

porcentaje(0.5)
porcentaje(2/3)

# Traten de arreglar este problema: 
porcentaje(1/60000)

# sirven con cualquier tipo: 

adolescentes.votantes <- function(df){
  # para mi los adolescentes tiene entre 16 y 18 años. 
  filter(df, AGE >= 16 & AGE <= 18)
}

adolescentes.votantes(pop_Mas_Simple)


# usar funciones con mutate. Tengo que poner un mejor ejemplo
# Ejercicio: 
#   traten de usar porcentaje en la tabla que tiene col. Crecimiento. 

mutate(pop_Mas_Simple, colNueva = porcentaje(AGE))


View(pop_Mas_Simple)

# factors: sirven para ponerle etiquetas a códigos. 
factor(c(1,2,0,0,1,2,2,1,1), 
       labels = c('total', 'hombre', 'mujer'))

# Ejercicio: pop_Mas_Simple tiene una col SEX 
# pongan etiquetas 'total', 'hombre', 'mujer' en la col SEX. 

pop_Mas_Simple <- mutate(pop_Mas_Simple, 
        SEX = factor(SEX, labels = c('total', 'hombre', 'mujer')))


# libraría tidyr
library(tidyr)

# %>% 
pop_Simple <- select(pop_us, AGE, SEX, pop_2014 = POPESTIMATE2014, 
                     pop_2010 = POPESTIMATE2010)

pop_Simple <- mutate(pop_Simple, Cambio = pop_2014 - pop_2010)

View(pop_Simple)

pop_us %>% select(AGE, SEX, pop_2014 = POPESTIMATE2014, 
                  pop_2010 = POPESTIMATE2010) %>%
           mutate(Cambio = pop_2014 - pop_2010)

# Ejercicio (de 2 centavos): 
#  Comiencen con pop_us. Seleccionen AGE, SEX, pop_2014, pop_2010. 
#  Luego ordenen la tabla por edades y 
#  creen la col. Cambio ... usando %>%.

# Afortunado ganador: Jonathan Moreano!! (deuda) 
pop_us %>% select(AGE, SEX, pop_2014 = POPESTIMATE2014, 
                  pop_2010 = POPESTIMATE2010) %>% 
            arrange(AGE) %>%
            mutate(Cambio = pop_2014 - pop_2010)


# Quiero comparar la población para cada edad:  

pop_Mas_Simple <- mutate(pop_Mas_Simple, 
                         SEX = factor(SEX, labels = c('total', 'hombre', 'mujer')))

View(pop_Mas_Simple)

pop_HM <- spread(pop_Mas_Simple, key = SEX, value = pop)

pop_HM <- pop_HM %>% 
    mutate(p_hombres = round(100*(hombre/total), 2))

# el misterio de los humbres desaparecidos... 
View(pop_HM)

trips <- read.csv('C:/Users/Personal/Data-Science-Students/Tables/babs_open_data_year_2/201508_trip_data.csv', 
                  stringsAsFactors=FALSE)

View(trips)

# group_by y summ``arize. 

''
""
``

# Código para su tabla: 
#      trips %>% group_by(`Start Station`, `End Station`) %>%
#             
  
viajes <- trips %>% 
            group_by(Start.Station, End.Station) %>% 
            summarize(viajes.totales = n())

View(viajes)

# Cómo se ven los viajes??? 

viajesV2 <- trips %>% group_by(Start.Station, End.Station) %>% 
                      summarize(Num.Viajes = n(), 
                                Dur.Min = min(Duration),
                                Dur.Max = max(Duration))
View(viajesV2)

