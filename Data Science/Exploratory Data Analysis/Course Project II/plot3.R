library("plyr")
library("ggplot2")

# Load data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))# change year to factor
data<-data[data$fips=="24510",]

#summed Data based on year and Type
data<-ddply(data,.(year,type),summarize,total=sum(Emissions))

#now plot it
png("plot3.png")
gplot<-ggplot(data,aes(year,total))
gplot+geom_point()+facet_grid(.~type)+labs(title="Baltimore city PM2.5 Emission",
                                           y="Total PM2.5 Emission each year")
dev.off()