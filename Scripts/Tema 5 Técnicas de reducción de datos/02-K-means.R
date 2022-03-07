
# kmeans es una técnica de división de clustering que se enfoqca en dividir 
# n observaciones en k cluster cuyo pormedio este más cercano.
# se requiere el número de divisiones
# es más ràpido que le árbol jerárquico


protein <- read.csv("MachineLearningR/Machine-Learning/Data/protein.csv")

rownames(protein) <- protein$Country

protein$Country <- NULL

# Escalado de las observaciones
protein.scaled <- as.data.frame(scale(protein))

library(devtools)
devtools::install_github('kassambara/factoextra') # librería para graficar cluster por k-means




km <- kmeans(protein.scaled, centers =4)
km


aggregate(protein.scaled, by = list(cluster = km$cluster), mean)


library(factoextra)
fviz_cluster(km, data = protein.scaled)




# Minibatch k-means: tratamiento con imágenes

install.packages(c('OpenImageR','ClusterR'))
library(OpenImageR)
library(ClusterR)


img <- readImage('MachineLearningR/Machine-Learning/Data/bird.jpg')

img.resize <- resizeImage(img, 350, 350, method = 'bilinear')
imageShow(img.resize)

img.vector <- apply(img.resize, 3, as.vector)
dim(img.vector)



# Obtencvión de centroides 
knmb <- MiniBatchKmeans(img.vector, clusters = 6,
                        batch_size = 20,
                        num_init = 5,
                        max_iters = 100,
                        init_fraction = 0.2,
                        early_stop_iter = 10,
                        verbose = F)


prmb <- predict_MBatchKMeans(img.vector, knmb$centroids)



get.cent.mb <- knmb$centroids

new.img <- get.cent.mb[prmb, ]
dim(new.img) <- c(nrow(img.resize), ncol(img.resize),3)


imageShow(new.img)





