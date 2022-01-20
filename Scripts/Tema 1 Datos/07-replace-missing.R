
# Reemplazando NAs  -------------------------------------------------------
data <- read.csv("Data/missing-data.csv", header = TRUE, na.strings = "")
data$Income[data$Income == 0 ] <- NA

# Creando una nueva columna
data$Income.mean <- ifelse(is.na(data$Income),
                           mean(data$Income, na.rm = TRUE),
                           data$Income
                           )
# me faltan datos, puedo hacer una muestreo y decir que valor podría poner
random.impute <- function(x){ # es un vector de datos que puede contener NA
  missing <- is.na(x)         # missing contiene valor T o F   
  n.missing <- sum(missing)   # un valor que suma de NA
  x.obs <- x[!missing]        # quiénes no tienen NAs
  imputed <- x                # por defecto devolver el mismo valor
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE) # reemplazar los faltantes con valores conocidos
  return (imputed)
}

#------
prueba <- c(1,8,NA,4, NA,6)
missing <- is.na(prueba)
n.missing <- sum(missing)

prueba[missing] <- sample(c(1,2,4,7), n.missing, replace = TRUE)
#------

random.imput.data.frame <- function(dataframe, cols){
  names <-names(dataframe)
  for (col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = random.impute(dataframe[,col])
  }
    dataframe
}

# Aplicamos la función para las dos columnas
data.2 <- random.imput.data.frame(data, c(1,2))