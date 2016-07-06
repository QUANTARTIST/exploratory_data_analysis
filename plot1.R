## set approprirate working directory where data is saved

setwd("C/project4/exploratory_data_analysis")

## Extract data from working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate totals by year

aggregatedTotalYear <- aggregate(Emissions ~ year, NEI, sum)

## Build base plot

png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot(
        (aggregatedTotalYear$Emissions)/10^6,
        names.arg=aggregatedTotalYear$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
    )

dev.off()