
# CURVAS ROC: Característticas operativas del receptor --------------------
library(pROC)

data1 <- read.csv("Data/roc-example-1.csv")
data2 <- read.csv("Data/roc-example-2.csv")


pred1 <- predict