dataSetFile <- 'household_power_consumption.txt';
dataRows <- 2075259;
data <- read.table(dataSetFile, header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings="?", nrows = 5)
classes <- lapply(data, class);
data <- read.table(dataSetFile, header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings="?", nrows = dataRows, colClasses = classes);
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ];
data <- NULL;

dateTime <- paste(subData$Date, subData$Time);
xTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S");
png("plot3.png", width=480, height=480);
plot(xTime, subData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");
lines(xTime, subData$Sub_metering_2, col="red");
lines(xTime, subData$Sub_metering_3, col="blue");
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black"," red","blue"))
dev.off();