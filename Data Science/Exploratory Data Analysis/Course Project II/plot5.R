library("plyr")
library('ggplot2')

# Load data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
baltimore<-ddply(baltimore,.(year),summarize,total=sum(Emissions))
baltimore$city <- "Baltimore city";

png("plot5.png")
plot(baltimore$year,baltimore$total,type="n", xlab="Year", ylab="Total Emission of PM2.5 from Vehicles in Baltimore")
lines(baltimore$year,baltimore$total)
dev.off()