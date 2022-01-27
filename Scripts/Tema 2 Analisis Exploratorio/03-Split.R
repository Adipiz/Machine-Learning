#split / unsplit
data <- read.csv("Data/auto-mpg.csv", stringsAsFactors = F)

# split crea una lista
cars <- split(data, data$cylinders)

# lista x
cars[1]

# lista del data frame
cars[[1]]


