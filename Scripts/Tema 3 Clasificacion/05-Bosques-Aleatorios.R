
# Bosques aleatorios ------------------------------------------------------
# install.packages("randomForest")
library(caret)
library(randomForest)


banknote <- read.csv("Data/banknote-authentication.csv")


banknote$class <- factor(banknote$class)


set.seed(2018)

training.ids <- createDataPartition(banknote$class, p = 0.7, list = F)

# Construir varios +arboles de clasificación
 # es pesado


mod <- randomForest(x = banknote[training.ids, 1:4],
                    y = banknote[training.ids, 5],
                    ntree = 500,
                    keep.forest = T)

pred <- predict(mod, banknote[-training.ids,], type  ="class")


#  Creando la matriz de confusión con RF
table(banknote[-training.ids, "class"], pred, dnn = c("Actual", "Predicho"))


probs <- predict(mod, banknote[-training.ids,], type = "prob")

pred <- prediction(probs[,2], banknote[-training.ids, "class"])
perf <- performance(pred, "tpr", "fpr")
plot(perf)
