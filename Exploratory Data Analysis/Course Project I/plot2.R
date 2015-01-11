dataSetFile <- 'household_power_consumption.txt';
dataRows <- 2075259;
data <- read.table(dataSetFile, header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings="?", nrows = 5)
classes <- lapply(data, class);
data <- read.table(dataSetFile, header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings="?", nrows = dataRows, colClasses = classes);
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ];
data <- NULL;

dateTime <- paste(subData$Date, subData$Time);
xTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S");
png("plot2.png", width=480, height=480);
plot(xTime, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");
dev.off();