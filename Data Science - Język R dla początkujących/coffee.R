coffebar <- data.frame(name=c('Caffe Americano', 'Cafe Latte','Cappuccino','Espresso','Flat white','Macchiato'),
                             ingredients=c(NA,'steamed milk','steamed milk + foamy milk + chocolate',NA,'cream milk','steamed milk'),
                             country=c('USA','France','Italy','Italy','New Zealand','Italy'),
                       temp=c('Hot','Hot','Medium hot','Hot','Hot','Hot'),
                       price=c(3, 4, 4, 3, 5, 4))
coffebar
coffebar[1,]
coffebar[1:3,]
coffebar[3,'ingredients']
coffebar[,c('name','country','price')]
coffebar[,c(1,5)]

coffebar[[3]]
str(coffebar)
summary(coffebar)
