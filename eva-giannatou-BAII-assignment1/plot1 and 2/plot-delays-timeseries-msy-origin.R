setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data = read.csv(paste(getwd(),"/dataset/msy_data_wdate.csv",sep="") , header=T)

library(tidyr)
library(dplyr )
library(ggplot2) # Data visualization

#MSY data

### 1-  generate msy-plots-per-year.png plot

#Number of flights per year
year <-data %>% group_by(Year) %>% 
  tally %>% arrange(desc(n))

g <- ggplot(year, aes(x=Year, y=n))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
)
g <- g + xlab("Year")
g <- g + ylab("Number of Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)


### 2 - generate percent-msy-flights-per-year.png plot

# percent of flights per year

yearper <- year
yearper$n <- yearper$n/nrow(data)

g <- ggplot(yearper, aes(x=Year, y=n))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
)
g <- g + xlab("Year")
g <- g + ylab("Percent of Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)


### 3 - generate msy_avg_flight_delay.png plot

# average delay per year
summary(data)

#avg delay
depdel<-data %>%
  filter((DepDelay != 'NA') & DepDelay!=0) %>%
  group_by(Year) %>%
  summarize(DepDelay = mean(DepDelay)) %>%
  arrange(desc(DepDelay))


g <- ggplot(depdel, aes(x=Year, y=DepDelay))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
)
g <- g + xlab("Year")
g <- g + ylab("Average Flight Delay")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)

### 4 - generate msy-percent-delayed-flights.png plot

# percent of delayed flights

depdelperc<-data %>%
  filter((DepDelay != 'NA') & DepDelay!=0) %>%
  group_by(Year) %>%
  tally %>% arrange(desc(n))

depdelperc$n <- depdelperc$n/year$n


g <- ggplot(depdelperc, aes(x=Year, y=n))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
)
g <- g + xlab("Year")
g <- g + ylab("Percent of Delayed Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)


### 5 - generate number of flights per quarter.png plot

# plot timeseries - date instead of year


#Number of flights per year/month
library(zoo)
data$Date <- as.yearmon(paste(data$Year, data$Month), "%Y %m")

date <-data %>% group_by(Date) %>% 
  tally %>% arrange(desc(n))


# to year qarters
date$Date<-as.yearqtr(date$Date)

g <- ggplot(date, aes(x=Date, y=n))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
) + scale_x_yearqtr(format="%YQ%q", n=16) + geom_point(  colour = "purple",
                                                        linetype = 1,
                                                        size = 2)+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
g <- g + xlab("Year - Quarter")
g <- g + ylab("Number of Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)


### 6 - generate percent delayed flights per quarter.png plot

# plot timeseries - date instead of year


# percentage of delayed flights per year/month
date <-data %>% group_by(Date) %>% 
  tally %>% arrange(desc(n))

depdelperc<-data %>%
  filter((DepDelay != 'NA') & DepDelay!=0) %>%
  group_by(Date) %>%
  tally %>% arrange(desc(n))

depdelperc$n <- depdelperc$n/date$n


# to year qarters
depdelperc$Date<-as.yearqtr(depdelperc$Date)

g <- ggplot(depdelperc, aes(x=Date, y=n))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
) + scale_x_yearqtr(format="%YQ%q", n=16) + geom_point(  colour = "purple",
                                                         linetype = 1,
                                                         size = 2)+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
g <- g + xlab("Year - Quarter")
g <- g + ylab("Percent of Delayed Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)



### 7 - generate msy-cancelled-flights.png plot

#percent of cancelled flights per year

#Number of flights per year

canc<-data %>%
  filter(Cancelled!=0) %>%
  group_by(Year) %>%
  summarize(Cancelled = sum(Cancelled)) %>%
  arrange(desc(Cancelled))


# to year qarters


g <- ggplot(canc, aes(x=Year, y=Cancelled))
g <- g + geom_line(
  colour = "magenta",
  linetype = 1,
  size = 0.8
) +  geom_point(  colour = "purple",
                                                         linetype = 1,
                                                         size = 2)+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
g <- g + xlab("Year ")
g <- g + ylab("Number of Cancelled Flights")
g <- g + ggtitle("Flights Departing From MSY")
plot(g)



