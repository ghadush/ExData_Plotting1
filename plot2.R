## Getting full dataset and the subseting based on the direction given 
Data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")