## Starting the tutorial by loading the packages 

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")
install.packages(x) # warning: uncommenting this may take a number of minutes
lapply(x, library, character.only = TRUE) # load the required packages

library(rgdal)
lnd <- readOGR(dsn = "data/london_sport.shp")
#The structure of spatial data in R
# Spatial objects like the `lnd` object are made up of a number of different *slots*, the key *slots* being `@data` (non geographic *attribute data*) and `@polygons` (or `@lines` for line data). The data *slot* can be thought of as an attribute table and the geometry *slot* is the polygons that make up the physcial boundaries. Specific *slots* are accessed using the `@` symbol. Let's now analyse the sport object with some basic commands:
head(lnd)

head(lnd@data, n = 2)

# check the classes of all variables 

sapply(lnd@data, class)

# everything is characters, execpt partic_per this needs to be changed 

lnd$Pop_2001 <- as.numeric(as.character(lnd$Pop_2001))

plot(lnd) 
#subset a section and plot 
sel <- lnd$Partic_Per > 20 & lnd$Partic_Per < 25
plot(lnd[sel, ]) # output not shown here
#explore how it looks 
head(sel)
## add context
plot(lnd, col = "lightgrey") # plot the london_sport object
sel <- lnd$Partic_Per > 25
plot(lnd[ sel, ], col = "blue", add = TRUE) # add selected zones to map
