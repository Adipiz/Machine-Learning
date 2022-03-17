
# Gráficos multivariantes -------------------------------------------------

library(ggplot2)
install.packages("GGally")
library(GGally)

bike <- read.csv("Data/daily-bike-rentals.csv")

head(bike)



# Transformación de Variables

bike$season <- factor(bike$season, 
                      levels = c(1,2,3,4),
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))


bike$weatersit <- factor(bike$weathersit,
                         levels = c(1,2,3),
                         labels = c("Despejado","Nublado", "Lluvioso"))

bike$weekday <- factor(bike$weekday,
                       levels = 0:6,
                       labels =c("D","L", "M", "X", "J","V", "S"))


bike$windspeed.fac <- cut(bike$windspeed, breaks = 3, labels = c("Bajo","Medio", "Alto"))



ggplot(bike, aes(x =temp, y = cnt)) + 
  geom_point(size = 3, aes(color = windspeed.fac)) +
  theme(legend.position = 'bottom') +
  geom_smooth(method = 'lm', se = F, col = 'red') +
  facet_grid(weekday ~ season)



# Paquete GGally ----------------------------------------------------------

auto <- read.csv("Data/auto-mpg.csv", stringsAsFactors = F)

auto$cylinders <- factor(auto$cylinders,
                         labels = c("3C","4C","5C","6C","8C"))


names(auto)


# Mejor ajuste de los datos a través del paquete

ggpairs(auto[,2:5])



# Guardando gráficas en un fichero # option 1
# postscript(file = "multivariant.ps")
pdf(file="multivariant.pdf")

ggpairs(auto[,2:5], 
        aes(colour = cylinders,
            alpha = 0.4),
        title ="Análisis multivariante de carros",
        upper= list(continuous = "density"),
        lower = list(combo = "denstrip"))+
  theme(plot.title = element_text(hjust = 0.5))

# Cerrando el fichero #
dev.off()



         