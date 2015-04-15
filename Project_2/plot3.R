# Loads RDS
require(ggplot2)

# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data for testing
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Baltimore City, Maryland == fips
maryland <- subset(NEI, fips == 24510)
maryland$year <- factor(maryland$year, levels = c('1999', '2002', '2005', '2008'))

# Open device
png(filename='plot3.png',width=800,height=480,units='px')

# Plot the data
ggplot(data = maryland, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha = 0.10)

# Turn off device
dev.off()