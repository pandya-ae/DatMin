install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)

Numbers <- table(mtcars$cyl, mtcars$gear)
barplot(Numbers, 
        main='Automobile cylinder number grouped by number of gears', 
        col = c('red','orange', 'steelblue'),
        legend = rownames(Numbers),
        xlab = 'Number of Gears',
        ylab = 'count')

hist(airquality$Temp,
     col = 'steelblue',
     main = 'Maximum Daily Temperature',
     xlab = 'Temperature (degrees Fahrenheit)')

with(subset(airquality, Month==9),
     plot(Wind, Ozone, col = 'steelblue', pch = 20, cex = 1.5)) 
title('Wind and Temperature in NYC in September of 1973')

mtcars <- transform(mtcars,
                    cyl=factor(cyl)) # convert 'cyl' column from class 'numeric' to class 'factor'
class(mtcars$cyl) # 'cyl' is now a categorical variable 
boxplot(mpg~cyl, mtcars,
        xlab='Number of Cylinders',
        ylab='miles per gallon',
        main='miles per gallon for varied cylinders in automobiles',
        cex.main=1.2)

# Create data
data <- data.frame(
  name = c("A", "B", "C", "D", "E") ,  
  value = c(3, 12, 5, 18, 45)
)

# Barplot
ggplot(data, aes(x = name, y = value)) + geom_bar(stat = "identity")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()