# Create plot2.png
# "There should be four PNG files and four R code files."
# Load data from the web

# Yes, strptime produces labels in German.
# Sys.setlocale("LC_TIME", "en_EN.utf8") did not work on Rstudio on my mac.
# I do not consider solving this issue to be an exclusive extra work for those from other countries.

#setwd("~/Daten/Coursera/04ExploratoryAnalysis/Course Project 1/ExData_Plotting1") # My working directory

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

#plot (plotdata$datetime, plotdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = " ")

# create final plot in pngfile device
png(file = "plot2.png")
plot (plotdata$datetime, plotdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()


