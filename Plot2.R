setwd("E:\\Coursera\\Exploratory Data Analysis\\Project 01")

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data_raw$Date <- as.Date(data_raw$Date, format="%d/%m/%Y", tz = "")

data <- subset(data_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power ~ data$Datetime, type="l", xlab= "", ylab="Global Active Power (kW)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
