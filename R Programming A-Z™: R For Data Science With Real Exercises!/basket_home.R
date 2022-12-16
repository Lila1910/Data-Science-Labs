x <- c('a','b','c','d','e')
x

myplot <- function(data, rows=1:10){
  matplot(t(data[rows,,drop=F]), type='b', pch=15:18, col=c(1:4,6))
  legend('bottomleft', inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Salary/MinutesPlayed)


FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
FreeThrows
colnames(FreeThrows) <- 2005:2014

FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
FreeThrowAttempts
colnames(FreeThrowAttempts) <- 2005:2014
myplot(FreeThrowAttempts/Games)
myplot(FreeThrows/FreeThrowAttempts)
myplot(Points-FreeThrows/FieldGoals)
