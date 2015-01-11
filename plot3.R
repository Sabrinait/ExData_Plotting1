## Read data into R // assumes file is already downloaded to working directory folder
rawdata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
rawdata$Date <- as.character(rawdata$Date)
data <- subset(rawdata, Date == "1/2/2007" | Date =="2/2/2007")

## Create Plot 3
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character((data$Sub_metering_1)))
data$Sub_metering_2 <- as.numeric(as.character((data$Sub_metering_2)))
data$Sub_metering_3 <- as.numeric(as.character((data$Sub_metering_3)))

par(mar = c(5.1, 4, 4.1, 2.1))
with(data, plot(DateTime, Sub_metering_1, col = "black", type = "l", ann = FALSE ))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(ylab = "Energy sub metering")

dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()