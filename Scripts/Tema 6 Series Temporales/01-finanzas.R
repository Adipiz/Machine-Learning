# Carga de data

AMZN <- read.csv('Data/AMZN.csv', stringsAsFactors = F)
GOOG <- read.csv('Data/GOOG.csv', stringsAsFactors = F)
AAPL <- read.csv('Data/AAPL.csv', stringsAsFactors = F)
FB <- read.csv('Data/FB.csv', stringsAsFactors = F)



str(AAPL)

# Transformando columna de fecha a formato fecha
AAPL$Date <-  as.Date(AAPL$Date)
GOOG$Date <-  as.Date(GOOG$Date)
AMZN$Date <-  as.Date(AMZN$Date)
FB$Date <-  as.Date(FB$Date)



library(ggplot2)


ggplot(AAPL, aes(Date, Close)) +
  geom_line(aes(color = "Apple")) +
  geom_line(data = AMZN, aes(color = 'Amazon')) + 
  geom_line(data = FB, aes(color = 'Facebook')) +
  geom_line(data = GOOG, aes(color = 'Google')) + 
  labs(color = 'Empresa') + 
  scale_color_manual("", breaks = c("Apple","Amazon", "Facebook", "Google"),
                     values = c("black","green",  "blue","red")) +
  ggtitle('Comparaciones de cierre de stocks') + 
  theme(plot.title=element_text(lineheight = 0.7, face = 'bold')) +
  theme_minimal()








# Datos en tiempo Real ----------------------------------------------------
 #• Quantmod cargando datos de web de finanzas

install.packages('quantmod')
library(quantmod)


getSymbols("AAPL")
barChart(AAPL)
chart_Series(AAPL)

head(AAPL)

chart_Series(AAPL[,4], TA = 'addMACD()')


