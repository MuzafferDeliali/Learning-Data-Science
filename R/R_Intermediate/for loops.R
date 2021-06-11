for(i in 1:10){
  
  print(i)
  
}

x <- c(12,14,15,17,18)

for(i in x){
  print(i)
}

for(i in length(x):1){
  
  print(x[i])
  
}

#With if elses
z <- c(12,14,15,16,18,23,85,23,45,36,75)

for (i in 1:length(z)){
  
  if(z[i] %% 2 == 0){
     cat(i, ".Result" ,z[i], "==> is even number \n")
    
  }else{cat(i,".Result",z[i], "==> is odd number \n")} #(z[i] %% 2 == 1) şekilinde de yapılabilir
}