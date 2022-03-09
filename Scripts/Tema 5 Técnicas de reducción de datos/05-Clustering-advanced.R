
# Clustering Avanzado -----------------------------------------------------

library(fpc)
library(factoextra)
data('multishapes', package = 'factoextra')

head(multishapes)

dataPoints <- multishapes[,1:2]


par(mfrow = c(1,1))
plot(dataPoints)



km <- kmeans(dataPoints,5)
fviz_cluster(km, data = dataPoints)



dsfit <- dbscan(dataPoints,
                eps = 0.15,  # radio. dist min para crear un cluster 
                MinPts = 5)   # min de elementos para crear un cluster

dsfit


fviz_cluster(dsfit, dataPoints, geom = 'point')

# Clustering basado en Modelos --------------------------------------------
# Clustering basadas en Modelos
# Técnica de la máxima expectación

library(mclust)

mclust <- Mclust(dataPoints)

plot(mclust)


summary(mclust)





