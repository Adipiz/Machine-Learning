protein <- read.csv('MachineLearningR/Machine-Learning/Data/protein.csv')
row.names(protein) <- protein$Country

protein$Country <- NULL



protein.scaled <- as.data.frame(scale(protein))



library(cluster)
library(factoextra)


# Representante principal de los cluster medoides
km <- pam(protein.scaled, 4)
km



fviz_cluster(km)



# Aplicacion de grandes clustering

clarafit <- clara(protein.scaled, 4, samples = 5)
clarafit



fviz_cluster(clarafit)

