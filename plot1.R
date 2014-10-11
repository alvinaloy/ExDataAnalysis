##Read in the data as characters
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClass = "character")

##Subset out the required data
data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

##Create plot1.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
