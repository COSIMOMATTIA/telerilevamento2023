library(raster)
install.packages("ggplot2")
library(ggplot2) #per i grafici
setwd("C:/lab/")
defor1 <- brick("defor1_.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
defor2 <- brick("defor2_.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

singlenr1 <- getValues(defor1)
singlenr1
kcluster1 <- kmeans(singlenr1, centers = 2)
kcluster1 
defor1class <- setValues(defor1[[1]], kcluster1$cluster)
plot(defor1class)

#class1 = forest
#class2 = bar soil

singlenr2 <- getValues(defor2)
singlenr2
kcluster2 <- kmeans(singlenr2, centers = 2)
kcluster2
defor2class <- setValues(defor2[[1]], kcluster2$cluster) 
plot(defor2class)

#class1: forest
#class2:bare soil 

par(mfrow=c(2,1))
plot(defor1class)
plot(defor2class)

install.packages("patchwork")
library(patchwork) # for multiframe ggplot plotting


#class percentages

frequencies1 <- freq(defor1class)
frequencies1
defor1class
tot1 <- ncell(defor1class)
tot1
percentages1 <- frequencies1 * 100 / tot1
percentages1 
# 2006
frequencies2 <- freq(defor2class)
frequencies2
defor1class
tot2 <- ncell(defor2class)
tot2
percentages2 <- frequencies2 * 100 / tot2
percentages2
# tabella 
cover <- c("Forest", "Bare soil")
percent1992 <- c(89.75, 10.25)
percent2006 <- c(52.07, 47.93)

percentages <- data.frame(cover,percent1992,percent2006)
percentages


ggplot(percentages, aes(x=cover,y= percent1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent1992, color=cover)) + geom_bar(stat="identity", fill="white") + ggtitle("Year 1992") + ylim(c(0,100))

p2 <- ggplot(percentages, aes(x=cover, y=percent2006, color=cover)) + geom_bar(stat="identity", fill="white") + ggtitle("Year 2006") + ylim(c(0,100))

p1+p2
