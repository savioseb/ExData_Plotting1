## Loading the data from the local directory
dataFull <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
                      
## specifying the Date column                      
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## Subsetting the data - only interested for data b/w 2007-02-01 and 2007-02-02 - putting that to data
dataReal <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)

## Converting dates
datetime <- paste(as.Date(dataReal$Date), dataReal$Time)
dataReal$Datetime <- as.POSIXct(datetime)

## Plot 1 - creating
hist(dataReal$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Writing Plot1 to file
dev.copy(png, file="plot1.png", height=504, width=504)
dev.off()