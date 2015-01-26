library("plyr")

# Load data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))# change year to factor

#summed Data
data<-ddply(data,.(year),summarize,total=sum(Emissions))# sum the emissions

#now plot it
png("plot1.png")
plot(data$year,data$total,type="n", xlab="Year", ylab="Total Emission of PM2.5",boxwex=0.03)
lines(data$year,data$total)
dev.off()