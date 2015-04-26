# How have emissions from motor vehicle sources changed from 1999-2008 
# in Baltimore City?

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2 library
library('ggplot2')

# Subset Baltimore City, Maryland (24510) & On Road (Motor vehicle)
Baltimore_road <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

# Aggregate the data by year
Baltimore_road_year <- aggregate(Emissions ~ year, Baltimore_road, FUN=sum)

png(filename = "plot5.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

ggplot(Baltimore_road_year, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression("Total PM"[2.5]*" emissions")) +
        ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()