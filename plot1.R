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

## Plot 1 - Histogram of Global Active Power (kilowatts)
png(filename = "plot1.png")
hist(glbp, xlab="Global Active Power(kilowatts)", col='red', main = "Global Active Power")
dev.off()
