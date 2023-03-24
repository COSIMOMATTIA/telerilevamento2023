# My first code in github 
# let's install raster package 
install.packages("raster")
library(raster)

library(raster)                               
setwd("C:/lab")              
getwd()
l2011<-brick("p224r63_2011_masked.grd")       #brick
plot(l2011)                                   
cl <- colorRampPalette(c("red","orange","yellow")) (100)    #3 colori base 
plot(l2011,col=cl)                          

# plotting one element
plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)                    #$ unisce
nir <- l2011 [[4]]                            
plot(nir, col=cl)

cl <- colorRampPalette(c("darkorchid","cyan","bisque","darkmagenta","cyan4")) (200)   
plot(l2011, col=cl)                                                                

plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)     

pdf("myfirstgraph.pdf")           
plot(l2011$B4_sre, col=cl)       
dev.off()                         #chiudere 

pdf("ciao.pdf")
plot(l2011$B4_sre, col=cl)
dev.off()                      

par(mfrow=c(2,1))                 
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col =cl)

par(mfrow=c(2,2)) 
clb <- colorRampPalette(c("blue","lightblue","blue4","blue2")) (100)
plot(l2011[[1]], col=clb)

clg <- colorRampPalette(c("chartreuse","chartreuse1","chartreuse2","chartreuse3")) (100)
plot(l2011[[2]], col=clg)

clr <- colorRampPalette(c("brown1","brown2","brown3","brown4")) (100)
plot(l2011[[3]], col=clr)

cln <- colorRampPalette(c("darkorchid","darkorchid1","darkorchid2","darkorchid3")) (100)
plot(l2011[[1]], col=cln)
> l2011 <- brick("p224r63_2011_masked.grd")
> l2011
> plot(l2011[[4]])
> 
> plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
> plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
> plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")
> plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")
> l1988 <- brick("p224r63_1988_masked.grd")
> plotRGB(l1988, r=3, g=2, b=1, stretch="Lin")
> plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")
> plotRGB(l1988, 4, 3, 2, stretch="Lin")
> par(mfrow=c(2,1))
> plotRGB(l1988, 4, 3, 2, stretch="Lin")
> plotRGB(l2011, 4, 3, 2, stretch="Lin")
> dev.off
> plotRGB(l1988, 4, 3, 2, stretch="Hist")
> par(mfrow=c(2,2))
> plotRGB(l1988, 4, 3, 2, stretch="Lin")
> plotRGB(l2011, 4, 3, 2, stretch="Lin")
> plotRGB(l1988, 4, 3, 2, stretch="Hist")
> plotRGB(l2011, 4, 3, 2, stretch="Hist")
