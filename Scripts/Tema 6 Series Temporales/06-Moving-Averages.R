
# Descomposición de uns serie temporal
# Medias móviles

s <- read.csv("Data/ts-example.csv")

plot(s$sales, type ='l')

n <- 7
weights <- rep(1/n,n)


s.fil.1 <- filter(s$sales, filter = weights, sides = 2) # promediamos ambos lados

lines(s.fil.1, col ='orange1', lwd = 3)


s.fil.2 <- filter(s$sales, filter = weights, sides = 1) # promediamos todos los valores previos
lines(s.fil.2, col ='red1', lwd = 3)






