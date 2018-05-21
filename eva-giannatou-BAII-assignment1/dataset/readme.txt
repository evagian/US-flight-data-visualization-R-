# Place flight data in this folder


# go to http://stat-computing.org/dataexpo/2009/the-data.html

# and download data from 2004 to 2007
# we need the following files

# 2004.csv

# 2005.csv

# 2006.cav

# 2007.csv



# Assignment description 
# The committee plans to hire you as the director of

# New Orleans Airport (MSY,"New Orleans International "). 


# We are in 2008, so they need to show that the

# current director is not a good one and the airport at 2006-2007 period performed worst than the past (i.e. 2004-2005),

# so they need to fire him. Help them to take the position.



# 5 slides + opening slide

# To be more convincing you need to compare for example with other airports etc.


# weather delay vs non weather delay per month
# flight delay by cause

# delay - weather volume equipment closed runway other


# The Taxi-out time is defined as the time spent by a flight between its actual off-block time (AOBT) 

# and actual take-off time (ATOT)
# actual off-block time: The time the aircraft pushes back / vacates the parking position.

# actual take-off time : The time that an aircraft takes off from the runway

 


#Dataset columns

#Name	Description

#1	Year	1987-2008

#2	Month	1-12

#3	DayofMonth	1-31

#4	DayOfWeek	1 (Monday) - 7 (Sunday)


#5	DepTime	actual departure time (local, hhmm)

#6	CRSDepTime	scheduled departure time (local, hhmm)


#7	ArrTime	actual arrival time (local, hhmm)

#8	CRSArrTime	scheduled arrival time (local, hhmm)


#9	UniqueCarrier	unique carrier code

#10	FlightNum	flight number

#11	TailNum	plane tail number

#12	ActualElapsedTime	in minutes

#13	CRSElapsedTime	in minutes

#14	AirTime	in minutes

###15	ArrDelay	arrival delay, in minutes

#Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.

####
###16	DepDelay	departure delay, in minutes
#Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.
###17	Origin	origin IATA airport code

###18	Dest	destination IATA airport code


#19	Distance	in miles


###20	TaxiIn	taxi in time, in minutes

###21	TaxiOut	taxi out time in minutes

###22	Cancelled	was the flight cancelled?


###23	CancellationCode	reason for cancellation (A = carrier, B = weather, C = NAS, D = security)

###24	Diverted	1 = yes, 0 = no


###25	CarrierDelay	in minutes

###26	WeatherDelay	in minutes

###27	NASDelay	in minutes

###28	SecurityDelay	in minutes

###29	LateAircraftDelay	in minutes
