# Setting working directory to location of data
setwd('~/R/Coursera/Exploratory Data Analysis/Assignments/Course Project 1')

#load sqldf package
library(sqldf)

#read in data for relevant dates
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";", header=TRUE)

#format Date and Time Columns
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- ts(data$Time)

#Turn on png device to send graph of size 480x480 with transparent background
png(filename = "plot1.png",width=480,height=480,bg="transparent")

#setup graph with colors for columns, xlabel, and main title
hist(data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")

#turn off png device
dev.off()
