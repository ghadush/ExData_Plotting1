## Cran package easy to download files
library(downloader)

# Link of the zipped files 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download(url, dest="dataset.zip", mode="wb") 
# Unzip into under my current working directory "data" 
unzip ("dataset.zip", exdir = "./data")
#Change my working directory to data folder where the unzipped file is saved
setwd("./data")
fh <- file("household_power_consumption.txt")
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# reset plotting size to show 1 by 1
par(mfrow=c(1,1))
# Generating Plot 1
hist(ba$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")


