

# keep all rows where Dest = MSY 
setwd("<local-path>/eva-giannatou-BAII-assignment1/")

data2007 = read.csv(paste(getwd(),"/dataset/2007.csv",sep="") , header=T)
data2006 = read.csv(paste(getwd(),"/dataset/2006.csv",sep="") , header=T)
data2005 = read.csv(paste(getwd(),"/dataset/2005.csv",sep="") , header=T)
data2004 = read.csv(paste(getwd(),"/dataset/2004.csv",sep="") , header=T)

# only keep rows where Dest=MSY
data2007 <- subset(data2007, Dest=="MSY") 
data2006 <- subset(data2006, Dest=="MSY") 
data2005 <- subset(data2005, Dest=="MSY") 
data2004 <- subset(data2004, Dest=="MSY") 
names(data2005)

total1 <- rbind(data2007,data2006)
total2 <- rbind(data2005,data2004)
data <- rbind(total1,total2)

# export MSY data
# Write CSV in R

write.csv(data,paste(getwd(),"/dataset/msy_dest.csv",sep="") ,col.names=TRUE, na="",sep=",")
