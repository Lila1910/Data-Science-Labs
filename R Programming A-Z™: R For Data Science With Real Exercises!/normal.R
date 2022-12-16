counter <- 0

N <- 100000

for (i in rnorm(N)){
  if(-1<i & i<1){
    counter <- counter+1
  }
}


ans <- counter/N
ans
