v_used_space_pct <- c(50, 98, 98, 80, 70, 92, 85, 88, 85, 91)
v_disk_size_gb <- c(100, 300, 500, 200, 160, 80, 900, 740, 220, 100)

v_used_space_gb <- v_used_space_pct*v_disk_size_gb*0.01
v_used_space_gb

v_free_space_gb <- v_disk_size_gb-v_used_space_gb
v_free_space_gb

v_trend_growing <- c(T,T,F,F,T,F,F,F,T,T)

v_alert <- rep(NA, 10)
v_alert

for (i in 1:10){
  if (v_used_space_pct[i]>=90){
    v_alert[i]=T
  }
  else if (v_used_space_pct[i]>=80 & v_trend_growing[i]==T){
    v_alert[i]=T
  }
  else{
    v_alert[i]=F
  }
}

#other way

v_alert <- v_used_space_pct >= 90 | v_used_space_pct >= 80 & v_trend_growing
v_alert
