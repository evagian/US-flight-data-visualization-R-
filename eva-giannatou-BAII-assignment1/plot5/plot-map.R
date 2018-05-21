
setwd("<local-path>/eva-giannatou-BAII-assignment1/")

setwd('/media/eva/store/Eva/Documents/master/semester 6/BA practicum II/1st assignment/eva-giannatou-BAII-assignment1/')
flights_aa= read.csv(paste(getwd(),"/dataset/dataBubbles.csv",sep="") , header=T)
airports = read.csv(paste(getwd(),"/dataset/airports.csv",sep="") , header=T)

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
data$Origin2[data$Origin2 == 'Other'] = ''


library(plotly)

# plot 2004-2005
#packageVersion('plotly')
data4 <- subset(data, Year<=2005) 
data4$q <- with(data4, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data4$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data4$q <- as.ordered(data4$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data4, locationmode = 'USA-states', sizes = c(1, 100)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%
  
  layout(title = '2004-2005: Percentage of delayed flights per airport', geo = g)


p


# plot 2006-2007
#packageVersion('plotly')
data4 <- subset(data, Year>=2006) 
data4$q <- with(data4, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data4$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data4$q <- as.ordered(data4$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data4, locationmode = 'USA-states', sizes = c(1, 100)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%
  
  layout(title = '2004-2005: Percentage of delayed flights per airport', geo = g)


p



#####################3
# Plot 2004
#packageVersion('plotly')
data4 <- subset(data, Year==2004) 
data4$q <- with(data4, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data4$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data4$q <- as.ordered(data4$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data4, locationmode = 'USA-states', sizes = c(1, 100)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%

  layout(title = '2004 Percentage of delayed flights per airport', geo = g)


p


# Plot 2005
#packageVersion('plotly')
data5 <- subset(data, Year==2005) 
data5$q <- with(data5, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data5$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data5$q <- as.ordered(data5$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data5, locationmode = 'USA-states', sizes = c(1, 100)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%
  
  layout(title = '2005 Percentage of delayed flights per airport', geo = g)


p

# Plot 2006
#packageVersion('plotly')
data6 <- subset(data, Year==2006) 
data6$q <- with(data6, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data6$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data6$q <- as.ordered(data6$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data6, locationmode = 'USA-states', sizes = c(1, 100)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%
  
  layout(title = '2006 Percentage of delayed flights per airport', geo = g)


p

# Plot 2007
#packageVersion('plotly')
data7 <- subset(data, Year==2007) 
data7$q <- with(data7, cut(percentDelayedFlights, quantile(percentDelayedFlights)))
levels(data7$q) <- paste(c("Few Delayed Flights: 1st", "Below Average Delayed Flights: 2nd", "Above Average Delayed Flights: 3rd", "Many Delayed Flights: 4th", "Many Delayed Flights: 5th"), "Quantile")
data7$q <- as.ordered(data7$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(data7, locationmode = 'USA-states', sizes = c(1, 80)) %>%
  add_markers(
    x = ~long, y = ~lat, size = ~percentDelayedFlights, color = ~q, 
    text = ~Origin2, textfont = t
  ) %>%
  
  layout(title = '2007 Percentage of delayed flights per airport', geo = g)


p

