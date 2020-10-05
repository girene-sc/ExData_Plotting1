## Reading the data
data <- read.csv("household_power_consumption.txt", sep = ";", 
                 stringsAsFactors = FALSE)
## Subsetting the data from 2007/02/01 and 2007/02/02
data <- data[ which(data$Date %in% "1/2/2007" | data$Date %in% "2/2/2007"), ]
## Changing class for date and time variables 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T")
## Changing class to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
## Generating Plot 3
png(filename = "plot3.png")
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()