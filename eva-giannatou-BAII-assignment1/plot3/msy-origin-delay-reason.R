
# replace <local-path> with the parent directory of 'eva-giannatou-BAII-assignment1' folder
setwd("<local-path>/eva-giannatou-BAII-assignment1/")
data = read.csv(paste(getwd(),"/dataset/msy_data_wdate.csv",sep="") , header=T)


####
library(tidyr)
library(dplyr )
library(ggplot2) # Data visualization

## 1 - create msy-delay-time-reson-of-delay.png plot 

# msy flights reason of delay

names(data)
data %>%   filter(CarrierDelay != 'NA',WeatherDelay != 'NA',
                  NASDelay != 'NA', SecurityDelay != 'NA', LateAircraftDelay != 'NA') %>% 
  select(CarrierDelay,WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay) %>% 
  summarize(CarrierDelay = mean(CarrierDelay),
            WeatherDelay = mean(WeatherDelay),
            SecurityDelay = mean(SecurityDelay),
            LateAircraftDelay = mean(LateAircraftDelay)) %>%
  gather(var,mean)

# var       mean
# 1      CarrierDelay 1.83642025
# 2      WeatherDelay 0.35442590
# 3     SecurityDelay 0.01860852
# 4 LateAircraftDelay 4.44173804

#groupby year
# all flights
delayreas<- data %>%   filter(CarrierDelay != 'NA',WeatherDelay != 'NA',
                              NASDelay != 'NA', SecurityDelay != 'NA', LateAircraftDelay != 'NA') %>% 
  select(Year,CarrierDelay,WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay) %>% group_by(Year) %>%
  summarize(CarrierDelay = mean(CarrierDelay),
            WeatherDelay = mean(WeatherDelay),
            SecurityDelay = mean(SecurityDelay),
            LateAircraftDelay = mean(LateAircraftDelay)) %>%
  gather(var,mean)

delayreas<- delayreas[5:20,,drop=F]

ye = c(2004,2005,2006,2007,2004,2005,2006,2007,2004,2005,2006,2007,2004,2005,2006,2007)
df = data.frame(ye,delayreas$var, delayreas$mean) 



ggplot(df, aes(x=interaction(ye), y=delayreas.mean, fill=delayreas.var)) +   
  geom_bar(position='stack', stat='identity') + xlab("Year") + ylab("Mean Time of Delay (minutes)") + ggtitle("Flights Departing From MSY")+ scale_fill_discrete(name = "Reason of Delay")


