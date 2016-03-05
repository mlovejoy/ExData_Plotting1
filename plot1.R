# plot1.R

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

# plot1: create plot and save as PNG file
png("plot1.png", width=480, height=480)

hist(subset$Global_active_power, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

dev.off()