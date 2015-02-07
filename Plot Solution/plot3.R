library(rJava)
library(data.table)
# Pre requisitive : Set working directory where you will find the input data in text format
# using setwd("<directory name>")
vars <- c("character", "character", rep("numeric", 7))
household_power <- fread("household_power_consumption.txt", sep=";",
                         header=TRUE
                         ,colClasses="vars"
                         ,na.strings="?")
#Subset and extract only 1/2 and 2/2 dates specific data 

powernew <-subset(household_power
                  ,household_power$Date == "1/2/2007" | household_power$Date =="2/2/2007" )

dateTime  <- as.POSIXlt(paste(as.Date(powernew$Date,format="%d/%m/%Y"), powernew$Time, sep=" "))

# Initialize to PNG file 
png("plot3.png",width=6,height=6,units="in",res=1200)
# Plot as a line  with X axis as Date Time and Y as Global active power

with(powernew, {
plot( dateTime
      ,as.numeric(powernew$Sub_metering_1)
      ,ylab="Energy Sub metering"
      ,xlab=""
      ,type="l"
      ,col="black"
)
lines( dateTime
      ,as.numeric(powernew$Sub_metering_2)
      ,col="red"
)
lines( dateTime
      ,as.numeric(powernew$Sub_metering_3)
      ,col="blue"
)
}
)
dev.off() #device off
