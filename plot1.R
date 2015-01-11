## Read data into R // assumes file is already downloaded to working directory folder
rawdata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
rawdata$Date <- as.character(rawdata$Date)
data <- subset(rawdata, Date == "1/2/2007" | Date =="2/2/2007")

## Create Plot 1
data$Global_active_power <- as.numeric(as.character((data$Global_active_power)))

par(mar = c(5.1, 4.1, 4.1, 2.1 ), cex = .8)
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", yaxt= 'n', xaxt = 'n', cex = .5)
axis(side = 1, at = c(0,2,4,6), xpd = TRUE)
axis(side = 2, at = seq.int(0, 1200, by= 200),  xpd = TRUE)


dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()