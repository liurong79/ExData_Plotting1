## read data
header<-readLines("household_power_consumption.txt", n=1)
header<-strsplit(header,";")
data<-read.table("household_power_consumption.txt", header=F, na.strings="?", skip=66636, nrows=2880, sep=";", col.names=header[[1]])

## add columm of class Date/Time
data$DateTime<-strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")

## plot
png("./plot4.png", width=480, height=480)

par(mfrow=c(2,2))

## plot 1
plot(data$DateTime, data$Global_active_power, type="l", ann=F)
title(xlab=NULL, ylab="Global Active Power")

## plot 2
plot(data$DateTime, data$Voltage, type="l", ann="F")
title(xlab="datetime", ylab="Voltage")

## plot 3
plot(data$DateTime, data$Sub_metering_1, type="n", ann="F")
title(ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="blue")
lines(data$DateTime, data$Sub_metering_3, col="red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "blue", "red"))

## plot 4
plot(data$DateTime, data$Global_reactive_power, type="l", ann="F")
title(xlab="datetime", ylab="Global_reactive_power")

dev.off()


