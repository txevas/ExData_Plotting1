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
png(file = "plot3.png")
#plot
plot(myData$DateTime,y = myData$Sub_metering_1,type='l', xlab = "", ylab = "Energy sub metering") 
#add info
lines(myData$DateTime,y =myData$Sub_metering_2, col = "red")
lines(myData$DateTime,y =myData$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.2,lwd = 2)
#dev.copy(png, file = "plot3.png")
dev.off()