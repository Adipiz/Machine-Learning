# Vecinos más cercanos ----------------------------------------------------
 # Método de clasificación que dependede de K

# install.package("class")
library(class)
library(caret)


# Variables predictoras deben ser numéricas
vac <- read.csv("Data/vacation-trip-classification.csv")


# escalando datas
vac$Income.z <- scale(vac$Income)
vac$Family_size.z <- scale(vac$Family_size)

# dividimos tres veces los datos
set.seed(2018)
t.ids <- createDataPartition(vac$Result, p = 0.5, list = F)
train <- vac[t.ids,]

temp <- vac[-t.ids,]
v.ids <- createDataPartition(temp$Result, p = 0.5, list = F)
val <- temp[v.ids,]

test <- temp[-v.ids,]


#------|c. entrenamien, prediccion, var de elección, k =  vecino 
pred1 <- class::knn(train[,4:5], val[,4:5], train[,3], k = 4)



# Matriz de confusión
errmat1 <- table(val$Result, pred1, dnn = c("Actual", "Predichos"))
errmat1


pred2 <- class::knn(train[,4:5], test[,4:5], train[,3], k = 1)
errmat2 <- table(test$Result, pred2, dnn = c("Actual", "Predichos"))
errmat2


# Creando una función con K vecinos más cercanos çoptimos --------------------------









