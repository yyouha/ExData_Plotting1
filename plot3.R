setwd("C:/Users/Yuhanis/Documents/My Course/Data Science/Data/Course4-Exploratory Data Analysis/ProjectAssignment1")

data_file <- "./data/household_power_consumption.txt"   #file location
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")   #read the txt file
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #We will only be using data from the dates 2007-02-01 and 2007-02-02

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #set the datetime format
globalActivePower <- as.numeric(subSetData$Global_active_power) #read the subset data for Global Active Power
#set 3 subMetering
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels 
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") #plot the 1st line and set y label title
lines(datetime, subMetering2, type="l", col="red") #plot the 2nd line with red color
lines(datetime, subMetering3, type="l", col="blue") #plot the 3rd line with blue color
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
