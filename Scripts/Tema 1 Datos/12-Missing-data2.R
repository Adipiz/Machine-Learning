
# Missing Data ------------------------------------------------------------

housing.data <- read.csv("Data/housing-with-missing-value.csv", header = TRUE,
                         stringsAsFactors = FALSE)


summary(housing.data)


# Prescindiendo de los valores na
housing.data.1 <- na.omit(housing.data)


# Eliminar nas de ciertas columnas

drop_na <- c("rad")
housing.data.2 <- housing.data[
  complete.cases(housing.data[,!names(housing.data)%in% drop_na]),]

# eliminar toda una columna del dataframe

housing.data$rad <- NULL


complete.cases(housing.data)


drops <- c("rad", "ptratio")

housing.data.3 <- housing.data[,!(names(housing.data) %in% drops)]

# Completar información que falta -----------------------------------------

#install.packages("Hmisc")
library(Hmisc)

housing.data.copy1 <-  housing.data


# Rellenar campos NA con valores 
  # rellenar una columna que contiene NAs con el promedio
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)


summary(housing.data.copy1)

# Reemplazo Nas Con MEDIANA
housing.data.copy2 <-  housing.data

housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)


# reemplazo con valor predefinido


housing.data.copy3 <-  housing.data

housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)


summary(housing.data.copy3)


# Cuando nos interesan analizar qué patrones podrían seguir los NAs faltantes
# install.packages("mice")
library(mice)

md.pattern(housing.data)

# si queremos visualizar los NAs podemos usar la librería VIM
# install.packages("VIM")
library(VIM)

aggr(housing.data, 
     col = c('paleturquoise4', 'red3'),
     sortVars = T,
     numbers = T,
     labels = names(housing.data), 
     cex.axis = 1,
     gap = 2,
     ylab = c('Histograma de NAs','Patrón'))






