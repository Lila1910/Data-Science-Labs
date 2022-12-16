#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

profit <- revenue-expenses
round(profit/1000,0)
?print()
profitax <- round(profit*0.7,2)
profitax
margin <- round((profitax/revenue),2)*100
margin
average <- mean(profitax)
for (i in 1:12){
  if (profitax[i] > average){
    print(i)
  }
}

for (i in 1:12){
  if (profitax[i] < average){
    print(i)
  }
}

for(i in 1:12){
  if(profitax[i]==max(profitax)){
    print(i)
  }
}

for(i in 1:12){
  if(profitax[i]==min(profitax)){
    print(i)
  }
}
