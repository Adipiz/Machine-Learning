
# Tratamiento de outliers -------------------------------------------------
ozone.data <- read.csv("Data/ozone.csv", stringsAsFactors = F, header = T)

names(ozone.data)


# boxplot pressure
boxplot(ozone.data$pressure_height,
        main = "Pressure Height",
        boxwex = 0.8)
summary(ozone.data$pressure_height)



# boxplot pressure per month
boxplot(pressure_height ~ Month, 
        data = ozone.data,
        main = "Pressure Height per Month")

# Boxplot ozone reading per month
boxplot(ozone_reading~Month,
        data = ozone.data,
        main = "Ozone reading per Month")


# boxplot pressure- outliers
boxplot(ozone.data$pressure_height,
        main = "Pressure Height",
        boxwex = 0.8)

mtext("Texto en la gráfica")

# Reemplazo de los outliers -----------------------------------------------
impute_outliers <- function(x, removeNA = TRUE){
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA)
  x
}

imputed_date <- impute_outliers(ozone.data$pressure_height)


# Grafica cpon oiutliers y outliers reemplazados
par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, 
        main = "Presión con outliers")
boxplot(imputed_date, 
        main = "Presión sin outliers")


# 

replace_outliers <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25,0.75), na.rm = removeNA)
  caps <- quantile(x, probs = c(0.05,0.95), na.rm = removeNA)
  iqr <- qrts[2] - qrts[1]
  h <- 1.5 *iqr
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

capped_pressure_height <- replace_outliers(ozone.data$pressure_height)


par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, 
        main = "Presión con outliers")
boxplot(capped_pressure_height, 
        main = "Presión sin outliers")


