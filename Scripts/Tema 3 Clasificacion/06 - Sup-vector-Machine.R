# Máquinas de soporte vectorial
 # problemas de clasificación y regresión.
 # elaborar modelos
 # la idea es buscar un hiperplano que mejor separe las dos muestras


install.packages("e1071") # SVM
library(caret) 
library(e1071)  


banknote <- read.csv("Data/banknote-authentication.csv")

# convirtiendo la variable class en factor
banknote$class <- factor(banknote$class)

# dividiendo el data set
set.seed(2018)

# data set training
t.ids <- createDataPartition(banknote$class, p = 0.7, list = F)

# modelo support vector machines
mod <- svm( class~., data = banknote[t.ids,])


# Matriz de confusión con datos de entrenamiento
table(banknote[t.ids, "class"], fitted(mod), dnn = c("Actual", "Predicho"))


# hacemos predicción con datos de prueba
pred <- predict(mod, banknote[-t.ids,])

# Matriz de confusión con datos de validación
table(banknote[-t.ids,"class"],pred, dnn = c("Actual", "Predicho") )


# Gráfica de la clasificación
plot(mod, data = banknote[t.ids,], skew ~ variance )
plot(mod, data = banknote[-t.ids,], skew ~ variance )


tuned <- tune.svm(class ~., data = banknote[t.ids,],
                  gamma = 10^(-6:1),
                  cost = 10^(1:2))

summary(tuned)
