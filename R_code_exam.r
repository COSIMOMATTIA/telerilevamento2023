#Hello this is my R project; I want to show you the loss of vegetation after a major forest fire happened in 2017 in Naples in the area of Vesuvio volcan.
#First things first we set R packages and working directory 
library(raster)
library(ggplot2)
library(viridis)
library(patchwork)
setwd("C:/lab/esame") 
#Importing and plotting the sentinel 2 bands B8, B4, B3, B2 
v16 <- list.files(pattern="B0_")
import16 <- lapply(v16, raster)
ves16 <- stack(import16)
ves16
plot(ves16)
#Display the combination of RGB bands in natural colors for 2016 before the event 
plotRGB(ves16, 3, 2, 1, stretch="lin") 
dev.off()

#Importing and plotting the sentinel 2 bands B8, B4, B3, B2
v17<- list.files(pattern="post")
import17 <- lapply(v17, raster)
ves17 <- stack(import17)
ves17
plot(ves17)
#Display the combination of RGB bands in natural colors for 2017 after the event
plotRGB(ves17, 3, 2, 1, stretch="lin") 
dev.off()

#For comparison we can import and plot an image of the Vesuvio volcan after six years (2023)
 v23 <- list.files(pattern="_23")
import23 <- lapply(v23, raster)
ves23 <- stack(import23)
ves23
plot(ves23)
plotRGB(ves23, 3, 2, 1, stretch="lin") 
dev.off()
#Plot images altogether
par(mfrow=c(1,3))
plotRGB(ves16, 3, 2, 1, stretch="lin")
plotRGB(ves17, 3, 2, 1, stretch="lin")
plotRGB(ves23, 3, 2, 1, stretch="lin")

#To display the difference between vegetated areas and bare soil we plot the bands combination B8, B4, B3 (vnir, red, green) for all the years 

plotRGB(ves16, 4, 3, 2, stretch="lin")
plotRGB(ves17, 4, 3, 2, stretch="lin")
plotRGB(ves23, 4, 3, 2, stretch="lin")
dev.off()

#Let’s save the images 
jpeg("vesuvio2016.JPG", 900, 450)
plotRGB(ves16, 4, 3, 2, stretch="lin")
dev.off()
jpeg("vesuvio2017.JPG", 900, 450)
plotRGB(ves17, 4, 3, 2, stretch="lin")
dev.off()
jpeg("vesuvio2023.JPG", 900, 450)
plotRGB(ves23, 4, 3, 2, stretch="lin")
dev.off()

#Using vegetation index DVI to separate vegetated areas from bare soil 
#2016
dvi2016 = ves16[[4]] - ves16[[3]]      
dvi2016
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot (dvi2016, col=cl) 
#2017
dvi2017 = ves17[[4]] - ves17[[3]]      
dvi2017
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot (dvi2017, col=cl)
#2023
dvi2023 = ves23[[4]] - ves23[[3]]      
dvi2023
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot (dvi2023, col=cl)
#The areas that have lost vegetation will be displayed in darker colors  
par(mfrow=c(1,3))
plot(dvi2016, col=cl)	
plot(dvi2017, col=cl)
plot(dvi2023, col=cl)
#Normalized difference vegetation index NDVI for 2016-2017-2023 to obtain values from -1 to +1 in order to quantify vegetation loss and health
ndvi2016 = dvi2016 / (ves16[[4]] + ves16 [[3]])
plot(ndvi2016)
ndvi2017 = dvi2017 / (ves17[[4]] + ves17 [[3]])
plot(ndvi2017)
ndvi2023 = dvi2023 / (ves23[[4]] + ves23 [[3]])
plot(ndvi2023)

#Lighter areas represent higher values of NDVI >0.5
par(mfrow=c(1,3))
plot(ndvi2016, col=cl)	
plot(ndvi2017, col=cl)
plot(ndvi2023, col=cl)
# save the plots 
#2016
jpeg("ndvi2016.JPG", 900, 450)
plot(ndvi2016, col=cl)
dev.off()
#2017
jpeg("ndvi2017.JPG", 900, 450)
plot(ndvi2017, col=cl)
dev.off()
#2023
jpeg("ndvi2023.JPG", 900, 450)
plot(ndvi2023, col=cl)
dev.off()
#DVI difference between 2016/2017 and 2023/2017 
difdvi = dvi2016 - dvi2017
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)
difdvi = dvi2023 - dvi2017
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)

#NBR NORMALIZE BURN RATIO
#NBR = (Band 5 – Band 7) / (Band 5 + Band 7).
#The Normalized Burn Ratio (NBR) is an index designed to highlight burnt areas in large fire zones. The formula is similar to NDVI, except that the formula combines the use of both near infrared (NIR) and shortwave infrared (SWIR) wavelengths.

B05<-brick("B05.TIF") 
B07<-brick("B07.TIF") 
nbr2016<-(B05-B07)/( B05+B07) 
cl <- colorRampPalette(c('black','purple','darkblue','red','orange','yellow','green'))(100)
jpeg("nbr2016.jpg", 800, 800)
plot(nbr2016, col=cl, main="NBR2016") 
dev.off()

B05po<-brick("B05po.TIF") 
B07po<-brick("B07po.TIF") 
nbr2017<-(B05po-B07po)/( B05po+B07po) 
cl <- colorRampPalette(c('black','purple','darkblue','red','orange','yellow','green'))(100)
jpeg("nbr2017.jpg", 800, 800)
plot(nbr2017, col=cl, main="NBR2017")
dev.off()
