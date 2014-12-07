## read data
header<-readLines("household_power_consumption.txt", n=1)
header<-strsplit(header,";")
data<-read.table("household_power_consumption.txt", header=F, na.strings="?", skip=66636, nrows=2880, sep=";", col.names=header[[1]])

## add columm of class Date/Time
data$DateTime<-strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")

## plot
png("./plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")
dev.off()
