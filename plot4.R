# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2 library
library('ggplot2')

# Find coal combustion-related sources
Coal_combustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
Coal_combustion_sources <- SCC[Coal_combustion,]

# Subset coal combustion data
Coal_combustion_data <- NEI[(NEI$SCC %in% Coal_combustion_sources$SCC), ]

# Aggregate by year
Coal_combustion_year <- aggregate(Emissions ~ year, Coal_combustion_data, FUN=sum)

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

ggplot(Coal_combustion_year, aes(x=factor(year), y=Emissions/1000)) +
        geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression("Total PM"[2.5]*" emission in kilotons")) +
        ggtitle("Emissions from coal combustion-related sources")
dev.off()
