##Read in the data as characters
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClass = "character")

##Subset out the required data
data_sub <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

##Change numbers to numeric
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

##Create a date & time variable to be used in the plot
data_sub$DateTime <- paste(data_sub$Date, data_sub$Time)

##Change the format from character to date/time (Posixlt)
data_sub$DateTime <- strptime(data_sub$DateTime, "%d/%m/%Y %H:%M:%S")

##Create plot2.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot(data_sub$DateTime, data_sub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(data_sub$DateTime, data_sub$Global_active_power)
dev.off()
