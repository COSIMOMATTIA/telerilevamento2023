# R code for importing and analysing several 
library(raster)
setwd ("C:/lab/greenland")
lst_2000 <- raster("lst_2000.tif")
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

ls()

rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist, raster)
import
TGr <- stack(import)
TGr
plot (TGr)

plotRGB(TGr,r=1, g=2, b=3, stretch=Lin)
plotRGB(TGr, 2, 3, 4, stretch="Lin")
#differenza
dift <- TGr[[2]] - TGr[[1]]
plot(dift)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)
#esercizio EN
library(raster)
setwd ("C:/lab/EN")
# importo primo file
EN_first <- raster("EN_0001.png")
EN_first
cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(EN_first, col=cl)

rlist <- list.files(pattern="EN")
rlist
import <- lapply(rlist, raster)   #per importare più file 
import
EN <- stack(import)
EN
plot(EN, col=cl)
par(mfrow=c(1,2)) #mettere immagini l'una a fianco all'altra
plot(EN_first, col=cl)
plot(EN[[1]], col=cl)
# controllo
difcheck <- EN_first - EN[[1]]
difcheck
plot(difcheck)
#primo e ultimo

par(mfrow=c(1,2))
plot(EN[[1]], col=cl)
plot(EN[[13]], col=cl)

difen = EN[[1]] - EN[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difen, col=cldif)

plotRGB(EN, 1, 7, 13, stretch="lin")
plotRGB(EN, 1, 7, 13, stretch="hist")
