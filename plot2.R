#
# This file reads in the household power consumption dataset
# and creates the second plot for the [Exploratory Data Analysis - Coursproject 1]
# 
# Author: Ben Curvers
# Created on: 20150506
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

## plot 2
png(file = "plot2.png", bg = "transparent")
plot(d1$Date,d1$Global_active_power,ylab=GAP_lab,type="n",xlab="")
lines(d1$Date,d1$Global_active_power)
dev.off()

