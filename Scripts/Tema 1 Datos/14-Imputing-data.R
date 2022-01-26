
# Técnicas de imputación multivariante ------------------------------------

library(mice)


# data

housing.data <- read.csv("Data/housing-with-missing-value.csv",
                         header = T, stringsAsFactors = FALSE)

# INFERENCIA de datos multivariante

columns <- c("ptratio","rad")

imputed_data<-mice(housing.data[, names(housing.data)%in% columns],
                   m = 5,           # values por cada iteración
                   maxit = 50,      # numero de iteraciones posibles
                   method = 'pmm',  # método de reemplazo, predictive mean matching
                   seed = 2018)

# mice acaba un modelo de datos

#Methods: pmm - comparación predictiva de medias
# logreg - regresión logística
# polyreg - regresión logística politómica
# polr - modelo de probabilidades proporcionales

summary(imputed_data)



complete.data <-  mice::complete(imputed_data)


View(complete.data)

# sustitución
housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

# Cuántos NAs contiene mi data frame por parámetro
anyNA(housing.data)

# otra función para hacer imputaciones

impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5 )
impute_arg

# valores imputados
impute_arg$imputed$rad




