movies <- read.csv(file.choose())
head(movies)
colnames(movies) <- c('DayOfYear','Director','Genre','MovieTitle','ReleaseDate','Studio','AdjustedGross','Budget','Gross','IMDbRating','MovieLensRating','Overseas','Overseas%','Profit','Profit%','Runtime','US','GrossUS')
colnames(movies)

mov2 <- movies[(movies$Genre=='action')|(movies$Genre=='adventure')|(movies$Genre=='animation')|(movies$Genre=='comedy')|(movies$Genre=='drama'),]
str(mov2)
str(movies)
head(mov2)                 
colnames(mov2)

mov3 <- mov2[(mov2$Studio=='Buena Vista Studios')|(mov2$Studio=='Fox')|(mov2$Studio=='Paramount Pictures')|(mov2$Studio=='Sony')|(mov2$Studio=='Universal')|(mov2$Studio=='WB'),]
str(mov3)
colnames(mov3)

install.packages('extrafont')
library(extrafont)
font_import()
y
fonts()

p <- ggplot(data=mov3, aes(x=Genre, y=GrossUS))

q <- p+geom_jitter(aes(size=Budget,colour=Studio))+geom_boxplot(alpha=0.5)

q <- q + ggtitle('Domestic Gross % by Genre')+xlab('Genre')+ylab('Gross%US')+
  theme(axis.title.x = element_text(colour='blue',size=15),
        axis.title.y = element_text(colour='blue',size=15),
        plot.title = element_text(size=20))
q$labels$size <- 'Budget $M'
q
