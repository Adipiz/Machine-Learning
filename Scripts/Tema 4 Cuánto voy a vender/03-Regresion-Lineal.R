
# Regresión Lineal --------------------------------------------------------

library(caret)
auto <- read.csv("Data/auto-mpg.csv")


# Convirtiendo cylinders en factor

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3c", "4c","5c","6c","8c"))
str(auto)


# Se quiere predecir el consumo de un coche. RElación lineal de millas por galón respecto de otras variables
# Creando una partición
t.id <- createDataPartition(auto$mpg, p = 0.7, list = FALSE)

# creando modelo
mod <- lm(mpg ~ ., data = auto[t.id, -c(1,8,9)])
mod

# Resumen del modelo lineal
summary(mod)

# Plot de la distribución de residuos
boxplot(mod$residuals)

# Raiz del error cudrado medio
sqrt(mean((mod$residuals)^2))


# prediciendo valores del conjunto de testing
pred <- predict(mod, auto[-t.id, -c(1,8,9)])


# Calculando el error
sqrt(mean((pred- auto[-t.id,"mpg"])^2))


# Plot del modelo con indicadores clave

par(mfrow = c(2,2))
plot(mod)


# Cambiando el valor de refrencia de la variable categórica

auto <- within(auto, cylinders <- relevel(cylinders, ref = "4c"))

# Modelo con nueva categoría
mod <- lm(mpg ~., data = auto[t.id, -c(1,8,9)])
mod


pred <-predict(mod, auto[-t.id, -c(1,8,9)])

sqrt(mean((pred-auto[-t.id,"mpg"])^2))
plot(mod)

# Analizando las gráficas podemos notar que los residuos se 
# distribuyen aleatoriamente alrededor del cero, no mostrando 
# ningún patrón o  tendencia. Estos residuos se distribuyen bastante 
# normal con excepción de algunos datos específicos. 
# Además, al parecer la varianza es constante, esto es, los 
# errores deben ser homocedasticos y 
# hay pocos valores pesen en el modelo.






# Librería MASS y la función step -----------------------------------------
 # Selección de variables importantes en el modelo

library(MASS)

# Elimando variables por el AIC
step.mod <- stepAIC(mod, direction = "backward")


