
# Análisis rdata ----------------------------------------------------------

clientes <- c("name1","name2","name3")
fechas <- as.Date(c("2017-12-27","2017-11-1","2018-1-1"))
pagos <- c(315, 192.55, 40.15)

# creando data frames
pedidos <- data.frame(clientes, fechas, pagos)


# modificaciones del archivo

clientes_vip <- c("name1","name2")

# guardando un archivo 
save(pedidos, file = "Data/pedidos.Rdata")
saveRDS(pedidos, file = "Data/pedidos.rds")

# modifcando el archivo con nueva data
save(pedidos, clientes_vip ,  file = "Data/pedidos.Rdata")

# remover data de la memoria de r
remove(pedidos)
