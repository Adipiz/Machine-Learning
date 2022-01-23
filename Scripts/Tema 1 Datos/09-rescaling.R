
# Rescalado de datos ------------------------------------------------------
 # Muy utilizado en ML cuando se trata de distancias


library(scales)

# Data
students <- read.csv("Data/data-conversion.csv")


# rescaling the income variable with rescale()
 # el valor más pequeño toma el valor cero y el valor más alto le asigna 1
students$Income.rescales <- rescale(students$Income)

# A manita
(students$Income - min(students$Income))/(max(students$Income) - min(students$Income))

# rescaling uo to 100
rescale(students$Income, to  = c(0,100))



# Crear una función que reescale
rescale.many  <- function(dataframe, cols){
  names <- names(dataframe)
  for (col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[, col])
  }
  cat(paste("Hemos reescalado"), length(cols), " variable(s)")
  dataframe
}

# Rescaling many cols

students.rescaled <- rescale.many(students, c(1,4))



