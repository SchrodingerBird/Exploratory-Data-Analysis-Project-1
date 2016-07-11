setwd("E:\\Coursera\\Exploratory Data Analysis\\Project 01")

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data_raw$Date <- as.Date(data_raw$Date, format="%d/%m/%Y", tz = "")

data <- subset(data_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

hist(as.numeric(data_2007$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
