
# Estandarización de datos d eun Dataframe --------------------------------
 # dataframe
housing <- read.csv("Data/BostonHousing.csv")

 # Estandarización Normal
housing.z <- scale(housing, center  = T, scale = T)  # esta función es diferente que reescale (z = (x - mu)/sigma))


 # Estandarización alter, sin restar la media / me quedo con los mismos valores
housing.none <- scale(housing, center = F, scale = F)

 
 # Estandarización ajustando el promedio (resta el promedio)
housing.mean <- scale(housing, center = TRUE, scale = F)


 # Estandarización ajustando la desviación típica
housing.sd <- scale(housing, center = FALSE, scale = TRUE)



# Si quisiera escalar muchas variables o las de mi selección manteniendo mi df
scale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for (col in cols){
    name <- paste(names[col], "z", sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado", length(cols), " variables(s)"))
  dataframe
}

housing <- scale.many(housing, c(1,3,5:8))

