## Course: Exploratory Data Analysis
## Course Project 1
## Scripts for Plot 3
## 'dplyr' package needed to run this script properly

## Read and prepare dataset
data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, stringsAsFactors=FALSE)
library("dplyr")
df <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
DTTM <- paste(df$Date, df$Time)
newDTTM <- strptime(DTTM, "%d/%m/%Y %H:%M:%S", tz="America/Los_Angeles")
df[,7] <- as.numeric(df[,7])
df[,8] <- as.numeric(df[,8])
df[,9] <- as.numeric(df[,9])

## Plot energy sub metering data over 2-day period and save to .PNG device
png("proj1_Plot3.png", width=480, height=480, units="px", pointsize=12)
plot(newDTTM, df$Sub_metering_1, type="l", col="black",
     xlab=" ", ylab="Energy sub metering")
lines(newDTTM, df$Sub_metering_2, type="l", col="red",
      xlab=" ", ylab="Energy sub metering")
lines(newDTTM, df$Sub_metering_3, type="l", col="blue",
      xlab=" ", ylab="Energy sub metering")
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()