# Árboles de clasificación ------------------------------------------------

#install.packages(c("rpart","rpart.plot","caret"))
library(caret)
library(rpart) # generación de árboles
library(rpart.plot) # gráfica de árboles


banknote <- read.csv("Data/banknote-authentication.csv")

set.seed(2018)

training.ids <- createDataPartition(banknote$class, p = 0.7, list  = FALSE)


# Construcción de modelo del árbol
mod <- rpart(class ~ .,                            # es el modelo, class es la variable dependiente de todas las anteriores   
             data = banknote[training.ids,],       # Data frame, el conjunto de entrenamiento
             method = "class",                     # Método de clasificación
             control = rpart.control(minsplit = 20, # parámetros del método
                                     cp = 0.01))
mod


# Representación del árbol de decisión
prp(mod, type = 2, extra = 104, nn = T,
    fallen.leaves= T, faclen = 4, varlen = 8,
    shadow.col = 'gray')



# Poda del árbol de clasificación -----------------------------------------

 # elegir complejidad (dado por CP) asegurar que el error
# total no es mayor que la suma entre el valor mínimo y la desviación stándar

mod$cptable


mod.pruned <- prune(mod, mod$cptable[6, "CP"])

prp(mod.pruned, type = 2, extra = 104, nn = T,
    fallen.leaves= T, faclen = 4, varlen = 8,
    shadow.col = 'gray')




pred.pruned <- predict(mod.pruned, banknote[-training.ids,], type = "class")


table(banknote[-training.ids,]$class, pred.pruned, dnn = c("Actual","Predicho") )

# Con probabilidades
pred.pruned2 <- predict(mod.pruned, banknote[-training.ids,], type = "prob")

library(ROCR)

pred <- prediction(pred.pruned2[,2], banknote[-training.ids, "class"])


perf <- performance(pred, "tpr", "fpr")


plot(perf)





