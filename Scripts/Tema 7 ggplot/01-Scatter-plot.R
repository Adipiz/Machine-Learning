
# Scatter plot ------------------------------------------------------------
 # Muestran la relación entre dos variables cuantitativas
 # gráfica de puntos

library(ggplot2)
 
auto <- read.csv("Data/auto-mpg.csv", stringsAsFactors = F)

# transformación
auto$cylinders <- factor(auto$cylinders,
                         labels = c("3C","4C","5C","6C","8C"))


# Gráfica
plot <- ggplot(auto, aes(x = weight, y = mpg))

par(mfrow = c(1,2))
plot + geom_point()

plot + geom_point(alpha = 0.5, size = 5, 
          aes(color = factor(cylinders))) + geom_smooth(method ='lm', se = F, col = "green3") +
  facet_grid(cylinders ~.) + 
  theme_bw(base_family = 'calibri', base_size = 10) + 
  labs(x = 'Peso') +
  labs(y = 'Millas por Galeon') + 
  labs(title = 'Rendimiento vs Peso')


# QPLOT
qplot(x = weight, y = mpg, data = auto, 
      geom =c("point", 'smooth'), method ='lm',
      main = "Regresión de MPG")
