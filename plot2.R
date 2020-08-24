##loading the data
full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Format date to Type Date
full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")


## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(full_data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Create the plot2
with(data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


## Save png file and close device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
