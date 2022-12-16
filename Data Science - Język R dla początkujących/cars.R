cars <- mtcars
cars$name <- rownames(cars)
head(cars)

cars$name[cars$cyl==4]

cars$name[cars$mpg<20]

filter_small <- (cars$mpg>24) & (cars$cyl==4) & !is.na(cars$mpg)

cars$name[filter_small]
cars[filter_small,c('name','mpg','cyl')]
cars[filter_small,]

cars['Fiat 128', 'mpg'] <- NA

cars[cars$cyl %in% c(6,8),]
