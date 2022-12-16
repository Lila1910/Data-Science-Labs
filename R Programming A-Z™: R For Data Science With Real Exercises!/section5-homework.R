getwd()
data <- read.csv('P2-Section5-Homework-Data.csv')
head(data)
data1960 <- data[data$Year==1960,]
head(data1960)

data2013 <- data[data$Year==2013,]
head(data2013)

data1960 <- merge(data1960, Life_Expectancy_At_Birth, by.x='Country.Code',by.y='Country_Code')
head(data1960)
data1960$Life_Expectancy_At_Birth_2013 <- NULL

data2013 <- merge(data2013, Life_Expectancy_At_Birth, by.x='Country.Code',by.y='Country_Code')
head(data2013)
data2013$Life_Expectancy_At_Birth_1960 <- NULL

qplot(data=data1960, x=Fertility.Rate, y=Life_Expectancy_At_Birth_1960, colour=Region, size=I(3))
qplot(data=data2013, x=Fertility.Rate, y=Life_Expectancy_At_Birth_2013, colour=Region, size=I(3))
