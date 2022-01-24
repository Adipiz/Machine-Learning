
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


