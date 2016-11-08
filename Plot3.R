setwd("C:/Users/paul/OneDrive/Coursera/Exploratory Data Analysis")

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## retrieve an prepare the data:
library(downloader)
download.file(url, dest="myDataset.zip")
unzip (zipfile="myDataset.zip",exdir=getwd())
hpcTotal <- read.table("household_power_consumption.txt", header=T, sep=";")

hpcTotal$Time <- strptime(paste(hpcTotal$Date,hpcTotal$Time), "%d/%m/%Y %H:%M:%S")
hpcTotal$Date <- strptime(hpcTotal$Date, "%d/%m/%Y")

## reduce the date range to the 1st and second of February:
hpc <- hpcTotal[hpcTotal$Date>="2007-02-01" & hpcTotal$Date<="2007-02-02",]

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))

## create the multicolor chart:
plot(c(hpc$Time, hpc$Time, hpc$Time), c(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3), 
     type = "l", xlab="", ylab="Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2, col="red")
lines(hpc$Time, hpc$Sub_metering_3, col="blue")

dev.copy(png, file="Plot3.png")
dev.off()
