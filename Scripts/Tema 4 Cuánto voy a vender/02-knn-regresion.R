
# Regresión con knn -------------------------------------------------------

install.packages("FNN")
library(dummies) # Crear dummies
library(FNN)     # KNN uses
library(scales)  # escalar valores
library(caret)   # Particionar los datos

# data

education <- read.csv("Data/education.csv")

str(education)

# Se quiere preveer el gasto

dms <- dummy(education$region, sep = "_")
edu <- cbind(education, dms)


# Estandarizando las predictoras entre 0 y 1
edu$urban.s <- rescale(edu$urban)
edu$income.s <- rescale(edu$income)
edu$under18.s <- rescale(edu$under18)

# partición de datos
set.seed(2021)
t.id <- createDataPartition(edu$expense, p = 0.6, list= F)

# Data de entrenamiento
tr <- edu[t.id,]

# data intermedia
temp <- edu[-t.id,]

v.ids <- createDataPartition(temp$expense, p = 0.5, list = F)

# data de validación
val <- temp[v.ids,]

# Data de testing
test <- temp[-v.ids,]


# Construcción de modelo
reg1 <- knn.reg(tr[,7:13], val[,7:13], tr$expense, k=1,
                algorithm = "brute")


# Calculando el rmse con un vecino
rmse1 <- sqrt(mean((reg1$pred - val$expense)^2))
rmse1



# Construcción de modelo con dos vecinos
reg2 <- knn.reg(tr[,7:13], val[,7:13], tr$expense, k=2,
                algorithm = "brute")
# rmse con dos vecinos
rmse2 <- sqrt(mean((reg2$pred - val$expense)^2))
rmse2

# Modelo con tres vecinos
reg3 <- knn.reg(tr[,7:13], val[,7:13], tr$expense, k=3,
                algorithm = "brute")

# Rmse con tres vecinos
rmse3 <- sqrt(mean((reg3$pred - val$expense)^2))
rmse3



# Modelo con cuatro vecinos
reg4 <- knn.reg(tr[,7:13], val[,7:13], tr$expense, k=4,
                algorithm = "brute")

# rmse con cuatro vecinos
rmse4 <- sqrt(mean((reg4$pred - val$expense)^2))
rmse4

# Plot de los errores
errores <- c(rmse1, rmse2, rmse3, rmse4) 
plot(errores, type = 'o', xlab = 'k vecinos', ylab = "RMSE" )


# Regresión con conjunto de testing
reg.test <- knn.reg(tr[,7:12], test[,7:12], tr$expense, k=3,
                algorithm = "brute")

# rmse con cuatro vecinos
rmse.test <- sqrt(mean((reg.test$pred - test$expense)^2))
rmse.test


df <- data.frame(actual = test$expense, pred = reg.test$pred)


# K nearest Neighbors sólo con dos particiones ---------------------------------------

t.id <- createDataPartition(edu$expense, p = 0.7, list = F)

# Conjunto de entrenamiento
tr <- edu[t.id,]

# Conjunto de validación
val <- edu[-t.id,]

reg <- knn.reg(tr[,7:13], test = NULL, y = tr$expense, 
               k = 3, algorithm = "brute")


rmse.reg <- sqrt(mean(reg$residuals^2))
rmse.reg


# Creando una función para encontrar la k de reegresión que nos de el mejor rmse

rdacb.knn.reg <- function(tr_predictor, val_predictors,
                          tr_target, val_target, k){
  
  res <- knn.reg(tr_predictor, val_predictors,
                 tr_target, k, algorithm = 'brute')
  rmserror <- sqrt(mean((val_target - res$pred)^2))
  
  cat(paste("RMSE con k = ", toString(k), ": ", rmserror, "\n", sep = ""))
  rmserror
}

# aplicando nuestra función
rdacb.knn.reg(tr[, 7:13], val[,7:13],
              tr$expense, val$expense, 3)

# Aplicando KNN con un ciclo for para la obtención de K vecinos de elección
rdacb.knn.reg.multi <- function(tr_predictor, val_predictors,
                                tr_target, val_target, start_k, end_k){
  rms_errors <- vector() 
    for(k in start_k:end_k){
    rms_error <- rdacb.knn.reg(tr_predictor, val_predictors,
                                tr_target, val_target, k)
      rms_errors <- c(rms_errors, rms_error)
    }
  
  plot(rms_errors, type = 'o', xlab = "k", ylab = "RMSE")
  
}
 
#Prueba de nueva función 
rdacb.knn.reg.multi(tr[,7:12], val[,7:12], tr$expense, val$expense, 1, 10)

 


