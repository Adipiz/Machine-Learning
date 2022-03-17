
# Gráficos 3D -------------------------------------------------------------
#install.packages("plot3D")
library(plot3D)

mtcars <- read.csv("Data/mtcars.csv")


rownames(mtcars) <- mtcars$X

mtcars$X <- NULL


# Gráfica en 3D
scatter3D(x = mtcars$disp, 
          z = mtcars$mpg, 
          y = mtcars$wt,
          clab = "Millas por Galeón",
          pch = 19,
          cex = 1.5,
          theta = 25, # azimutal
          phi = 20,  # colatitud  
          main = "Autos años 70",
          xlab = "Desplazamiento (cu.in.)",
          ylab = "Peso (1000 lbs)",
          zlab = "Millas por galeón",
          bty = "f" # b, g, f, bl
          )  


# Textos e Histogramas ----------------------------------------------------

text3D(x = mtcars$disp, 
       z = mtcars$mpg, 
       y = mtcars$wt,
       labels = rownames(mtcars),
       add = T,
       colkey = F,
       cex = 0.5)

data("VADeaths")
head(VADeaths)

hist3D(z = VADeaths,
       scale = F, 
       expand = 0.01,
       bty = "g",
       phi = 30,
       col = "#1188CC",
       border = "black",
       shade = 0.45,
       ltheta = 80,
       space = 0.3,
       ticktype = "detailed")

scatter3D(x = mtcars$disp,
          y = mtcars$wt,
          z = mtcars$mpg,
          type = "h")


# Guardar gráficas en archivos --------------------------------------------
 # con funciones nativas
pdf(file="nombre.pdf")
png(file="nombre.pdf", width = 3000, height = 3000) # Pesa más pero la calidad es mejor
# plot 1
# plot 2
dev.off()






