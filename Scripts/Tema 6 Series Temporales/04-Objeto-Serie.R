# Data de prices
prices <- read.csv('Data/prices.csv')
head(prices)

# datos mensuales
prices.ts <- ts(prices, start = c(1980,1), frequency = 12)
prices.ts



plot(prices.ts, plot.type='single', col = 1:2)
legend('topleft', colnames(prices.ts), col = 1:2, lty = 1)


start(prices.ts)
end(prices.ts)

