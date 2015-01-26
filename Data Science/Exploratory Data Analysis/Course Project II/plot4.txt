library("plyr")
library('ggplot2')

# Load data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data<-transform(NEI,type=factor(type),year=factor(year));

#get the SCC of level is combustion and type of coal but ignore case
combcoal <- (grepl('comb', SCC$Short.Name, ignore.case=T) & grepl("coal", SCC$Short.Name, ignore.case=T))

data <- data[combcoal, ];

#Plot Data
data<-ddply(data,.(year),summarize,total=sum(Emissions))
png("plot4.png")
plot(data$year,data$total,type="n", xlab="Year", ylab="Total Emission of PM2.5 from Coal Combustion",boxwex=0.03)
lines(data$year,data$total)
dev.off()