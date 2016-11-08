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

## create the red histogram:
hist(hpc$Global_active_power, breaks = 12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot1.png")
dev.off()


