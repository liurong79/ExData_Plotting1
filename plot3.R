## read data
header<-readLines("household_power_consumption.txt", n=1)
header<-strsplit(header,";")
data<-read.table("household_power_consumption.txt", header=F, na.strings="?", skip=66636, nrows=2880, sep=";", col.names=header[[1]])

## add columm of class Date/Time
data$DateTime<-strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")

## plot
png("./plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="n", ann="F")
title(ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="blue")
lines(data$DateTime, data$Sub_metering_3, col="red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "blue", "red"))
dev.off()


