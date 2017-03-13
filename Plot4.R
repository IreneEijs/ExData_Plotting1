##read the file and isolate the relevant subset
fulldata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )
data <- fulldata [(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007" ), ]

##convert Date and Time vars into one POSIXct time variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
combidatetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(combidatetime)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

##create plot4.png: combine 2 previous graphs with 2 new ones in a 2x2grid
dev.copy(png, file="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0)) ## standard 2x2 grid without main title
with(data, {
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex=0.75)
  plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="", cex=0.75)
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex=0.75)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="", cex=0.75)
})
dev.off()