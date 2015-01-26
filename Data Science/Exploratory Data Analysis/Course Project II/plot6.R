library("plyr")
library('ggplot2')

# Load data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# get baltimore data
baltimore <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
baltimore<-ddply(baltimore,.(year),summarize,total=sum(Emissions))
baltimore$city <- "Baltimore city";

# la data
lacounty <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]
lacounty <- ddply(lacounty,.(year),summarize,total=sum(Emissions))
lacounty$city <- "LA County";

#put it together
combined <- rbind(baltimore,lacounty);

#now plot it
png("plot6.png")
plot(combined$year,combined$total,type="n", xlab="Year", ylab="Total Emission of PM2.5 from Vehicles")
lines(baltimore$year,baltimore$total, col='blue')
lines(lacounty$year,lacounty$total, col='red')
legend(2004, 2000, c("Baltimore","LA county"), col=c('blue','red'), lty=c(1,1))

dev.off()