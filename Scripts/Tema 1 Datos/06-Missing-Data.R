
# Analizando Missing Data -------------------------------------------------

data <- read.csv("Data/missing-data.csv", header = TRUE, 
                 na.strings = "")

# omitir na de un df
data.cleaned <- na.omit(data)

# Consulta na`s específicos
is.na(data[4,2])
is.na(data[4,1])

is.na(data$Income)

# Limpieza selectiva de na`s ----------------------------------------------
 # limpieza de una columna
data.income.cleaned <- data[!is.na(data$Income),]

# Evaluamos qué filas están completas
complete.cases(data)

# Limpiar la data 2 de NAs
data.cleaned.2 <- data[complete.cases(data),]

# Valores específicos que queremos modificar, completar con NA
data$Income[data$Income == 0] <- NA




