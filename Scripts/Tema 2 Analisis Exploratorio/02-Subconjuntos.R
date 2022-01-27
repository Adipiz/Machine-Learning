
# Subconjuntos de datos ---------------------------------------------------

data <- read.csv("Data/auto-mpg.csv", stringsAsFactors = F)

# index by position
data[1:5,8:9]

# Index by name
data[1:5,c("model_year", "car_name")]


# min & max de mpg
data[data$mpg == max(data$mpg) | data$mpg == min(data$mpg),]


# filtros con condiciones
data[data$mpg>30 & data$cylinders == 6, c("mpg", "car_name")]

data[data$mpg>30 & data$cyl == 6, c("mpg", "car_name")]

# Subset
subset(data, mpg > 30 & cylinders == 6, select = c("mpg", "car_name"))

#excluir columnas en posiciones
data[1:5,c(-1,-9)]
data[1:5,-c(1,9)]


# Excluir de columnas con nombre 
data[1:5, !names(data) %in% c("No","car_name")]

#---
data[data$mpg %in% c(15,20), c("mpg","car_name")]


# Accediendo a fila
data[1:2, c(F,F,T)]



