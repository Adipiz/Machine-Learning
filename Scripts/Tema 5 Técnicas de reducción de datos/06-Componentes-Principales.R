
# Análisis Componentes principales ----------------------------------------


bh <- read.csv('Data/BostonHousing.csv')

library(corrplot)


corr <- cor(bh[,-14])

# Gráfica de correlaciones
corrplot(corr, method = 'color')
corrplot(corr, method = 'circle')


# analisis de CP

bh.acp <- prcomp(bh[,-14], scale = T) # scale = T matriz de correlaciones
                                      #scale = F matriz de covarianzas


summary(bh.acp)


# rtepresentacion de las varianzas
plot(bh.acp, type = 'lines')


biplot(bh.acp, col= c("gray", "red"))

head(bh.acp$x,5)


bh.acp$rotation

bh.acp$sdev
