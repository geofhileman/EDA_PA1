data1 <- read.csv("household_power_consumption.txt", sep=';')
summary(data1$Date)


data2 <- subset(data1, Date %in% c("2/2/2007","1/2/2007"))
head(data2)

GAP_KW <- as.numeric(paste(data2$Global_active_power))
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

yrange = range(GAP_KW)
xrange = range(datetime)

plot(xrange, yrange, type="n", xlab=" ", ylab="Global Active Power (kilowatts)")
lines(datetime, GAP_KW)

