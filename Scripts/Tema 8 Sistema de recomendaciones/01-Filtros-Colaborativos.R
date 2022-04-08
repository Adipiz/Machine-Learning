
# Filtros Colaborativos ---------------------------------------------------
library(recommenderlab)

data(MovieLense)
rating_Movies <- MovieLense[rowCounts(MovieLense)>50, 
                            colCounts(MovieLense)>100]

t.id <-sample(x = c(T,F), size= nrow(rating_Movies),
              replace = T, prob = c(0.8,0.2))


data_train <- rating_Movies[t.id,]
data_test <- rating_Movies[!t.id,]

#Matriz sparsed
rating_Movies@data 

rating_Movies@data[1,]
rating_Movies@data[,1]

# Filtrado colaborativo (IBCF)
 # índices que mide qué tan parecido son dos ítems

ibcf <- Recommender(data = data_train,
                   method = "IBCF",
                   parameter =list(k = 30))

ibcf.mod <- getModel(ibcf)

ibcf.mod

n_rec <- 10


ibcf.pred <- predict(object = ibcf,
                     newdata = data_test,
                     n = n_rec)