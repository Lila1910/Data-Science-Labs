boston <- read.csv('c:/crimes-in-boston/crime.csv')

b2016 <- boston[boston$YEAR==2016,]
b2016 <- table(b2016$MONTH)
b2016 <- as.vector(b2016)

?barplot
barplot(b2016, xlab='month',
        ylab='number of crimes', 
        main='Crimes in Boston in 2016', 
        names.arg=1:12, 
        col=c('blue','blue','blue','green','green','green','yellow','yellow','yellow','red','red','red'),
        space=1)

b2years <- boston[boston$YEAR %in% c(2016,2017),]
b2years <- tapply(b2years$MONTH, list(b2years$YEAR,b2years$MONTH), length)  
b2years <- (data.matrix(b2years))

barplot(t(b2years), xlab='month',ylab='number of crimes', main='Crimes in Boston 2016/2017', beside=TRUE, col=c('blue','green'))
#
datasets::co2
carbond <- matrix(datasets::co2, ncol=12,byrow=TRUE)
heatmap(carbond, Colv = NA, Rowv = NA, scale='row', labRow = 1959:1997, labCol = month.abb)
heatmap(carbond, Colv = NA, Rowv = NA, scale='none', labRow = 1959:1997, labCol = month.abb)
heatmap(carbond, Colv = NA, Rowv = NA, scale='column', labRow = 1959:1997, labCol = month.abb)
?heatmap
#
airbnb <- read.csv('c:/r/new-york-city-airbnb-open-data/AB_NYC_2019.csv')
airbnb <- airbnb[ ,c('price', 'neighbourhood_group')]
airbnb_sup <- tapply(airbnb$price, airbnb$neighbourhood_group, mean)
colors <- rainbow(nrow(airbnb_sup))
?boxplot
boxplot(price~neighbourhood, data=airbnb, outline=FALSE, col=colors, xlab='region',ylab='price (no outliers)', varwidth=TRUE, horizontal=TRUE)
#
airDF <- read.csv("C:/R/2008.csv")
may <- airDF[airDF$Month == 5, ]
hist(may$ArrDelay)
may <- airDF[airDF$Month == 5  & !is.na(airDF$ArrDelay) &
               abs(airDF$ArrDelay) <=100, ]
?hist
hist(may$ArrDelay, breaks=10)
hist(may$ArrDelay, breaks=seq(-100,100,10), col='lightgoldenrod1', freq=FALSE)
lines(density(may$ArrDelay), col='tomato3', lwd=5)
#
airbnb <- read.csv('C:/R/new-york-city-airbnb-open-data/AB_NYC_2019.csv', )
rooms <- tapply(airbnb$room_type, airbnb$room_type, length)
pie(rooms)
colors <- colorRampPalette(c("yellow", "red"))(length(rooms)) 
?pie
pie(rooms, col=colors, edges=10, radius=1.05, init.angle = 90, main='Room types')

d <- paste(names(rooms), ' (', rooms, ')', sep='')
pie(rooms, col=colors, main="Room types", labels=d)
#
airDF <- read.csv("C:/R/2008.csv")
may <- airDF[airDF$Month == 5, ]
may_by_day <- tapply(may$ArrDelay, may$DayofMonth, mean, na.rm=TRUE)
mid <- mean(may_by_day)
plot(may_by_day)
colors <- ifelse(may_by_day>mid, 'Red','Green')
shapes <- ifelse(may_by_day>mid, 16, 17)
plot(may_by_day, col=colors, bg=colors, pch=shapes)
?plot
abline(h=mid)
lines(may_by_day, col='blue')
