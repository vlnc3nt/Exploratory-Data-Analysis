# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")

Baltimore_data <- NEI[NEI$fips=="24510",]

Baltimore_year <- aggregate(Emissions ~ year, Baltimore_data, sum)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

barplot(height=Baltimore_year$Emissions,
        names.arg=Baltimore_year$year,
        xlab="years", 
        ylab=expression('Total PM'[2]*' emission'),
        main=expression('Total emissions of PM'[2.5]*' - Baltimore City, Maryland (1999 to 2008)'))
dev.off()