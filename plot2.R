daten <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", nrows = 50)
colc <- sapply(daten, class)
daten <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char = "", colClasses = colc)
daten <- subset(daten, (Date=="1/2/2007")|(Date=="2/2/2007"))
daten$x <- strptime(paste(daten$Date," ",daten$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot(daten$x,daten$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
