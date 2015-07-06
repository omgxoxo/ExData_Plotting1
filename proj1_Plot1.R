## Course: Exploratory Data Analysis
## Course Project 1
## Scripts for Plot 1
## 'dplyr' package needed to run this script properly

## Read and prepare dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
library("dplyr")
df <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
df[,3] <- as.numeric(df[,3])

## Plot global active power data by frequency in a histogram and save to .PNG device
png("proj1_Plot1.png", width=480, height=480, units="px", pointsize=12)
hist(df$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()