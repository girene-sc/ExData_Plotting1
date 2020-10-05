## Reading the data
data <- read.csv("household_power_consumption.txt", sep = ";", 
                 stringsAsFactors = FALSE)
## Subsetting the data from 2007/02/01 and 2007/02/02
data <- data[ which(data$Date %in% "1/2/2007" | data$Date %in% "2/2/2007"), ]
## Changing class for date and time variables 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T")
## Changing class (to numeric) for all other variables
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
## Generating Plot 4
png(filename = "plot4.png")
par(mfrow= c(2, 2))
mar = c()
with(data, {
    plot(Time, Global_active_power, pch = "", xlab = "", 
         ylab = "Global Active power")
    lines(Time, Global_active_power)
    plot(Time, Voltage, pch = "", xlab = "datetime", ylab = "Voltage")
    lines(Time, Voltage)
    plot(Time, Sub_metering_1, type = "n", xlab = "", 
         ylab = "Energy sub metering")
    lines(Time, Sub_metering_1)
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Time, Global_reactive_power, pch = "", xlab = "datetime")
    lines(Time, Global_reactive_power)
})
dev.off()