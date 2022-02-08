
# Redes Neuronales para clasificar --------------------------------------------------------
 # sistema de conexiones
install.packages("nnet")
library(nnet)
library(caret)

bn <- read.csv("Data/banknote-authentication.csv")
bn$class <- factor(bn$class)


# conjunto de entrenamiento

t.id <- createDataPartition(bn$class, p = 0.7, list = F)

mod <- nnet(class ~., data = bn[t.id,],
            size = 3,                   # capas ocultas
            maxit = 10000,              # num max de ite
            decay = 0.001,              # overfitting
            rang = 0.05)                

# predicción de data
pred <- predict(mod, newdata = bn[-t.id,], type = "class")


#Matriz de confusión
table(bn[-t.id,]$class, pred, dnn = c("Actual", "Predichos"))


# Cuidar que no tengamos nas porque funciona mal
mod <- nnet(class ~., data = bn[t.id,],
            size = 3,                   # capas ocultas
            maxit = 10000,              # num max de ite
            decay = 0.001,              # overfitting
            rang = 0.05,
            na.action = na.omit,        # excluir NAs
            skip = T)                   # añade una capa adicional para intentar separar nodos de
                                        # entrada y de salida
# Parámetro rang
# rang * max(variables) ~ 1


# Si estoy interesado en generar una curva roc
library(ROCR)

pred2 <- predict(mod, newdata = bn[-t.id,], type  ="raw")
perf <- performance(prediction(pred2, bn[-t.id, "class"]), "tpr","fpr")
plot(perf)



