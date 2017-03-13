##read the file and isolate the relevant subset
fulldata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )
data <- fulldata [(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007" ), ]

##convert Date and Time vars into one POSIXct time variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
combidatetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(combidatetime)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

##create plot3.png: add more lines and a legend with color (lty)
dev.copy(png, file="plot3.png", height=480, width=480)
with(data, {
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)
dev.off()

