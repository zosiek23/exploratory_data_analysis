library(nlme)
library(lattice)
plot <- xyplot(weight ~ Time | Diet, BodyWeight)
class(plot)

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)


print.trellis()
Error: could not find function "print.trellis"

?print.trellis
?trellis.par.set
?splom
?par
?print.trellis
?splom



library(datasets)
data(airquality)
library(ggplot2)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

qplot(Wind, Ozone, data = airquality, geom = "smooth")

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality)



library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)


qplot(votes, rating, data = movies)

## How can I modify the the code above to add a smoother to the scatterplot?
qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies, panel = panel.loess)



library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

qplot(votes, rating, data = movies) + geom_smooth()

