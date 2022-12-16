getwd()
setwd('C:/Users/Lila/Documents/RData')

airbnb <- read.csv('AB_NYC_2019.csv')
head(airbnb)
summary(airbnb)
table(airbnb$room_type)
table(airbnb$neighbourhood)
sort(table(airbnb$neighbourhood_group))

barplot(sort(table(airbnb$neighbourhood_group)))

min_reviews <- 0
max_reviews <- max(airbnb$number_of_reviews)+99
boxes <- seq(min_reviews, max_reviews, 50)
boxes

z<-table(cut(airbnb$number_of_reviews, breaks=boxes))
barplot(z)
names(z)<-tail(boxes,-1)
barplot(z)

x<-substr(airbnb$last_review,1,4)
x<-table(x)
barplot(x)


bronx_brooklyn <- airbnb[airbnb$neighbourhood_group %in%
                           c('Bronx','Brooklyn'),]
bronx_queens <- airbnb[airbnb$neighbourhood_group %in%
                         c('Bronx','Queens'),]

t.test(bronx_brooklyn$price ~bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$price ~bronx_brooklyn$neighbourhood_group)

t.test(bronx_queens$price ~bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$price ~bronx_queens$neighbourhood_group)

tapply(airbnb$price, airbnb$neighbourhood_group, mean)
tapply(airbnb$number_of_reviews, airbnb$neighbourhood_group, mean)
tapply(airbnb$availability_365, airbnb$neighbourhood_group, mean)
