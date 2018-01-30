library(dplyr)
library(tidyr)
library(ggplot2)


mesquite <- read.table("C:/Users/Personal/Grupo de Trabajo Stats/ARM_Data/mesquite/mesquite.dat", 
                       header = TRUE, skip = 3)
# Obs Group Diam1 Diam2 TotHt CanHt Dens LeafWt
names(mesquite) <- c("obs", "group", "diam1", "diam2", "total.height", "canopy.height", "density", "leaf.weight")

View(mesquite)

mesquite <- mesquite %>% 
  mutate(Vol = diam1*diam2*canopy.height)

View(mesquite)

lm(mesquite$leaf.weight~mesquite$Vol)

lm(mesquite$leaf.weight~mesquite$diam1 +
     mesquite$diam2 + mesquite$canopy.height)




