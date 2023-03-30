# R code for importing and analysing several 
library(raster)
setwd ("C:/lab/greenland")
lst_2000 <- raster("lst_2000.tif")
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

ls()

rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist, raster)
