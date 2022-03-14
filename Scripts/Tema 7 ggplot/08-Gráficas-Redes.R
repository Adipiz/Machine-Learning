
# Gráficos de redes -------------------------------------------------------
library(igraph)


graf.dir <- graph(edges =c(1,2,2,3,2,4,1,4,5,5,3,6,5,6), n= 6)


graf.no.dir <- graph(edges =c(1,2,2,3,2,4,1,4,5,5,3,6,5,6), n= 6, directed = F)



par(mfrow = c(1,1))
plot(graf.dir)
plot(graf.no.dir)

g.isolated <- graph(c("Juan","María", 
                      "María", "Ana",
                      "Ana", "Juan",
                      "Jose","María",
                      "Pedro", "Jose",
                      "Joel", "Pedro"),
                      isolates = c("Carmen",
                                   "Antonio",
                                   "Mario",
                                   "Vicente"))
plot(g.isolated, edge.arrow.size = 1,
     vertex.color = "gold", 
     vertex.size =15,
     vertex.frame.color = "gray",
     vertex.label.color = 'black',
     vertex.label.cex = 0.8,
     vertex.label.dist = 2,
     edge.curved = 0.2)                    



# analyzing graphs game of thrones lyonwj.com entrada


