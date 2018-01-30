library(dplyr)
library(ggplot2)


mesquite <- read.table("C:/Users/Personal/Grupo de Trabajo Stats/ARM_Data/mesquite/mesquite.dat", 
                       header = TRUE, skip = 3)

names(mesquite) <- c("obs", "group", "diam1", "diam2", "total.height", "canopy.height", "density", "leaf.weight")

View(mesquite)

mesquite <- mesquite %>% 
  mutate(Vol = diam1*diam2*canopy.height)

View(mesquite)

ggplot(mesquite, aes(x=Vol, y=leaf.weight)) + 
  geom_point() + 
  geom_smooth(method = lm, se = FALSE)

# modelo 1 
Vol <- mesquite$Vol
Peso <- mesquite$leaf.weight

lm(Peso~Vol)

# modelo 2 
Peso <- mesquite$leaf.weight
diam1 <- mesquite$diam1
diam2 <- mesquite$diam2
CH <- mesquite$canopy.height

lm(Peso~diam1 + diam2 + CH)
lm(Peso~I(diam1)^3) # Peso = a*diam1^3 + b
