# Regresión logística -----------------------------------------------------
# valores de salida deben ser 0 o 1

library(caret)


# Carga de datos 
bh <- read.csv("Data/boston-housing-logistic.csv")

bh$CLASS <- factor(bh$CLASS, levels = c(0,1))

set.seed(2021)
t.id <- createDataPartition(bh$CLASS, p = 0.7, list = F)

# MODELO
mod <- glm(CLASS ~., data = bh[t.id,], family = binomial)

summary(mod)


bh[-t.id, "Prob_success"] <- predict(mod, newdata = bh[-t.id,], type = "response")
bh[-t.id, "PRED_50"] <- ifelse(bh[-t.id,"Prob_success"] >= 0.5, 1, 0)

# matriz de confusión

table(bh[-t.id,"CLASS"], bh[-t.id,"PRED_50"], dnn = c("Actual", "Predicho"))
