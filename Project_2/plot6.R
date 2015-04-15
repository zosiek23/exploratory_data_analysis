# Loads required libraries
require(ggplot2)

# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# NEI years
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland
# Los Angeles County, California
maryland.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
california.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregates emission by year
maryland.DF <- aggregate(maryland.onroad[, 'Emissions'], by = list(maryland.onroad$year), sum)
colnames(maryland.DF) <- c('year', 'Emissions')
maryland.DF$City <- paste(rep('Maryland', 4))

california.DF <- aggregate(california.onroad[, 'Emissions'], by = list(california.onroad$year), sum)
colnames(california.DF) <- c('year', 'Emissions')
california.DF$City <- paste(rep('California', 4))

DF <- as.data.frame(rbind(maryland.DF, california.DF))

# Open device
png(filename='plot6.png',width=800,height=480,units='px')

# Plot the data
ggplot(data = DF, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year),stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ City) + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))

# Turn off device
dev.off()