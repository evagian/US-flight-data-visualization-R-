
setwd("<local-path>/eva-giannatou-BAII-assignment1/")

# airports data contains the coordinates of the airports' locations
# this dataset will be used to place the flight data on the map
data = read.csv(paste(getwd(),"/dataset/dataSample.csv",sep="") , header=T)
airports = read.csv(paste(getwd(),"/dataset/airports.csv",sep="") , header=T)

str(airports)

####
library(tidyr)
library(dplyr )
library(ggplot2) # Data visualization

# Summarize flight data by year, carrier, origin and dest
#MSYdata <- data %>% filter((UniqueCarrier== 'AA'))


flights_aa <-data %>% group_by(Year, Origin) %>% 
  tally %>% arrange(desc(n))

flights_aa7  <- subset(flights_aa, Year=="2007") 

flights_aa6 <- subset(flights_aa, Year=="2006") 
flights_aa5 <- subset(flights_aa, Year=="2005") 
flights_aa4 <- subset(flights_aa, Year=="2004") 

newdata7 = merge(flights_aa7, airports[, c("iata","lat", "long")], by.x="Origin", by.y="iata")
newdata6 = merge(flights_aa6, airports[, c("iata","lat", "long")], by.x="Origin", by.y="iata")
newdata5 = merge(flights_aa5, airports[, c("iata","lat", "long")], by.x="Origin", by.y="iata")
newdata4 = merge(flights_aa4, airports[, c("iata","lat", "long")], by.x="Origin", by.y="iata")

total1 <- rbind(newdata7,newdata6)
total2 <- rbind(newdata5,newdata4)
data <- rbind(total1,total2)


write.csv(data,paste(getwd(),"/dataset/data4map.csv",sep=""),col.names=TRUE, na="",sep=",")
