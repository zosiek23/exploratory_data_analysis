# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data for testing
NEIsample <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

# Subsets data and appends two years in one data frame
maryland <- subset(NEI, fips == '24510')

# Open device
png(filename='plot2.png',width=480,height=480,units='px')

# Plot the data
barplot(tapply(X = maryland$Emissions, INDEX = maryland$year, FUN = sum), main = 'Total Emission in Baltimore City, Maryland ', xlab = 'Year', ylab = expression('PM'[2.5]), col='blue')

# Turn off device
dev.off()