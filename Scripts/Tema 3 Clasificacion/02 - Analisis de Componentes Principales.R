
# Análisis de Componentes principales -------------------------------------

 # PCA es una técnica de clasificación que permite reducir la dimensionalidad de un dataset
  # el análisis se basa en identicar las variables que son representativas de la
 # estructura del dataset de tal manera de reducir la cantidad de datos
 
# transforma los datos que tienen muchas dimensiones a otros que tengan menos dimensiones

# reemplaza el n grande de variables por menos variables que no tengas relación


usarrest <- read.csv("Data/USArrests.csv", stringsAsFactors = F)


rownames(usarrest) <- usarrest$X
usarrest$X <- NULL

# Varianza de variables
apply(usarrest, 2, var)

# fallo = 0
# éxito = 1









# Podemos escalar

acp <- prcomp(usarrest,
              center = TRUE,
              scale = TRUE)
acp


# elegir las cp con la técnica del codo
plot(acp, type = "l")


# Como es el desempeño de las componentes
summary(acp)

biplot(acp, scale = 0) 

# Componentes principales
pc1 <- apply(acp$rotation[,1]*usarrest, 1, sum)
pc2 <- apply(acp$rotation[,2]*usarrest, 1, sum)

usarrest$pc1 <- pc1 
usarrest$pc2 <- pc2 


usarrest[,1:4] <- NULL
