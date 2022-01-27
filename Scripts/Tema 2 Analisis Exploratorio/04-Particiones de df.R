
# Particiones de data frames con variables numéricas -----------------------------------------------
library(caret)

# Carga de datos
data <- read.csv("Data/BostonHousing.csv")

# dividiendo los datos
 # vamos un conjunto correspondiente a los índices de fila del df original
training.ids <- createDataPartition(data$MEDV, p = 0.8, list = F)

# Obteniendo nuestro conjunto de entrenamiento
data.training <- data[training.ids,]


# Obteniendo nuestro conjunto de validación
data.validation <- data[-training.ids,]


# Caso de tres subconjuntos -----------------------------------------------
training.ids.2 <- createDataPartition(data$MEDV, p = 0.7, list = F)
data.training.2 <- data[training.ids.2,]

# Creamos una variable temporal
temp <- data[-training.ids.2,]

validation.ids.2 <- createDataPartition(temp$MEDV, p = 0.5, list = F)
data.validation <- temp[validation.ids.2,] 
data.validation.2 <- temp[-validation.ids.2,] 


# Partición de df con variables categóricas -------------------------------

data2 <- read.csv("Data/boston-housing-classification.csv")

training.ids.3 <-  createDataPartition(data2$MEDV_CAT, p = 0.7, list = F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3]


## HACER FUNCIONES


# muestreo aleatorio
sample1 <- sample(data$CRIM, 40, replace = T)

