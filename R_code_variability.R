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


p1 <- ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +      
scale_fill_viridis() +                             
ggtitle("Standard deviation by viridis package")  
p2 <- ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "inferno") +
ggtitle("Standard deviation by viridis package")

p1 + p2   
# plot con viridis 
nird <- as.data.frame(nir, xy=T)  
p3 <- ggplot()+
geom_raster(nird, mapping =aes(x=x, y=y, fill=sentinel_1)) +
scale_fill_viridis(option = "cividis") +
ggtitle("NIR via the cividis colour scale")
p3  

p3+p1
