## Read data into R // assumes file is already downloaded to working directory folder
rawdata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
rawdata$Date <- as.character(rawdata$Date)
data <- subset(rawdata, Date == "1/2/2007" | Date =="2/2/2007")

## Create Plot 2
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character((data$Global_active_power)))

plot(data$DateTime, data$Global_active_power, type = 'l', ann = FALSE)
title(ylab = "Global Active Power (kilowatts)")
axis(side = 2, at = seq.int(0, 6, by= 2),  xpd = TRUE)
dev.copy(png, "plot2.png", height = 480, width = 480)
dev.off()