library(readxl)
library(ggplot2)
library(dplyr, tidyr)

NobelLaureates <- read_excel("C:/Users/Personal/Data-Science-Students/Tables/Tables_CS109/NobelLaureates.xlsx")
View(NobelLaureates)


premiosSA <- NobelLaureates %>% filter(`Geographic Area` == 'South America') %>%
  group_by(Country) %>% 
  summarise(Num.Premios = n())

View(premiosSA)

# https://stackoverflow.com/questions/25664007/reorder-bars-in-geom-bar-ggplot2

ggplot(premiosSA, aes(x = Country, y = Num.Premios)) + 
  geom_bar(stat = 'identity')

ggplot(premiosSA, 
       aes(x = reorder(Country, -Num.Premios), y = Num.Premios)) + 
  geom_bar(stat = 'identity') + coord_flip()


premiosSATipo <- NobelLaureates %>% 
  filter(`Geographic Area` == "South America") %>%
  group_by(Country, `Laureate Area`) %>%
  summarize(Num.Premios = n())


View(premiosSATipo)


# premios Nobel por paîs y tipo: 

ggplot(premiosSATipo, aes(x = Country, y = Num.Premios)) +
  geom_bar(stat = 'identity', aes(fill = `Laureate Area`)) + 
  coord_flip() 


