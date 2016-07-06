## set appropriate working directory where data is saved

setwd("C/project4/exploratory_data_analysis")

## Extract data from working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Step 2: subset our data

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)


## Plot to png

png("plot3.png", width=640, height=480)
graph <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
graph <- graph + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(graph)
dev.off()


