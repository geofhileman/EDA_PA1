data1 <- read.csv("household_power_consumption.txt", sep=';')
summary(data1$Date)

data2 <- subset(data1, Date %in% c("2/2/2007","1/2/2007"))
head(data2)

GAP_KW <- as.numeric(paste(data2$Global_active_power))
Sub_metering_1 <- as.numeric(paste(data2$Sub_metering_1))
Sub_metering_2 <- as.numeric(paste(data2$Sub_metering_2))
Sub_metering_3 <- as.numeric(paste(data2$Sub_metering_3))
Global_reactive_power <- as.numeric(paste(data2$Global_reactive_power))
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Voltage <- as.numeric(paste(data2$Voltage))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(xrange, range(GAP_KW), type="n", xlab=" ", ylab="Global Active Power (kilowatts)")
lines(datetime, GAP_KW)

plot(xrange, range(Voltage), type="n", ylab="Voltage", xlab="datetime")
lines(datetime, Voltage)

yrange1 = range(Sub_metering_1)
yrange2 = range(Sub_metering_2)
yrange3 = range(Sub_metering_3)
xrange = range(datetime)
yrange[1] <- min(yrange1[1],yrange2[1],yrange3[1])
yrange[2] <- max(yrange1[2],yrange2[2],yrange3[2])
plot(xrange, yrange, type="n", xlab=" ", ylab="Energy sub metering")
lines(datetime, Sub_metering_1, col="black")
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, bty="n",col=c("black", "red", "blue"))

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()