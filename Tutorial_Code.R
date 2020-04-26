## Starting the tutorial by loading the packages 

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")
# install.packages(x) # warning: uncommenting this may take a number of minutes
lapply(x, library, character.only = TRUE) # load the required packages

library(rgdal)
lnd <- readOGR(dsn = "data/london_sport.shp")
