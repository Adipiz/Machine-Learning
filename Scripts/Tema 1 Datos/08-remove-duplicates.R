
# Remover duplicados ------------------------------------------------------

 #Creando dataset con duplicaciones

family.salary = c(40000,60000,50000,80000,60000,70000,60000)
family.size = c(4,3,2,2,3,4,3)
family.car = c("Lujo","Compacto","Utilitario"," Lujo",
               "Compacto", "Compacto", "Compacto")
family <- data.frame(family.salary, family.size, family.car)


# Evitar Duplicaciones con unique()
unique(family)

# Puedo preguntar si está duplicado
duplicated(family)

# Si me interesan los duplicados
family[duplicated(family),]


