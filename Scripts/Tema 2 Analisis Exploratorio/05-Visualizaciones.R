


# Visualizaciones ---------------------------------------------------------
auto <- read.csv("Data/auto-mpg.csv")

# Transformando a factores variables categóricas
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3cyl", "4cyl", "5cyl", "6cyl", "8cyl")
                         )
attach(auto)


# Histograma --------------------------------------------------------------
hist(acceleration,
     col = rainbow(12),
     xlab = "Aceleración",
     ylab = "Frecuencias",
     main = "Histograma de las aceleraciones",
     breaks = 16
     )


# Boxplot -----------------------------------------------------------------
boxplot(mpg~model_year ,
        xlab = "Millas por galeón (mpg) por año")

boxplot(mpg ~ cylinders,
        xlab = "Número de cilindros",
        ylab = "MPG")
     

# Scatter -----------------------------------------------------------------
plot(mpg ~ horsepower)

 # Matriz de scatter
pairs(~mpg+displacement+horsepower+weight)



# Personalizado de graficos -----------------------------------------------

hist(mpg, prob = T)
lines(density(mpg))



# regresión en scatterplot
plot(mpg ~ horsepower)
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)


# Agregar colores para una variable categórica
plot(mpg ~ horsepower, type = "n")
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)

with(subset(auto, cylinders =="8cyl"),
     points(horsepower, mpg, col = "red"))

with(subset(auto, cylinders =="6cyl"),
     points(horsepower, mpg, col = "blue"))

with(subset(auto, cylinders =="5cyl"),
     points(horsepower, mpg, col = "green"))

with(subset(auto, cylinders =="4cyl"),
     points(horsepower, mpg, col = "grey"))
with(subset(auto, cylinders =="3cyl"),
     points(horsepower, mpg, col = "black"))


# Múltiples gráficos ------------------------------------------------------
 # par() es una lista que contiene todos los parámetros 
old.par <- par()

par(mfrow = c(1,2))
with(auto,{
  plot(mpg~weight, main  ="Peso vs Rendimiento")
  plot(mpg ~ acceleration, main = "Aceleración vs Rendimiento"
         )     
})


# Paquete Lattice ---------------------------------------------------------
library(lattice)
auto <- read.csv("Data/auto-mpg.csv",stringsAsFactors = F)

# Transformando a factores variables categóricas
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3cyl", "4cyl", "5cyl", "6cyl", "8cyl")
)


# Boxplot con lattice
bwplot(~auto$mpg | auto$cylinders,
       main = "MPG según cilindrada",
       xlab = "Millas por galón",
       layout = c(2,3), aspect = 1
       )


# scatterplor con lattice

xyplot(mpg ~ weight | cylinders, data = auto,
       main = "Peso vs Rendimiento vs Cilindrada",
       xlab = "Peso",
       ylab = "Consumo",
       layout = c(3,2), aspect = 1)


## Podemos añadit densityplot, splom
trellis.par.set(theme = col.whitebg())
