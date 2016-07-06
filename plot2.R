## set appropriate working directory where data is saved

setwd("C/project4/exploratory_data_analysis")

## Extract data from working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract the subsets

b <- subset (NEI, fips == "24510")
total.PM25yr <- tapply(b$Emissions, b$year, sum)

## Plot conversion to png

png("plot2.png")

plot(names(total.PM25yr), total.PM25yr, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "pink")
dev.off() 
