# Create plot4.png
# "There should be four PNG files and four R code files."
# Load data from the web

# Yes, strptime produces labels in German.
# Sys.setlocale("LC_TIME", "en_EN.utf8") did not work on Rstudio on my mac.
# I do not consider solving this issue to be an exclusive extra work for those from other countries.

# setwd("~/Daten/Coursera/04ExploratoryAnalysis/Course Project 1/ExData_Plotting1") # My working directory

# Skip this section if you have already downloaded the data by running the plot1.R script


temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

# subset and recode data
hsdata <- read.csv("household_power_consumption.txt", header=T, sep=";", colClasses= c("character", "character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
# subset
plotdata <- hsdata[hsdata$Date %in% c("1/2/2007", "2/2/2007"), ]
# merge data and time first
plotdata$datetime <- paste(plotdata$Date, plotdata$Time)
# recast as dates
plotdata$datetime <- strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")

# test plot

# par(mfrow = c(2, 2))
# 
# with(plotdata, {
#     
#     # plot 1 (which is 2)
#     plot (plotdata$datetime, plotdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = " ")
#     # plot 2
#     plot (plotdata$datetime, plotdata$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
#     # plot 3
#     with(plotdata, plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = " " ), type = "n")
#     with(plotdata, points(datetime, Sub_metering_2, type="l", col = "red"))
#     with(plotdata, points(datetime, Sub_metering_3, type="l", col = "blue"))
#     legend("topright", lty=1,  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7,
#            box.lty=0)
#     
#     # plot 4
#     plot (plotdata$datetime, plotdata$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
#     
# })

# create final plot in pngfile device
png(file = "plot4.png")
par(mfrow = c(2, 2))

with(plotdata, {
    
    # plot 1 (which is 2)
    plot (plotdata$datetime, plotdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = " ")
    # plot 2
    plot (plotdata$datetime, plotdata$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
    # plot 3
    with(plotdata, plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = " " ), type = "n")
    with(plotdata, points(datetime, Sub_metering_2, type="l", col = "red"))
    with(plotdata, points(datetime, Sub_metering_3, type="l", col = "blue"))
    legend("topright", lty=1,  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7,
           box.lty=0)
    
    # plot 4
    plot (plotdata$datetime, plotdata$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
    
})

dev.off()

