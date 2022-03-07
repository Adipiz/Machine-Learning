
# Clustering jerárquico ---------------------------------------------------
# Ocurre que podemos tener una obs no etiquetada, el clustering nois ayuda a eso
# analiza rasgos o características para etiquetar
# Intenta construir una jerarquía a partir de división de los datos.
  # Agrupativo o divisitivo
  # Utilizan función de distancias


# Ejemplo de Clustering jerárquico

protein <- read.csv("Data/protein.csv")

# Consumo promedio por vcada país: Clustering aglomerativo

data <- as.data.frame(scale(protein[,-1]))

data$Country <- protein$Country

rownames(data) <- data$Country

#Creación de cluster jerárquico aglomerativo
hc <- hclust(dist(data, method = 'euclidean'), method = 'ward.D2')
hc

plot(hc, hang = -0.01, cex = 0.7)


# Método aglomerativo. 
hc2 <- hclust(dist(data, method = "euclidean"), method = 'single')

plot(hc2, hang = -0.01, cex = 0.7)



hc3 <- hclust(dist(data, method = 'euclidean'), method = 'complete')
hc3
plot(hc3, hang = -0.01, cex = 0.7)



hc4 <- hclust(dist(data, method = 'euclidean'), method = 'average')

plot(hc4, hang = -0.01, cex = 0.7)

hc4$merge


# Distancias y métodos de generación de cluster ---------------------------

# Generando matriz de distancias
d <- dist(data, method = 'euclidean')
d


# Clustering divisitivos --------------------------------------------------
install.packages("cluster")
library(cluster)

dv <- diana(data, metric = "euclidean")
plot(dv)

plot(hc)

fit <- cutree(hc, k = 4)

table(fit)
# representar con cajas cada división

rect.hclust(hc,k=4, border = "gray")









