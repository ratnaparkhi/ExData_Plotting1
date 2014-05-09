## EDA Assignment 1 [Author: Prashant Ratnaparkhi]
## 
setwd("d:\\prashant\\coursera-dsc\\eda\\a1")
pd <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
# Get only required subset of data. 
pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")
pd1 <- pd[(pd$Date == "2007-02-01") | (pd$Date == "2007-02-02"), ]
# Arrange the required data for plots in proper format.
dateTime = strptime(paste(pd1$Date, pd1$Time), format='%Y-%m-%d %H:%M:%S')
glbp <- as.numeric(type.convert(as.character(pd1$Global_active_power), dec="."))
volt <- as.numeric(type.convert(as.character(pd1$Voltage), dec="."))
glbpReactive <- as.numeric(type.convert(as.character(pd1$Global_reactive_power), dec="."))
subMetering1 <- as.numeric(type.convert(as.character(pd1$Sub_metering_1), dec="."))
subMetering2 <- as.numeric(type.convert(as.character(pd1$Sub_metering_2), dec="."))
subMetering3 <- as.numeric(type.convert(as.character(pd1$Sub_metering_3), dec="."))
## The above code is same in all the R files of assignment 1.

## Plot 4 - Plot four plots row-wise. 
png(filename = "plot4.png")
par(mfrow = c(2,2))
## Plot 4.1 - DateTime and Global Active Power
plot(dateTime, glbp, type = "l", xlab = "", ylab = "Global Active Power")
## Plot 4.2 - DateTime and Voltage
plot(dateTime, volt, type = "l", xlab = "datetime", ylab = "Voltage")
## Plot 4.3 - DateTime and Energy sub metering
with(pd1, plot(dateTime, Sub_metering_1, ylim=c(0,40), xlab="", ylab="Energy sub metering",type = "n"))
with(pd1, lines(dateTime, subMetering1, col = "black"))
with(pd1, lines(dateTime, subMetering2, col = "red"))
with(pd1, lines(dateTime, subMetering3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Plot 4.4 - DateTime and Global reactive power
plot(dateTime, glbpReactive, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()