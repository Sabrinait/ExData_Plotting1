
## Read data into R // assumes file is already downloaded to working directory folder
rawdata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
rawdata$Date <- as.character(rawdata$Date)
data <- subset(rawdata, Date == "1/2/2007" | Date =="2/2/2007")

par(mfrow = c(2,2), mar = c(5.1, 4.1, 2, 2.1), cex = .7)

## Create Plot A
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character((data$Global_active_power)))

plot(data$DateTime, data$Global_active_power, type = 'l', ann = FALSE)
title(ylab = "Global Active Power")
axis(side = 2, at = seq.int(0, 6, by= 2),  xpd = TRUE)

## Create Plot B
data$Voltage <- as.numeric(as.character((data$Voltage)))
plot(data$DateTime, data$Voltage, type = 'l', ann = FALSE)
title(ylab = "Voltage", xlab = "datetime")
# axis(side = 2, at = seq.int(0, 6, by= 2),  xpd = TRUE)

## Create Plot C
data$Sub_metering_1 <- as.numeric(as.character((data$Sub_metering_1)))
data$Sub_metering_2 <- as.numeric(as.character((data$Sub_metering_2)))
data$Sub_metering_3 <- as.numeric(as.character((data$Sub_metering_3)))

with(data, plot(DateTime, Sub_metering_1, col = "black", type = "l", ann = FALSE ))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", xjust = "1", cex = .7, lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
title(ylab = "Energy sub metering")

## Create Plot D
data$Global_reactive_power <- as.numeric(as.character((data$Global_reactive_power)))
plot(data$DateTime, data$Global_reactive_power, type = 'l', ann = FALSE)
title(ylab = "Global_reactive_power", xlab = "datetime")
# axis(side = 2, at = seq.int(0, 6, by= 2),  xpd = TRUE)

##Export as PNG
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()
