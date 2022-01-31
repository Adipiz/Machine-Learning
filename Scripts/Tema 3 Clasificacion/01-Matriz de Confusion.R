# Matrices de confusión ---------------------------------------------------

cp <- read.csv("Data/college-perf.csv", stringsAsFactors = T, header = T)


str(cp)

# En este caso tenemos una predicción de un Modelo 'X'.
 # valor real
cp$Perf <- ordered(cp$Perf, 
                   levels =c("Low", "Medium", "High")) 
 # predicción del modelo
cp$Pred <- ordered(cp$Pred, 
                   levels =c("Low", "Medium", "High")) 



# crear una tabla y tenemos todos los cruces posibles. 
 # Esta es nuestra maytriz de confusión
table <- table(cp$Perf, cp$Pred, 
               dnn = c("Actual", "Predecido"))
table

# En porcentajes absolutos
prop.table(table)

# Desempeño del modelo por filas
round(prop.table(table, 1)*100, 2)


# Desempeño del modelo por columnas
round(prop.table(table, 2)*100, 2)




# Diagramas de Mosaico ----------------------------------------------------
barplot(table, legend = TRUE,
        xlab = "Nota predicho")


mosaicplot(table, main = "Eficiencia del modelo")

# Un resumen de la tabla
# El p-value bajo indica dependencia entre el valor actual y el predicho, es decir,
# el modelo es eficiente.
# se hace un test de independencia
summary(table)










