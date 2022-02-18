library(nnet)
library(caret)
library(devtools)


# Carga de data
bh <- read.csv("Data/BostonHousing.csv")

#División de data
set.seed(2022)

t.id <- createDataPartition(bh$MEDV, p = 0.7, list = F)

summary(bh$MEDV) # ajiustar la variable MEDV para que esté entre 0-1

# Modelo
fit <- nnet(MEDV/50 ~., data = bh[t.id,],
            size = 6, decay = 0.1,
            maxit = 1000, linout = T)

# GRáfica de redes neuronales
source_url("https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r")

plot(fit, max.sp = T) # max.sp maximiza el espacio

# Hay trece varibles de entrada
# Nota que tienes en la capa intermedia oculta tienes 6 nodos
# dos nodos intermedios

# Error de la predicción
sqrt(mean((fit$fitted.values*50 - bh[t.id, "MEDV"])^2))

pred <- predict(fit, bh[-t.id,])

sqrt(mean(pred*50 - bh[-t.id, "MEDV"])^2)





