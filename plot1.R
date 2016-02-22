data1 <- read.csv("household_power_consumption.txt", sep=';')
summary(data1$Date)


data2 <- subset(data1, Date %in% c("2/2/2007","1/2/2007"))
head(data2)
nrow(data2)

GAP_KW <- as.numeric(paste(data2$Global_active_power))

head(GAP_KW)


hist(GAP_KW, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=15)


