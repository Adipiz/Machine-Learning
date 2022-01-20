
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


# Cargando ficheros Rdata y rds -------------------------------------------


# Carga Rdata file 
# Nota que está la tabla de pedidos y un vector
load("Data/pedidos.Rdata")


# Carga RDS
orders <- readRDS("Data/pedidos.rds")

data(iris)
data(cars)

# Guardar todos los objetos de una sesión ---------------------------------

save.image(file = "Data/alldata.Rdata")


primes <-c(2,3,5,7,11,13)
pow2 <-c(2,4,8,16,32,64,128)

save(list = c("primes","pow2"), file = "Data/prime_and_pow2.Rdata")

# Qué pasa si existin dichas variables en el ambiente y no quiero que se sobreescriba

attach("Data/prime_and_pow2.Rdata")

# LIsta de Datasets en r
data()

load(cars)
