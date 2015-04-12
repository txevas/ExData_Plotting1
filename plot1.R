#read the file
myFile <- "household_power_consumption.txt"
#read header's names
myHeader <- read.csv(myFile, sep=";", skip=0, nrows=1) 
#read data, skip unnecessary rows
myData <- read.csv(myFile, sep=";", skip=66637, nrows=2880, na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
names(myData)<-names(myHeader)
#new column creation in datetime format
myData$DateTime = paste(myData$Date, myData$Time)
myData$DateTime = strptime(myData$DateTime, "%d/%m/%Y %H:%M:%S")

#prepare png file
png(file = "plot1.png")
#plot
hist( myData$Global_active_power, main="Global Active Power", col="red",  xlab="Global Active Power (kilowatts)")
#dev.copy(png, file = "plot1.png")
dev.off()