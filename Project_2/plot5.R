# Loads required libraries
require(ggplot2)

# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# NEI years
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
maryland.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregates emission by year
maryland.df <- aggregate(maryland.onroad[, 'Emissions'], by = list(maryland.onroad$year), sum)
colnames(maryland.df) <- c('year', 'Emissions')

# Open device
png(filename='plot5.png',width=480,height=480,units='px')

# Plot the data
ggplot(data = maryland.df, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))

# Turn off device
dev.off()