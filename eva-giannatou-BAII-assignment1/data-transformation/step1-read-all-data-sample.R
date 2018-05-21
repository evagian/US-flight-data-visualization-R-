
# replace <local-path> with the parent directory of 'eva-giannatou-BAII-assignment1' folder
setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data2007 = read.csv(paste(getwd(),"/dataset/2007.csv",sep="") , header=T)
data2006 = read.csv(paste(getwd(),"/dataset/2006.csv",sep="") , header=T)
data2005 = read.csv(paste(getwd(),"/dataset/2005.csv",sep="") , header=T)
data2004 = read.csv(paste(getwd(),"/dataset/2004.csv",sep="") , header=T)

# use a smaller data sample, so that the laptop will be able to handle it
# keep 500.000 randomly selected rows from each year
flight.index7 = sample(1:nrow(data2007),500000,replace=FALSE)
data7<-data2007[flight.index7,]

flight.index6 = sample(1:nrow(data2006),500000,replace=FALSE)
data6<-data2006[flight.index6,]

flight.index5 = sample(1:nrow(data2005),500000,replace=FALSE)
data5<-data2005[flight.index5,]

flight.index4 = sample(1:nrow(data2004),500000,replace=FALSE)
data4<-data2004[flight.index4,]

# merge the 4 files (2004, 2005, 2006, 2007) into 1
total1 <- rbind(data7,data6)
total2 <- rbind(data5,data4)
data <- rbind(total1,total2)
names(data)
str(data2007$Year)
summary(data)

# export sample
# Write CSV in R

write.csv(data,paste(getwd(),"/dataset/dataSample.csv",sep=""),col.names=TRUE, na="",sep=",")

