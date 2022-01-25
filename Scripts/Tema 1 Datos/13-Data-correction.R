
# Data Correction ---------------------------------------------------------
library(tidyr)

crime.data <- read.csv("Data/USArrests.csv", stringsAsFactors = F)
crime.data <- cbind(state = rownames(crime.data), crime.data)



crime.data.1 <- gather(crime.data, 
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder : UrbanPop)

crime.data.2 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       -state)


crime.data.3 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       Murder, Assault)


# Función contraria a gather

crime.data.4 <- spread(data = crime.data.2, 
                       key = "crime_type",
                       value = "arrest_estimate"
                       )

# Pegar diversas columnas
crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault,
                      sep = "_")

# separar uniones

crime.data.6 <- separate(crime.data.5,
                         col = "Murder_Assault",
                         into = c("Murder", "Assault"),
                         sep = "_") 