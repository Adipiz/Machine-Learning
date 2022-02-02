
# Naive Bayes -------------------------------------------------------------
 # requiere que todas las variables sean categóricas

install.packages("naivebayes")
library(e1071)
library(naivebayes)
library(caret)

ep <- read.csv("Data/electronics-purchase.csv")
str(ep)

set.seed(2018)
t.ids <- createDataPartition(ep$Purchase, p = 0.67, list = F)


# Modelo de Naive Bayes
mod <- naiveBayes(Purchase ~. , data = ep[t.ids,])
mod


# Predicciones 
pred <- predict(mod, ep[-t.ids,])


# matriz de confusión
tab <- table(ep[-t.ids, "Purchase"], pred, dnn = c("Actual", "Predicha"))

confusionMatrix(tab)



