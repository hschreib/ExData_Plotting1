# Create plot1.png
# "There should be four PNG files and four R code files."
# Load data from the web

# Yes, strptime produces labels in German.
# Sys.setlocale("LC_TIME", "en_EN.utf8") did not work on Rstudio on my mac.
# I do not consider solving this issue to be an exclusive extra work for those from other countries.

#setwd("~/Daten/Coursera/04ExploratoryAnalysis/Course Project 1/ExData_Plotting1") # My working directory

temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

# subset and recode data
#hsdata <- read.csv("household_power_consumption.txt", header=T, sep=";", nrows = 50)
#hsdata <- read.csv("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE)
hsdata <- read.csv("household_power_consumption.txt", header=T, sep=";", colClasses= c("character", "character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
plotdata <- hsdata[hsdata$Date %in% c("1/2/2007", "2/2/2007"), ]

# test the plot
# hist(plotdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
# create final plot in pngfile device
png(file = "plot1.png")
hist(plotdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
