#
# This file reads in the household power consumption dataset
# and creates the first plot for the [Exploratory Data Analysis - Coursproject 1]
# 
# Author: Ben Curvers
# Created on: 20150504
#

### Read/Transform data ###
setwd("C:/Users/BCurvers/Documents/R/ExploratoryDataAnalysis/proj1/ExData_Plotting1")
d = read.table("household_power_consumption.txt",
               header=TRUE,
                sep=";",
                col.names=c("Date","Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3" ),
                na.strings= "?"
              )
d1 = subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")
d1$Date <- strptime(paste(d1[,1], d1[,2]), "%d/%m/%Y %H:%M:%S")

 
### Some variables ###
GAP_lab= "Global Active Power (kilowatts)"
ES_lab= "Energy sub metering"
cstr = c("black", "#FF2500", "#0433FF")
DT_lab = "datetime"

## plot 1
png(file = "plot1.png", bg = "transparent")
hist(d1$Global_active_power,xlab= GAP_lab,main="Global Active Power",col=cstr[2])
dev.off()

## plot 2
png(file = "plot2.png", bg = "transparent")
plot(d1$Date,d1$Global_active_power,ylab=GAP_lab,type="n",xlab="")
lines(d1$Date,d1$Global_active_power)
dev.off()

## plot 3
png(file = "plot3.png", bg = "transparent")
plot(d1$Date,d1$Sub_metering_1,ylab=ES_lab,xlab="",type="n")
lines(d1$Date,d1$Sub_metering_1,col=cstr[1])
lines(d1$Date,d1$Sub_metering_2,col=cstr[2])
lines(d1$Date,d1$Sub_metering_3,col=cstr[3])
legend("topright",legend=ls(d1)[5:7],lty=c(1,1,1), col = cstr)
dev.off()

# plot 4
png(file = "plot4.png", bg = "transparent")
par(mfrow=c(2,2))

# plot 4.1
plot(d1$Date,d1$Global_active_power,ylab=GAP_lab,type="n",xlab="")
lines(d1$Date,d1$Global_active_power)

# plot 4.2
plot(d1$Date,d1$Voltage,ylab="Voltage",type="n",xlab=DT_lab)
lines(d1$Date,d1$Voltage)

# plot 4.3
plot(d1$Date,d1$Sub_metering_1,ylab=ES_lab,xlab="",type="n")
lines(d1$Date,d1$Sub_metering_1,col=cstr[1])
lines(d1$Date,d1$Sub_metering_2,col=cstr[2])
lines(d1$Date,d1$Sub_metering_3,col=cstr[3])
legend("topright",legend=ls(d1)[5:7],lty=c(1,1,1), col = cstr)

# plot 4.4
plot(d1$Date,d1$Global_reactive_power,ylab="Global_reactive_power",type="n",xlab=DT_lab)
lines(d1$Date,d1$Global_reactive_power)
dev.off()

