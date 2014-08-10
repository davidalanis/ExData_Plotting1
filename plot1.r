## This is the first plot - Histogram
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
useful_data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)
datetime <- paste(as.Date(useful_data$Date), useful_data$Time) ## Convert dates and times
useful_data$Datetime <- as.POSIXct(datetime)
## Create histogram Plot 1
hist(useful_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480) ## Save to file as required PNG 
dev.off() ## Device Off 