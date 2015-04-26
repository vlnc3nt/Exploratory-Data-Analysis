# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in 
# motor vehicle emissions?

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2 library
library('ggplot2')

# Subset Baltimore City, Maryland (24510) & Los Angeles (06037) Motor vehicle data
BC_LA_data <- NEI[((NEI$fips=="24510") | (NEI$fips=="06037")) & (NEI$type=="ON-ROAD"),]
BC_LA_road_year <- aggregate(Emissions ~ year + fips, BC_LA_data, FUN=sum)
BC_LA_road_year$fips <- factor(BC_LA_road_year$fips, levels=c('06037', '24510'), labels=c('Los Angeles', 'Baltimore City'))

png(filename = "plot6.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

ggplot(BC_LA_road_year, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") + 
        facet_grid(.~fips) +
        ylab("total emissions (tons)") + 
        xlab("year") +
        ggtitle(expression("Motor vehicle emission variation in Los Angeles & Baltimore City"))
dev.off()


