f49 <- datasets::AirPassengers[1:12]
f60 <- datasets::AirPassengers[133: 144]

f49[6:9]
f60[c(6,7,8,9)]
f60/f49
f49[12]
f60[12]-f49[12]
m49 <- mean(f49)
m49
m60 <- mean(f60)
m60
f49[f49>m49]
f60[f60>m60]
f49[c(1,2,11,12)]
f49[c(-1,-12)]
f49[-7:-12]
f49[-12:-7]
#
data <- as.vector(datasets::discoveries)
year <- 1860:1959
names(data)
as.integer(names(data[data>10]))

data[c('1939','1940','1941','1942','1943','1944','1945')]
data[as.character(1939:1945)]
#
datasets::USAccDeaths
year78 <- matrix(data=datasets::USAccDeaths, ncol = 12, byrow=TRUE)[6,]
names(year78)<-c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')

v<-as.vector(USAccDeaths)
v
m<-matrix(v, ncol=12, byrow='True')
m
rownames(m)<-1973:1978
colnames(m)<-c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')
m['1974',]
m[,9]
m['1973',9]
m[as.character(1973:1974),c(7,8)]
unname(m)

#
DescTools::tarot
install.packages('DescTools')
library(DescTools)
DescTools::tarot

tarrot_cards <- DescTools::tarot$desc
tarrot_cards <- tarrot_cards[!is.na(tarrot_cards)]

numbers<-runif(length(tarrot_cards))
names(numbers)<-tarrot_cards
sort(numbers)
