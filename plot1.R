# Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the 
# total PM2.5 emission from all sources for each of the years 1999, 2002, 
# 2005, and 2008.

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Total emissions from PM2.5 in the United States from 1999 to 2008

Data <- aggregate(Emissions ~ year, NEI, sum)
Data$Emissions <- round(Data[,2]/1000,2)


png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

barplot(height=Data$Emissions, 
        names.arg=Data$year,
        xlab="Year", 
        ylab=expression('Total PM'[2.5]*'  in Kilotons'),
        main=expression('Total Emission of PM'[2.5]))

dev.off()