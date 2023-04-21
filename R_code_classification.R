# classification of remote sensing data via RStoolsbox
#
install.packages("devtools")
library(devtools)

install_github("bleutner/RStoolbox")
library(RStoolbox)

library(raster)
setwd("C:/lab/")

so <- brick ("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1,2,3, stretch="Hist")
so
singlenr <- getValues(so)
kcluster <- kmeans(singlenr, centers = 3)
kcluster
soclass <- setValues(so[[1]], kcluster$cluster)
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)
frequencies <- freq(soclass)
frequencies
tot = 2221440
percentages = frequencies * 100 /  tot    
percentages

library(raster)
setwd("C:/lab/")

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc
plotRGB(gc, 1,2,3, stretch="Lin")
gcc <- crop(gc, drawExtent())
plotRGB(gcc, 1,2,3, stretch="Lin")
ncell(gcc)
singlenr <- getValues(gcc)
singlenr
kcluster <- kmeans(singlenr, centers=3)  
kcluster
gcclass <- setValues(gcc[[1]], kcluster$cluster)
plot(gcclass)
frequencies <- freq(gcclass)
frequencies
total=ncell (gcclass)
total
percentages = frequencies * 100 /  total    
percentages

install.packages("ggplot2")


