#Using the tutorial to plot Ecuador maps 

library(rgdal)
ECpa <- readOGR(dsn = "data/SHP/nxparroquias.shp")
# lnd <- readOGR(dsn = "data", layer = "london_sport")