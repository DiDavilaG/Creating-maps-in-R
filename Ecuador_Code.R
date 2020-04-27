#Using the tutorial to plot Ecuador maps 
x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", "maps","sf", "sp","tidyverse", "ggplot2" )
#install.packages(x) # warning: uncommenting this may take a number of minutes
lapply(x, library, character.only = TRUE) # load the required packages





dfrecent<- readOGR(dsn="data/ecu_adm_inec_20190724_shp/ecu_admbnda_adm1_inec_20190724.shp")


ECpr <- readOGR(dsn = "data/ECU_adm/ECU_adm1.shp")
ECPRPK<- merge(ECpr, PK_PREF2000, by = "ID_1")
names(ECPRPK)

#see data 

head(dfrecent)

head(dfrecent@data, n=2)

#check the class of data 
sapply(dfrecent@data, class)
#PLOT COUNTRY 
plot (dfrecent)

#Show a row from the data section 
ECPRPK@data[ECPRPK$NAME_1 == "Azuay", ]
# merge files with attributes 
# import file first csv with same colum name 
PREFECTOSPKMAP<- merge(dfrecent, PK_PREF2000, by= "ADM1_PCODE")

#subset the spatial section using attributes 
ECCONT<- subset (PREFECTOSPKMAP, CONTINENT == "yes")
IND20 <- PREFECTOSPKMAP$IND_PER > 20 & PREFECTOSPK$IND_PER < 100
EL2000<- ECCONT$PREFECTS_PK2000 == "yes"

plot(PREFECTOSPKMAP[ECCONT,])
plot(PREFECTOSPKMAP[EL2000,])


# subset with context  - takes a long time. 
plot(ECCONT)
plot(ECCONT[EL2000,], col = "lightgrey", add = TRUE) # add selected zones to map

