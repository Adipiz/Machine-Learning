
# Análisis preliminar de una serie ----------------------------------------

WMT <- read.csv("Data/WMT.csv")

plot(WMT$Adj.Close, type = 'l')

# diferencias diarias
d <- diff(WMT$Adj.Close)
plot(d, type ='l')



# Histograma
hist(d, prob = T,
     ylim = c(0,0.8), 
     breaks = 30,
     main = "Walmart stocks",
     col = 'orange3')
lines(density(d), lwd = 3)



WMT.m <- read.csv("Data/WMT-monthly.csv", stringsAsFactors = F)
WMT.m.ts <- ts(WMT.m$Adj.Close)


d <- diff(as.numeric(WMT.m.ts))
d


WMT.m.return <- d / lag(as.numeric(WMT.m.ts), k = -1)




hist(WMT.m.return, prob =T, col = "blue3")
