library(raster)
setwd("C:/lab/")
sen <- brick("sentinel.png")
sen
plot(sen)
sen2 <- stack(sen[[1]], sen[[2]], sen[[3]]) 
plot(sen2)
pairs(sen2)
sample <- sampleRandom(sen2, 10000)
sample
# pricipal component analisis 
pca <- prcomp(sample)
pca
summary(pca)
plot(pca)
pca
pci <- predict(sen2, pca, index=c(1:2))
pci
plot(pci[[1]])

# ggplot per grafici e viridis 
library(ggplot2)
library(viridis)
ggplot() +
geom_raster(pci, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis()
pcid <- as.data.frame(pci[[1]], xy=T)
ggplot() +
geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis()
pcid <- as.data.frame(pci[[3]], xy=T)
ggplot() +
geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis()

#patchwork
library(patchwork)   # mettere le library tutte sopra 
pci1 <- as.data.frame(pci[[1]], xy=T)
pci3 <- as.data.frame(pci[[3]], xy=T)
plot1 <- ggplot() +
geom_raster(pci1, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis()

plot3 <- ggplot() +
geom_raster(pci3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis()
plot1 + plot3


sd3d <- as.data.frame(sd3, xy=T)
sd3 <- focal(pci[[1]], matrix(1/9, 3, 3), fun=sd) # deviazione standard 
plotsd <- ggplot() +
geom_raster(pci3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis(option=inferno) + 
ggtitle("standard deviation of PC1 (3x3))








