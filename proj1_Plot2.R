## Course: Exploratory Data Analysis
## Course Project 1
## Scripts for Plot 2
## 'dplyr' package needed to run this script properly

## Read and prepare dataset
data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, stringsAsFactors=FALSE)
library("dplyr")
df <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
DTTM <- paste(df$Date, df$Time)
newDTTM <- strptime(DTTM, "%d/%m/%Y %H:%M:%S", tz="America/Los_Angeles")
df[,3] <- as.numeric(df[,3])

## Plot global active power in kilowatts over 2-day period and save to .PNG device
png("proj1_Plot2.png", width=480, height=480, units="px", pointsize=12)
plot(newDTTM, df$Global_active_power, type="l",
     xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()