
# Random Forest -----------------------------------------------------------

library(randomForest)
library(caret)


# data de casas de houston
bh <-  read.csv("Data/BostonHousing.csv")

# splitting

set.seed(2022)
t.id <- createDataPartition(bh$MEDV, p=0.7, list = F)



# model: árboles de regresión

mod <- randomForest(x = bh[t.id, 1:13],
                    y = bh[t.id, 14],
                    ntree = 1000,
                    xtest = bh[-t.id, 1:13],
                    ytest = bh[-t.id,14],
                    importance = T,         # hay que calcular lsas puntuaciones de las variable spredictoras
                    keep.forest = T         # quedarse con los árboles 
                    )

mod

mod$importance

par(mfrow = c(2,1))
plot(bh[t.id, "MEDV"], predict(mod,newdata = bh[t.id,]),
     xlab = "Actual",
     ylab = "Predicho", 
     main = "Predicciones con data de entrenamiento")
abline(0,1)

plot(bh[-t.id, "MEDV"], predict(mod,newdata = bh[-t.id,]),
     xlab = "Actual",
     ylab = "Predicho", 
     main = "Predicciones con data de prueba")
abline(0,1)




#mtry = m/3 cuántos predictores vamos a tomar en cada división
# m  = # de predictores
#nodesize = 5, elementos mínimos de la muestra
# maxnodes n´ñumero máximo de nodos terminales.


