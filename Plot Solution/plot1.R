#Plot 1 to help us analyse  how household energy usage
#varies over a 2-day period in February, 2007. 


library(rJava)
library(data.table)
# Pre requisitive : Set working directory where you will find the input data in text format
# using setwd("<directory name>")

household_power <- fread("household_power_consumption.txt"
                         , sep=";"
                         , header=TRUE
                         ,colClasses="character")
#Subset and extract only 1/2 and 2/2 dates specific data 

powernew <-subset(household_power
                  , household_power$Date == "1/2/2007" | household_power$Date =="2/2/2007" )

# Initialize to PNG file 
png("plot1.png",width=6,height=6,units="in",res=1200)

# Histogram with X axis as Global active power
# col as red color

hist(as.numeric(powernew$Global_active_power)
     ,col="red"
     ,main="Global active power"
     ,xlab="Global active power(kilowatts)"
     ,)
dev.off() #device off

#Histogram for Global Active power created