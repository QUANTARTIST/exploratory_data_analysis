## Set approprirate working directory where data is saved

setwd("C/project4/exploratory_data_analysis")

## Extract data from working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Construct a subset of the NEI data which corresponds to vehicles

v <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vSCC <- SCC[v,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

## Subset the vehicles NEI data to Baltimore's fip

baltimoreVNEI <- vNEI[vehiclesNEI$fips=="24510",]

## Create plot.png

png("plot5.png",width=480,height=480,units="px",bg="transparent")

graph <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
print(graph)
dev.off()

