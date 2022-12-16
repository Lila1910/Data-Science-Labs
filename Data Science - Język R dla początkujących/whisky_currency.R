whiskyDF <- read.csv(file.choose())

colnames(whiskyDF)<-str_to_lower(colnames(whiskyDF))
colnames(whiskyDF)

names(whiskyDF) <- str_replace_all(names(whiskyDF), '[.]', '_')
whiskyDF$origin <- paste(whiskyDF$region,whiskyDF$district,sep='/')
head(whiskyDF)
gsub('high/','',whiskyDF$origin, ignore.case=TRUE)
whiskyDF$UpDown <- ifelse(whiskyDF$score>0,'+','-')
head(whiskyDF)

#*
currency2019 <- read.csv(file.choose())
currency2019
install.packages('data.table')
install.packages('curl')
library(data.table)
library(curl)
currency2019 <- fread(file='waluta_2019.csv',
                      sep=';',fill=TRUE)
getwd()
setwd('C:/Users/Lila/Downloads')
head(currency2019)
tail(currency2019)
length(currency2019)
currency2019 <- currency2019[2:(nrow(currency2019)-4),]
head(currency2019)
tail(currency2019)
