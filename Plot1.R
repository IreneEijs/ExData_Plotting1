##examine how household energy usage varies over the first 2 days in February, 2007
##using the UCO dataset "electric power consumption. write code to read the data and
##create 4 specific graphs in PNG.

##read the file and isolate the relevant subset
fulldata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";" )
data <- fulldata [(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007" ), ]

##create plot1.png including graphic device call
dev.copy(png, file="plot1.png", height=480, width=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red" )
par(oma=c(0,0,2,2))
dev.off()
