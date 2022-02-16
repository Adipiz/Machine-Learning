
# Árboles de regresión ----------------------------------------------------
library(rpart)
library(rpart.plot)
library(caret)


# Utlizar el dataset de las casas de boston para predecir el precio de las casas
bh <- read.csv("MachineLearningR/Machine-Learning/Data/BostonHousing.csv")

#  training subset
t.id <- createDataPartition(bh$MEDV, p = 0.7, list = F)

# Fíjate que no todas las variables del data set aparecen
# algunas variables se repiten

# Predecir la variable MEDV respecto a todas las otras variables del df
bfit <- rpart(MEDV ~., data = bh[t.id,])
bfit


# representaciónn gráfica
prp(bfit , type  = 2,  nn= T, fallen.leaves = T,
    faclen = 4, varlen = 8, shadow.col = "gray")


bfit$cptable

plotcp(bfit)



bfitpruned <- prune(bfit, cp =  0.01555128)
# representaciónn gráfica
prp(bfitpruned , type  = 2,  nn= T, fallen.leaves = T,
    faclen = 4, varlen = 8, shadow.col = "gray")


# prediciendo con árbol de regresión
preds <- predict(bfitpruned, bh[t.id, ])
sqrt(mean((preds - bh[t.id,"MEDV"])^2))


# prediciendo con árbol de regresión
preds <- predict(bfitpruned, bh[-t.id, ])
sqrt(mean((preds - bh[-t.id,"MEDV"])^2))



# Árboles de regresión con valores categóricos
ed <- read.csv("MachineLearningR/Machine-Learning/Data/education.csv")


# Transformando a variables categóricas
ed$region <- factor(ed$region)

str(ed)

#División de data 
t.id <- createDataPartition(ed$expense, p = 0.7, list = F)

#Modelo
fit <- rpart(expense~ region+urban+income+under18, data = ed[t.id,])


#arbol
prp(fit, type = 2, nn =T, fallen.leaves = T,
    faclen = 4, varlen = 8, shadow.col  ="gray")



# Bagging and boosting para crear árboles d eregresión

# Bagging: Método de ensamblaje que permite combinar de forma conjunta
# las predicciones de diferentes árboles para dar un resultado mejor
# sobretodo para técnicas que tienen alta varianza


install.packages("ipred")
library(ipred)


# Modelo con bagging
bagging.fit <-bagging(MEDV~., data =bh[t.id,])

# Valores de predicción para MEDV
prediction.t <- predict(bagging.fit, bh[t.id,])

#RAÍZ DE ERROR CUADRADO medio
sqrt(mean((prediction.t - bh[t.id,"MEDV"])^2))

#Predicción conjunto validación
prediction.val <- predict(bagging.fit, bh[-t.id,])

#RMSE
sqrt(mean((prediction.val - bh[-t.id,"MEDV"])^2))

#Boosting: méytodo de ensamblamiento para reducir el desvío de nuevos modelos
install.packages("gbm")
library(gbm)

gbmfit <- gbm(MEDV~., data = bh, distribution = "gaussian")



