library(readr)
library(dplyr)

pop_us <- read_csv("C:/Users/Personal/Data-Science-Students/Tables/pop_us.csv")
View(pop_us)

# select() Sirve para seleccionar columnas: 
#   Tabmién puedo cambiar los nombres de las columnas 
#   seleccionadas. 

pop_Simple <- select(pop_us, AGE, SEX, 
                pop_2010 = POPESTIMATE2010, 
                pop_2014 = POPESTIMATE2014)


# mutate() sirve para crear columnas

pop_Simple <- mutate(pop_Simple, Cambio = pop_2014 - pop_2010, 
                   Crecimiento = pop_2014/pop_2010 - 1)


View(pop_Simple)

# filter() selecciona filas!

mujeres <- filter(pop_Simple, SEX == 2)
hombres <- filter(pop_Simple, SEX == 1)

filter(pop_Simple, AGE >= 14 & AGE < 16)
filter(pop_Simple, AGE == 14 | AGE == 30)

View(hombres)

# arrange() ordena la tabla con respecto a una columna. 

arrange(hombres, desc(Cambio))

# funciones: 

rango <- function(v){
  max(v) - min(v)
}

x <- c(1, 2, 3, 1000)
rango(x)

suma <- function(a, b){
  a + b 
}


suma(1, 5)



