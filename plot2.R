setwd("C:/Users/Yuhanis/Documents/My Course/Data Science/Data/Course4-Exploratory Data Analysis/ProjectAssignment1")

data_file <- "./data/household_power_consumption.txt"   #file location
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")   #read the txt file
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #We will only be using data from the dates 2007-02-01 and 2007-02-02

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #set the datetime format
globalActivePower <- as.numeric(subSetData$Global_active_power) #read the subset data for Global Active Power

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels 
png("plot2.png", width=480, height=480)
#type=1 is forlines, set y label title
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


