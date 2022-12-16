getwd()
setwd('C:/Users/Lila/Documents/RData')
airDF <- read.csv('2008.csv')

head(airDF,2)
colnames(airDF)

dest_JFK <- airDF[airDF$Dest=='JFK',]

jfkDF <- subset(airDF, airDF$Dest=='JFK')

jfkDF$ArrDelayClass <- ifelse(is.na(jfkDF$ArrDelayClass),'-',
                              ifelse(jfkDF$ArrDelay<=0, 'B',
                              ifelse(jfkDF$ArrDelay<=15,'S',
                                     ifelse(jfkDF$ArrDelay<=60,'M','L'))))

jfk_delay_class <- table(jfkDF$ArrDelayClass)
plot(jfk_delay_class)
sum(jfk_delay_class)==nrow(jfkDF)
jfk_missing_class <- sum(is.na(jfkDF$ArrDelayClass))
#
jfk_arr_df <- subset(jfkDF$Origin=='JFK')
jfk_dep_df <- subset(jfkDF$Dest=='JFK')
groups <- seq(0,2400,100)
jfk_arr_groupped <- cut(jfk_arr_df$ArrTime, groups)
jfk_arr_by_period <- table(jfk_arr_groupped)
names(jfk_arr_by_period) <- head(groups,-1)
plot(jfk_arr_by_period)
#
head(sort(table(airDF$UniqueCarrier)),10)
head(sort(table(airDF$Month)),10)
head(sort(unique(airDF$Distance),decreasing = TRUE),10)
head(sort(table(airDF$TailNum),decreasing = TRUE),10)
#
agg_mean <- aggregate(airDF, by=list(airDF$Origin, airDF$Dest),FUN=mean,na.rm=TRUE)
head(agg_mean[order(agg_mean$Cancelled,decresing=TRUE), c('Group.1','Group.2','Cancelled')],100)
head(agg_mean[order(agg_mean$DepDelay,decresing=TRUE), c('Group.1','Group.2','DepDelay')],100)
#
install.packages('magrittr')
library(magrittr)
plot(head(sort(table(paste(airDF$Origin, airDF$Dest)), decreasing = TRUE),n=10))
paste(airDF$Origin, airDF$Dest) %>%
  table() %>% sort(decresing=TRUE) %>% head(n=10) %>%
  plot()

ts1 <- airDF[airDF$ArrDelay < airDF$DepDelay, c('Month','DepDelay','ArrDelay')]
ts2 <- aggregate(ts1, by=list(airDF[airDF$ArrDelay < airDF$DepDelay,'Month']), FUN=sum)
ts1 <- airDF[airDF$ArrDelay < airDF$DepDelay, c('Month','DepDelay','ArrDelay')] %>%
  aggregate(by=list(airDF[airDF$ArrDelay < airDF$DepDelay,'Month']), FUN=sum)

ts3 <- ts2$DepDelay - ts2$ArrDelay
plot(ts3)
ts1$DepDelay - ts1$ArrDelay %>% plot()
#
tapply(airDF$ArrDelay, airDF$UniqueCarrier, mean, na.rm=TRUE) %>%
  sort(decreasing=TRUE) %>% head()
# (A = carrier, B = weather, C = NAS, D = security)
# http://stat-computing.org/dataexpo/2009/the-data.html

cancellDF <- data.frame(code=c('A','B','C','D'),
                        reason_name=c('carrier','weather','NAS','security'))
is_cancelled <- (airDF$Cancelled==1) & !is.na(airDF$Cancelled) & !is.na(airDF$CancellationCode)

cancell_reason <- tapply(airDF$Year[is_cancelled], airDF$CancellationCode[is_cancelled], lenght)

cancellDF$Number <- cancell_reason[as.vector(cancellDF$code)]
#
sfoDF <- airDF[(airDF$Origin=='SFO')&!is.na(airDF$Cancelled)&!is.na(airDF$DepDelay),]
max_delay = 240
compensation <- 80
nrow(sfoDF)
nrow(sfoDF[sfoDF$DepDelay>max_delay,])
nrow(sfoDF[sfoDF$Cancelled==1])
nrow(sfoDF[sfoDF$Cancelled==1])*compensation
simulation_240 <- within(sfoDF, {max_delay=240;sfoDF$Cancelled[sfoDF$DepDelay>max_delay]<-1})
with(sfoDF, {max_delay=240;sfoDF$Cancelled[sfoDF$DepDelay>max_delay]<-1;sum(Cancelled)*compensation})
head(simulation_240)
getwd()
write.csv(simulation_240, file='/RData/sim.csv')
#
install.packages('lubridate')
library(lubridate)
crimes <- crimes[, c('OFFENSE_DESCRIPTION', 'OCCURRED_ON_DATE')]
crimes$WEEK_DAY <- Weekday(crimes$OCCURED_ON_DATE)
crimes$YEAR <- Year(crimes$OCCURED_ON_DATE)
crimes$MONTH <- Month(crimes$OCCURED_ON_DATE)
crimes$DAY <- Day(crimes$OCCURED_ON_DATE)
tapply(crimes$YEAR, list(crimes$YEAR,crimes$MONTH), length, na.rm=TRUE)
crimes_per_weekday <- tapply(crimes$YEAR, crimes$WEEK_DAY, mean, na.rm=TRUE)
total_crimes <- nrow(crimes)
plot(100*crimes_per_weekday/total_crimes)
#
is_known <- !is.na(airDF$TailNum) & (airDF$TailNum!='')
plane_long_distance <- tapply(airDF$Distance[is_known], airDF$TailNum[is_known], sum, na.rm=TRUE) %>% sort(decreasing = TRUE) %>% head(10)
all_planes <- unique(airDF$TailNum[is_know])
planes_to_check <- all_planes[all_planes %in% names(plane_many_flights) | all_planes %in% names(plane_long_distance) & all_planes %in% names(plane_long_airtime)]
to_check <- planes[planes$tailnum %in% planes_to_check,]
plot(table(as.character(to_check$manufacturer)))
#
origin <- 'JFK'
destination <- 'MIA'
count_connections1 <- function(origin, destination){
  sum(airDF[airDF$Origin==origin & airDF$Dest==destination & airDF$Cancelled==0])
}
count_connections1('JFK','MIA')
count_connections2 <- function(row){
  origin <- row['Origin']
  destination <- row['Dest']
  sum(airDF[airDF$Origin==origin & airDF$Dest==destination & airDF$Cancelled==0])
}
my_info <- data.frame(
  Origin = c('JFK', 'JFK', 'MIA', 'MIA', 'SEA', 'SEA'),
  Dest = c('MIA', 'SEA', 'JFK', 'SEA', 'JFK', 'MIA')
)
?apply
my_info$number_of_flights <- apply(my_info, 1, count_connections2)
