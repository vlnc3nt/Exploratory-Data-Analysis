# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these 
# four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Load ggplot2 library
library('ggplot2')

# Subset Baltimore data
Baltimore_data <- NEI[NEI$fips=="24510",]

# Aggregate the data by year and type
Baltimore_group <- aggregate(Emissions ~ year + type, Baltimore_data, FUN=sum)

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

ggplot(Baltimore_group , aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") +
        geom_smooth(aes(group=1), method='lm', se=FALSE) +
        facet_wrap(~type) +
        xlab("Year") +
        ylab(expression("Total PM"[2.5]*" emission")) +
        ggtitle(expression("Emissions per Type in Baltimore City, Maryland"))

dev.off()

