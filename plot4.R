# plot4.R

# Read data
power <- read.table("household_power_consumption.txt", 
                    header=TRUE, 
                    sep=";", 
                    na.strings="?")

# Convert date from character
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Subset for Feb 1 and 2 2007
subset <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# Create new field for date & time
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")

# plot4: create plot and save as PNG file
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2))

# plot2 again
plot(subset$datetime, 
     subset$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# plot in upper right corner
plot(subset$datetime,
     subset$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot3 again
plot(subset$datetime, 
     subset$Sub_metering_1,
     col = "black",
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subset$datetime,
      subset$Sub_metering_2,
      col = "red")
lines(subset$datetime,
      subset$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       bty = "n",
       col = c("black", "red", "blue"))

#plot in lower right corner
plot(subset$datetime, 
     subset$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()