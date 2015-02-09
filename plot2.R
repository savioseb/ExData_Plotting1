## Getting full dataset
dataFull <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## Subsetting the data
dataReal <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)


## creating Plot 2
plot(dataReal$Global_active_power~dataReal$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## writing Plot2 to disk
dev.copy(png, file="plot2.png", height=504, width=504)
dev.off()