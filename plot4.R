daten <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", nrows = 50)
colc <- sapply(daten, class)
daten <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char = "", colClasses = colc)
daten <- subset(daten, (Date=="1/2/2007")|(Date=="2/2/2007"))
daten$x <- strptime(paste(daten$Date," ",daten$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#upper left
plot(daten$x,daten$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#upper right
plot(daten$x, daten$Voltage, xlab="datetime", ylab="Voltage",type="l")
#lower left
plot(daten$x, daten$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")
lines(daten$x, daten$Sub_metering_2, col="red")
lines(daten$x, daten$Sub_metering_3, col="blue")
legend(x = "topright", lty = c(1,1,1), bty= "n", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#lower right
plot(daten$x, daten$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type = "l")

dev.off()
