library(data.table);library(datasets)

## -------------------------  Part 1: Loading DATA -----------------------------------

# Setting my working directory in the directory that contains the data
setwd("./Coursera/DATA SCIENCE/COURSE 4  - Exploratory Data Analysis/Assignment W1/exdata%2Fdata%2Fhousehold_power_consumption/")

# Loading and reading the data from the dates 1/2/2007 and 2/2/2007

path <- file("household_power_consumption.txt")
dt <- read.table(text=grep("^[1,2]/2/2007", readLines(path),value = TRUE),
                 sep = ";",
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 na.strings = "?")

# Converting Date & Time variables to Datime variable with class POSIXlt

dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt$Datime <- paste(dt$Date,dt$Time)
dt$Datime <- strptime(dt$Datime, format = "%Y-%m-%d %H:%M:%S")

## -------------------------- Part 2: Making Plots -------------------------------------
#  PLOT 3: Energy sub metering (1,2,3) ~ Datime

png(file = "plot3.png",width = 480,height = 480,units = "px")

with(dt,plot(Datime,Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = ""))
with(dt,lines(Datime,Sub_metering_2,col="red"))
with(dt,lines(Datime,Sub_metering_3,col="blue"))
legend("topright",pch = NA,lwd = 2, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()