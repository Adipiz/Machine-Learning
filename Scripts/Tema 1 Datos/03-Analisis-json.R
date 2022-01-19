# install.package("jsonlite)

#  Análisis json ----------------------------------------------------------


# json: JavaScript Object Notation
library(jsonlite)
library(curl)

# cargando archivos json
dat.1 <- fromJSON("Data/students.json")
dat.2 <- fromJSON("Data/student-courses.json")

# json en tiempo real con yahoo finance (Caída)
# Alternativa
url <- "http://www.floatrates.com/daily/usd.json"
currencies <- fromJSON(url)

# Modo tibble (recodar cargar  install.packages("tidyverse")+ library(tidyverse))
currencies.jason.tibble <- tibble(currencies) %>% unnest_wider(currencies)

# podemos utilizar un data frame para crear un fichero json con toJSON


# Uso de el signo $ -------------------------------------------------------

currencies$eur$date

dat.1$Email
dat.1[c(2,5,8),]
dat.1[, c(2,5)]





