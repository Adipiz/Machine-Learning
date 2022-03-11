# Forecasting
inf <- read.csv('Data/infy-monthly.csv')

head(inf)
tail(inf.ts)


inf.ts <- ts(inf$Adj.Close, start = c(1999,3), frequency = 12)
inf.ts


plot(inf.ts)

# Holt-Winters
inf.hw <- HoltWinters(inf.ts)

plot(inf.hw, col = 'black', col.predicted = 'orange3')

#Errores
inf.hw$SSE
inf.hw$alpha
inf.hw$beta


library(forecast)

infy.fore <- forecast(inf.hw, h =24)
plot(infy.fore)

