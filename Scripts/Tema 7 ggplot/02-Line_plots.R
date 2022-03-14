
# Line plots --------------------------------------------------------------
library(ggplot2)

mtcars <- read.csv("Data/mtcars.csv")

str(mtcars)

plot <- ggplot(mtcars, aes(wt, mpg))


plot + geom_line(linetype = 'dashed', color = 'red1') 


plot+ geom_line(aes(color =as.factor(carb)))



