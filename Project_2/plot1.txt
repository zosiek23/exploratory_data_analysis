# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data for testing
NEIsample <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

# Aggregate emmision for each year
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
print(Emissions)
Emissions$ROUND <- round(Emissions[, 2] / 1000, 2)

# Open device
png(filename='plot1.png',width=480,height=480,units='px')

# Plot the data
barplot(Emissions$ROUND, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')), col='red')

# Turn off device
dev.off()

