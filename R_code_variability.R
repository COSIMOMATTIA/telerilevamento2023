library(raster)
setwd("C:/lab/")
sen <- brick("sentinel.png")
#banda1= nir
#banda2= red
#banda3= green
plotRGB(sen, 1, 2, 3, stretch="lin")
nir <- sen[[1]]

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)
library(ggplot2)
ggplot() +
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) 

sd3d <- as.data.frame(sd3, xy=T)
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))
install.packages("viridis")
library(viridis)

ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() 

ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma")

ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation via magma colour scale")
