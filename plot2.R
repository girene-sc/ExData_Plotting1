## Reading the data
data <- read.csv("household_power_consumption.txt", sep = ";", 
                 stringsAsFactors = FALSE)
## Subsetting the data from 2007/02/01 and 2007/02/02
data <- data[ which(data$Date %in% "1/2/2007" | data$Date %in% "2/2/2007"), ]
## Changing class for date and time variables 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T")
## Changing class to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
## Generating Plot 2
plot(data$Time, data$Global_active_power, pch = "", xlab = "", 
     ylab = "Global Active power (kilowatts)")
lines(data$Time, data$Global_active_power)
dev.copy(png, file = "plot2.png")
dev.off()