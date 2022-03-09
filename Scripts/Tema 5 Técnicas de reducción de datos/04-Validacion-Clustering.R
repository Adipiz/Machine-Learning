
# Validación de Clustering ------------------------------------------------
library(factoextra)
library(cluster)
library(fpc)
library(NbClust)

protein <- read.csv("Data/protein.csv")
rownames(protein) <- protein$Country
protein$Country <- NULL

protein.scaled <- as.data.frame(scale(protein))



nb <- NbClust(protein.scaled, distance = 'euclidean',
              min.nc =  2,
              max.nc = 12,
              method = 'ward.D2', index = 'all')
fviz_nbclust(nb) + theme_minimal()




km.res <- kmeans(protein.scaled,3)



# Cercanía con los cluster vecinos
 # sín el valor es negativo no es una buena clusterización

sil.km <- silhouette(km.res$cluster, dist(protein.scaled))


summary(sil.km)


fviz_silhouette(sil.km)





dd <- dist(protein.scaled, method = 'euclidean')

km_stats <- cluster.stats(dd, km.res$cluster)



km_stats$within.cluster.ss



km_stats$clus.avg.silwidths


# índice de dunn distancia más pequeña entre elementos de dif cluster dividido la dist más grande de elementos intraclust
km_stats$dunn


kmed <- pam(protein.scaled, 3)

kmed_stats <- cluster.stats(dd, kmed$clustering)

kmed_stats$dunn


res.com <- cluster.stats(dd, km.res$cluster,
                         kmed$clustering)


res.com$corrected.rand
res.com$vi



