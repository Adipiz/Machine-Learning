
# Archivos XML ------------------------------------------------------------

  # Necesitamos un paquete 'XML'
library(XML)

url <- "Data/cd_catalog.xml"


# crea una posición de memoria
xmldoc <- xmlParse(url) # XMLInternalDocument un tipo de estructura en C

# Debemos situarnos el el origen del fichero
rootnode <- xmlRoot(xmldoc)


# Nota que estos datos no tienen la misma str que un df, se debe consultar o extraer la data
rootnode[2]

# Para transformar a un data frame
cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))
 #Note que no se trabajará directamente con esta data porque el formato no es adecuado


# Hacemos una transposición de los datos xml
cds.catalog <- data.frame(t(cds_data), row.names = NULL)

str(cds.catalog)


# Ejemplo de consulta 
head(cds.catalog, 3)[,"TITLE"]


#xpathSApply()
#getNodeSet()

# Leyendo Tablas incrustadas en un HTML -----------------------------------

 # HTML es una forma espcífica de XML

population_url <- "Data/WorldPopulation-wiki.htm"

tables <- readHTMLTable(population_url)

most_populated <- tables[[6]]
head(most_populated,3)


#♠ Personalizando la extracción de datos
custom_table <- readHTMLTable(population_url, which = 6)







         