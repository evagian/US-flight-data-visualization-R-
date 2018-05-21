

# add date column to msy data
# this file will be used to plot timeseries
setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data = read.csv(paste(getwd(),"/dataset/msy_origin.csv",sep="") , header=T)

summary(data)

# na when flight was cancelled

#Categorize 'origin' as a factor and display its resulting levels.
data$Origin = as.factor(data$Origin)
levels(data$Origin)

#Categorize 'dest' as a factor and display its resulting levels.
data$Dest = as.factor(data$Dest)
levels(data$Dest)

data <- subset(data, select=-c(X))

str(data)
# create a date column 
library(zoo)
data$Date <- as.yearmon(paste(data$Year, data$Month), "%Y %m")

write.csv(data,paste(getwd(),"/dataset/msy_data_wdate.csv",sep="") ,col.names=TRUE, na="",sep=",")
