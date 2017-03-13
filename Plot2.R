##read the file and isolate the relevant subset
fulldata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )
data <- fulldata [(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007" ), ]

##convert Date and Time vars into one POSIXct time variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
combidatetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(combidatetime)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

##create plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
plot(data$Global_active_power ~ data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
