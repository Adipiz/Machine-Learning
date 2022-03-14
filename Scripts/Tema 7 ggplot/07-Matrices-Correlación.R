
# Matrices de correlación -------------------------------------------------

library(ggplot2)
library(corrplot)
library(grDevices)
mtcars <- read.csv("Data/mtcars.csv")

mtcars$X <- NULL


# Método de Pearson
mtcars.cor <- cor(mtcars, method = 'pearson')

round(mtcars.cor, digits = 2)


# GRáfica de bolas
corrplot(mtcars.cor)


# Gráfica de cuadrados
corrplot(mtcars.cor, method = "shade",
         shade.col = NA,
         tl.col = "black",
         tl.srt = 45)

col <- colorRampPalette(c("#BB4444","#EE9988", "#FFFFFF", "#77AADD","#4477AA"))


corrplot(mtcars.cor, method ='color', shade.col = NA,
         tl.col = 'black', 
         tl.srt = 45, col = col(200),
         addCoef.col = 'black', addcolorlabel = 'no',
         order = "FPC", # AOE o FPC
         type = "upper",
         diag = F,
         addshade = "all",
         insig = c("pch", "p-value", "blank", "n", "label_sig"))

# geom_tile
library(reshape2)


mtcars.melted <- melt(mtcars.cor)
ggplot(data = mtcars.melted, aes(Var1,Var2, fill = value)) + 
                             geom_tile()

# Heat Map ----------------------------------------------------------------

get_lower_triangle <- function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}

get_upper_triangle <- function(cormat){
  cormat[lower.tri(cormat)] <- NA
  return(cormat)
}



reorder_cormat <- function(cormat){
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <- cormat[hc$order, hc$order]
}

cormat <- reorder_cormat(mtcars.cor)
cormat.ut <- get_upper_triangle(cormat)
cormat.ut.melted <- melt(cormat.ut, na.rm = T)


ggplot(cormat.ut.melted, aes(Var2,Var1, fill = value)) + 
  geom_tile(color = 'white') +
  scale_fill_gradient2(low = "blue", high='red', mid ='white', midpoint = 0,
                       limit = c(-1,1), space = "Lab",
                       name ='Pearson Correlation') + 
  theme_minimal() + 
  coord_fixed()
  




