v_1 <- 1:10
v_10 <- seq(10,100,10)
v_1
v_10

v_regions <- c('France', 'Spain', 'Germanny')
v_capitals <- c('Paris', 'Madrid', 'Berlin')

v_mix <- paste(v_regions, '-', v_capitals)
v_mix

mpg_values <- mtcars$mpg
mpg_values

ltr_in_g <-  0.264
km_in_m <- 0.621

ltr_100km <- mpg_values/km_in_m*ltr_in_g
ltr_100km<- 100/ltr_100km
ltr_100km
#
hp<-mtcars$hp
mean(hp)
median(hp)
sd(hp)

dev_factor <- (hp-mean(hp))/sd(hp)
round(dev_factor)
cut(hp,3)
t<-cut(hp, c(0,100,150,200,max(hp)))
table(t)
barplot(table(t))

hp_sorted <- sort(hp)
plot(hp_sorted)

p<-diff(hp_sorted)
barplot(p)
