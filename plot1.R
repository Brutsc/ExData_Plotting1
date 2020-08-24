##loading the data
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Format date to Type Date
full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(full_data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Create the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save png file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()