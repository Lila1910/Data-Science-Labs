make_df <- data.frame(name=c('Toyota','Ford','Fiat','Nissan'),
                      country=c('Japan','USA','Italy','Japan'),
                      president=c('Akio Toyoda','William Clay Ford Junior','John Elkann',NA),
                      is_Europe=c(F,F,T,F))

make_df

brand_df <- data.frame(name=c('Corolla','Auris','Mondeo','Sedicci','Cinquecento','Tipo','Astra'),
                       make=c('Toyota','Toyota','Ford','Fiat','Fiat','Fiat', 'Opel'),
                       available=c(F,T,F,F,F,T,T),
                       mileage=c(56,13,400,30,84,120,10),
                       is_Europe = c(T,T,F,T,T,T,T)
)

brand_df

result<-merge(x=make_df, y=brand_df, by.x='name',by.y='make', suffixes = c('_make','_brand'))
result[,c('name','name_brand','mileage')]






make1 <- data.frame(name=c('Toyota','Ford','Fiat','Nissan'),
                    country=c('Japan','USA','Italy','Japan'),
                    president=c('Akio Toyoda','William Clay Ford Junior','John Elkann',NA),
                    is_Europe=c(F,F,T,F))

make1

make2 <- data.frame(name=c('Mercedes','Renault','Nissan'),
                    country=c('Germany','France','Japan'),
                    president=c(NA,NA,NA),
                    is_Europe=c(T,T,F))
make2

merge(x=make1,y=make2,all=TRUE)
rbind(make1,make2)

union(make1$name, make2$name)
intersect(make1$name, make2$name)
setdiff(make1$name, make2$name)
setequal(make1$name, make2$name)

head_quarter <- data.frame(location=c('Toyota','Dearborn','Torino','Jokohama'))
cbind(make1, head_quarter)
