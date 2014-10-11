##Read in the data as characters
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClass = "character")

##Subset out the required data
data_sub <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

##Change numbers to numeric
for(i in 3:9) {data_sub[, i] <- as.numeric(data_sub[ , i])}

##Create a date & time variable to be used in the plot
data_sub$DateTime <- paste(data_sub$Date, data_sub$Time)

##Change the format from character to date/time (Posixlt)
data_sub$DateTime <- strptime(data_sub$DateTime, "%d/%m/%Y %H:%M:%S")

##Create plot4.png
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

##Topleft (plot2)
plot(data_sub$DateTime, data_sub$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines(data_sub$DateTime, data_sub$Global_active_power)

##Topright
plot(data_sub$DateTime, data_sub$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
lines(data_sub$DateTime, data_sub$Voltage)

##Bottomleft (plot3)
plot(data_sub$DateTime, data_sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data_sub$DateTime, data_sub$Sub_metering_1)
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Bottomright
plot(data_sub$DateTime, data_sub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="n")
lines(data_sub$DateTime, data_sub$Global_reactive_power)

dev.off()
