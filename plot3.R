daten <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", nrows = 50)
colc <- sapply(daten, class)
daten <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char = "", colClasses = colc)
daten <- subset(daten, (Date=="1/2/2007")|(Date=="2/2/2007"))
daten$x <- strptime(paste(daten$Date," ",daten$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

plot(daten$x, daten$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")
lines(daten$x, daten$Sub_metering_2, col="red")
lines(daten$x, daten$Sub_metering_3, col="blue")
legend(x = "topright", lty = c(1,1,1), col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

