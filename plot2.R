# Setting working directory to location of data
setwd('~/R/Coursera/Exploratory Data Analysis/Assignments/Course Project 1')

#load sqldf package
library(sqldf)

#read in data for relevant dates
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";", header=TRUE)

#format Date and Time Columns
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <- paste(data$Date,data$Time, sep= ' ')
data$DateTime <- as.POSIXlt(data$DateTime)

#Create new data frame that contains columns of interest and format datetime column
newDT <- data.frame(data$DateTime,data$Global_active_power)

#Turn on png device to send graph of size 480x480 with transparent background
png(filename = "plot2.png",width=480,height=480,bg="transparent")

#setup graph with xlabel/ylabel, and main title
plot(newDT,type="l",main="",ylab="Global Active Power (kilowatts)",xlab="")

#turn off png device
dev.off()
