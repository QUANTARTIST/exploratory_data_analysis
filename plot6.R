## Set approprirate working directory where data is saved

setwd("C/project4/exploratory_data_analysis")

## Extract data from working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Contstruct a subset of the NEI data which corresponds to vehicles
v <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vSCC <- SCC[v,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

## Subset the vehicles NEI data by each city's fip and add city name.
vehiclesBaltimoreNEI <- vNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"

vehiclesLANEI <- vNEI[vNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"

## Merge the two subsets with city name into one data frame

## Creat plot.png

png("plot6.png",width=480,height=480,units="px",bg="transparent")

graph <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(graph)

dev.off()



