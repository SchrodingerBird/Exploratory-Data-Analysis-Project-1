
setwd("E:\\Coursera\\Exploratory Data Analysis\\Project 01")

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data_raw$Date <- as.Date(data_raw$Date, format="%d/%m/%Y", tz = "")

data <- subset(data_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2, 2)) 
plot(as.numeric(data$Global_active_power) ~ data$Datetime , type="l", xlab= "", ylab="Global Active Power (kW)", cex = 0.2)

plot(as.numeric(data$Voltage) ~ data$Datetime , type="l", xlab="datetime", ylab="Voltage")

plot(data$Datetime, as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(data$Datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(data$Datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(as.numeric(data$Global_reactive_power) ~ data$Datetime, type="l", xlab="datetime", ylab="Global reactive power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
