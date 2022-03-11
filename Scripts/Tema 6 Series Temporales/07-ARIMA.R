# ARIMA

inf <- read.csv('Data/infy-monthly.csv')
inf.ts <- ts(inf$Adj.Close, start = c(1999,3), frequency = 12)


inf.arima <- auto.arima(inf.ts)
summary(inf.arima)


# ARIMA no es muy bueno para pronosticar valores mayores a un año
inf.fore <- forecast(inf.arima, h = 12)
plot(inf.fore, col = 'red', fcol = 'blue2')
