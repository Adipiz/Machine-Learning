
# 03-Bar-plots ------------------------------------------------------------
 # Variables categóricas

library(ggplot2)

# Data
bike <- read.csv('Data/daily-bike-rentals.csv')


# TRansformación de datos
bike$season <- factor(bike$season, levels =c(1,2,3,4), labels = c('Invierno','Primavera', 'Verano', 'Otoño'))


bike$workingday <- factor(bike$workingday, levels = c(0,1),labels = c("Día Libre", "Día de Trabajo"))


bike$weathersit <- factor(bike$weathersit, levels = c(1,2,3), labels = c('Buen Tiempo', 'Día Nublado', 'Mal Tiempo'))



library(dplyr)
bike.sum  <- bike %>%
                 group_by(season, workingday) %>% 
                 summarise(rental = sum(cnt))
                
# Bar plot
ggplot(bike.sum, aes(x = season, y = rental, fill = workingday, label = scales::comma(rental))) + 
  geom_bar(show.legend = T, stat = 'identity') + 
  labs(title = 'Alquileres de bicicletas por estación y por día') + 
  scale_y_continuous(labels = scales::comma) + 
  geom_text(size = 3, position = position_stack(vjust = 0.5)) + 
  theme_minimal()
