## read data
header<-readLines("household_power_consumption.txt", n=1)
header<-strsplit(header,";")
data<-read.table("household_power_consumption.txt", header=F, na.strings="?", skip=66636, nrows=2880, sep=";", col.names=header[[1]])

## add columm of class Date/Time
data$DateTime<-strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")

## plot
png("./plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l", ann=F)
title(xlab=NULL, ylab="Global Active Power (killowatts)")
dev.off()


