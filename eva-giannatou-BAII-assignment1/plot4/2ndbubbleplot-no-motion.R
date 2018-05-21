#install.packages("googleVis")
library(googleVis)
setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data <- read.csv(paste(getwd(),"/dataset/dataBubbles.csv",sep="") , header=T)

bad<-head(arrange(data,desc(avgDelayTime)), n = 200)
good<-head(arrange(data,-desc(avgDelayTime)), n = 200)
our <- subset(data, Origin=="MSY") 

newdata1 <- rbind(bad,good)
newdata <- rbind(newdata1,our)

newdata4 <- subset(newdata, Year==2004) 
newdata5 <- subset(newdata, Year==2005) 
newdata6 <- subset(newdata, Year==2006) 
newdata7 <- subset(newdata, Year==2007) 

names(newdata)


library(plyr)



Bubble <- gvisBubbleChart(newdata, idvar="Origin",  
                          xvar="avgDelayTime", yvar="percentDelayedFlights",
                          colorvar="Origin2", sizevar="percentTotalFlights", 
                          

                          options=list(  min=0, max=40,width=600, height=600, chartArea.height=600,chartArea.width=600,
                                        enableInteractivity=TRUE,
                                        
                                        hAxis.baseline=0, hAxis.maxValue=20, hAxis.viewWindowMode='pretty',
                                        sizeAxis.maxValue=20,sizeAxis.minValue=0, sizeAxis.minSize=0,sizeAxis.minSize=20,
                                        vAxis.baseline=0,vAxis.maxValue=20, vAxis.minValue=0, vAxis.viewWindowMode='pretty'

                                        
                                        
                                        
                                        
                          ))

plot(Bubble)
