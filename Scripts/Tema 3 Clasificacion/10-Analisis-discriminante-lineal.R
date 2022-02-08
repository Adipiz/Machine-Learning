# Análisis de discriminante lineal ----------------------------------------
 # Intenta expresar las variables dependientes como una combinación 
 # lineal de las caracteríticas.


# install.packages("MASS")
library(MASS)  
library(caret)


bn <- read.csv("Data/banknote-authentication.csv")
bn$class <- factor(bn$class)

set.seed(2018)
t.id <- createDataPartition(bn$class, p = 0.7, list = F)


# MODELO
mod <- lda(bn[t.id,1:4], bn[t.id,5])
# mod <- lda(class ~., data = bn[t.id,])  <- alternativo

bn[t.id, "Pred"] <- predict(mod, bn[t.id, 1:4])$class

table(bn[t.id, "class"], bn[t.id,"Pred"], dnn = c("Actual", "Predichos") )


bn[-t.id, "Pred2"] <- predict(mod, bn[-t.id, 1:4])$class
table(bn[-t.id, "class"], bn[-t.id,"Pred2"], dnn = c("Actual", "Predichos") )


