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
pred1 <- class::knn(train[,4:5], val[,4:5], train[,3], k = 5)



# Matriz de confusión
errmat1 <- table(val$Result, pred1, dnn = c("Actual", "Predichos"))
errmat1


pred2 <- class::knn(train[,4:5], test[,4:5], train[,3], k = 5)
errmat2 <- table(test$Result, pred2, dnn = c("Actual", "Predichos"))
errmat2

# Creando una función con K vecinos más cercanos óptimos --------------------------
 # Eligiendo el mejor número de vecinos

knn.automate <- function(tr_predictors,
                         val_predictors,
                         tr_target,
                         val_target,
                         start_k, end_k){
  for (k in start_k:end_k){
    pred <- knn(tr_predictors, val_predictors, tr_target, k)
    tab <- table(val_target, pred, dnn = c("Actual", "Predichos"))
    cat(paste("Matriz de confusión par k =",k, "\n"))
    cat("=======================================\n")
    print(tab)
    cat("=======================================\n")
  }
}


# Probando la función knn.automate
knn.automate(train[,4:5], val[,4:5], train[,3], val[,3], 1,8)


# Determinar k a partir de función de paquete CARET -----------------------


trcntrl <- trainControl(method ="repeatedcv",
                        number = 10,
                        repeats = 3)

caret_knn_fit <- train(Result ~ Family_size + Income, 
                       data = train,
                       method ="knn",
                       trControl = trcntrl,
                       preProcess = c("center", "scale"),
                       tuneLength = 10)

caret_knn_fit


# Modificando la manera en cómo clasificamos. Usando probabilidades.

pred5 <- knn(train[,4:5],   # Conjunto de entrenamiento
             val[,4:5],     # Conjunto que qiero clasificar
             train[,3],     # Categorías de entrenamiento
             k = 5,         # número de vecinos
             prob = T)      # probabilidad de ser o no ser

pred5










