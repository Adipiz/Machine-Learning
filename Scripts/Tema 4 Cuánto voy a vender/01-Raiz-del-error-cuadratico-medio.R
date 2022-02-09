
# Raiz Error cuadrático Medio --------------------------------------------------

# Cargamos el dataset preparado
data <- read.csv("Data/rmse.csv")

# Queremos construir una medida del error de nuestra estimación
rmse <- sqrt(mean((data$price - data$pred)^2))

#   ¿Qué tal se comporta la predicción?
plot(data$price, data$pred,
     xlab = "Actual",
     ylab = "Predicción")
abline(0,1)


# Creando una función de la raiz del error cuadrático medio
rmse <- function(actual, predicted){
  return( sqrt(mean((actual - predicted)^2)))
}

# Evaluando la función
rmse(data$price, data$pred)





