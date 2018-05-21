
setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data = read.csv(paste(getwd(),"/dataset/dataSample.csv",sep="") , header=T)

# 
# # data aggregation
# # in this file we will calculate the following columns for every airport (Origin=airport name)
# # A. % of total flights for all airports (number of flights per airport need to be calculated as well), 
# # B. % of delayed flights per airport which is (number of delayed flights)/(number of total flights for this airport)
# # C. avg delay time per airport
# 
# ##1
str(data)

library(dplyr)
# # avg delay time per year per airport
avgDelayTime<-data %>%
  filter((DepDelay != 'NA') & DepDelay!=0) %>%
  group_by(Year, Origin) %>%
  summarize(DepDelay = mean(DepDelay)) %>%
  arrange(desc(DepDelay))
# ###############
# 
# ##2
# #calculate % of total flights (number of flights)
# # count flights per year per airport
flightNo<-data %>%
  group_by(Year, Origin) %>%
  tally %>% arrange(desc(n))
# 
# divide (number of airport's flights)/(number of total flights in the whole dataset)
flightNo$n <- flightNo$n/nrow(data)
# 
# 
# ##3
# # percent of delayed flights
# # percent of total flights
# 
# str(data)
# # count flights per year and per airport
fltNo<-data %>%
  group_by(Year, Origin) %>%
  tally %>% arrange(desc(n))
# 
# #count delayed flights per year and per airport
delayedFlightNo<-data %>%
  filter((DepDelay != 'NA') & DepDelay!=0) %>%
  group_by(Year, Origin) %>%
  tally %>% arrange(desc(n))
# 
# 
delayedFlightNo<-as.data.frame(delayedFlightNo)
flNo<-as.data.frame(fltNo)
# names(delayedFlightNo)
# names(fltNo)
# 
perDelFlights <- merge(delayedFlightNo, fltNo, by=c("Year","Origin"))
# 
# # for each airport calculate (number of delayed flights)/(total number of flights from this airport)
perDelFlights$percentDelayedFlights <- perDelFlights$n.x /perDelFlights$n.y
# 
# 
# #create a new dataframe with all the aggregated columns 
fdata1 <- merge(perDelFlights, flightNo, by=c("Year","Origin"))
fdata2 <- merge(fdata1, avgDelayTime, by=c("Year","Origin"))
myvars <- names(fdata2) %in% c("n.x","n.y") 
fdata <- fdata2[!myvars]
# 
colnames(fdata)[colnames(fdata)=="n"] <- "percentTotalFlights"
colnames(fdata)[colnames(fdata)=="DepDelay"] <- "avgDelayTime"
# 
# create a new column (this column will be useful when visualizing the airports)
# we will use 1 color for all the airports except from MSY which will have another color
fdata$Origin2[fdata$Origin == 'MSY'] = 'MSY'
fdata$Origin2[fdata$Origin != 'MSY'] = 'Other'

# preview of aggregated dataframe
# str(fdata)
# 'data.frame':	1151 obs. of  6 variables:
#   $ Year                 : int  2004 2004 2004 2004 2004 2004 2004 2004 2004 2004 ...
# $ Origin               : Factor w/ 314 levels "ABE","ABI","ABQ",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ percentDelayedFlights: num  0.855 0.851 0.567 0.63 0.833 ...
# $ percentTotalFlights  : num  0.000218 0.000104 0.001337 0.000046 0.000009 ...
# $ avgDelayTime         : num  6.69 2.44 13.53 11.22 31.8 ...
# $ Origin2              : chr  "Other" "Other" "Other" "Other" ...

write.csv(fdata, paste(getwd(),"/dataset/dataBubbles.csv",sep=""),col.names=TRUE, na="",sep=",")

write.csv(fdata, paste(getwd(),"/plot1/dataBubbles.csv",sep=""),col.names=TRUE, na="",sep=",")
