
# Ficheros de Ancho fijo --------------------------------------------------

# fixed width formated
#En un archivo de texto de ancho fijo, los datos están contenidos en columnas 
#que tienen un ancho fijo (lo que significa que cada columna contiene un cierto
#número de posiciones de caracteres). Los datos que no llenen el ancho de la 
#columna se rellenan con caracteres de relleno, que suelen ser espacios o ceros.


# Leyendo un archivo de ancho fijo sin encabezado
students_data <- read.fwf("Data/student-fwf.txt", 
                          widths = c(4,15, 20, 15, 4),
                          col.names = c("id","nombre","email", 
                                        "carrera", "año"))

# leyendo archivos con encabezados, título y subtítulo
students_data_header <- read.fwf("Data/student-fwf-header.txt",
                                 widths = c(4,15, 20, 15, 4),
                                 header = TRUE, 
                                 sep = "\t",
                                 skip = 2
                                ) 

# excluyendo columnas. Indicar en negativo en 'widths' y eliminarb
students_data_no_email <- read.fwf("Data/student-fwf.txt", 
                          widths = c(4,15, -20, 15, 4),
                          col.names = c("id","nombre", 
                                        "carrera", "año"))




