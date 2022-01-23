# Categorizando información numérica --------------------------------------
 # Nos interesa transformar variables numéricas a categóricas
  # por ej: el método de clasificación de Naive-Bayes requiere que var dep e ind sean categóricas

 
# Coversión Var NUMÉRICAS a Categóricas

students <- read.csv("Data/data-conversion.csv")

# Break points
bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low","Average","High")


# creando una variable categórica en la tabla
students$Income.cat <- cut(students$Income, breaks = bp, labels = names)

# Cuando no indicamos la etiqueta 
students$Income.cat2 <- cut(students$Income, breaks = bp)

# Por defecto 
students$Income.cat3 <- cut(students$Income, breaks = 4, 
                            labels = c("Level 1","Level 2", "Level 3", "Level 4"))
