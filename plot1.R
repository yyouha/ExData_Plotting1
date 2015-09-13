setwd("C:/Users/Yuhanis/Documents/My Course/Data Science/Data/Course4-Exploratory Data Analysis/ProjectAssignment1")

data_file <- "./data/household_power_consumption.txt" #file location
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #read the txt file
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #We will only be using data from the dates 2007-02-01 and 2007-02-02

globalActivePower <- as.numeric(subSetData$Global_active_power) #read the subset data for Global Active Power

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels 
png("plot1.png", width=480, height=480) 
#Plot the histogram, set the color, main title and x label title
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
