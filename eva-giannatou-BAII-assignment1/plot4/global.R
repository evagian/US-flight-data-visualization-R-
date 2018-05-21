
# replace the <local-path> with the local directort
#setwd("<local-path>/eva-giannatou-BAII-assignment1/")

data = read.csv(paste(getwd(),"/dataBubbles.csv",sep=""), header=T)

library(dplyr)
data <- subset(data, select=-c(X))

data$Origin <- as.factor(data$Origin)
data$Origin2<- as.character(data$Origin2)
data$Year<- as.numeric(data$Year)

# keep 300 best and 300 worst airports as far as avg delay time is concerned
bad<-head(arrange(data,desc(avgDelayTime)), n = 300)
good<-head(arrange(data,-desc(avgDelayTime)), n = 300)

our <- subset(data, Origin=="MSY") 

newdata1 <- rbind(bad,good)
data <- rbind(newdata1,our)


