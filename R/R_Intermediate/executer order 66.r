#EXECUTE ORDER 66

x = 5
l = 1

while(x < 10) {
  if (l == 1){
    print("rechiving orders")
  }  
 
  if(l == 66){
    cat("The time has come. Execute order", l)
    break
  }
  cat("The loop completed", l, "times ", "\n" )
  l = l + 1
  Sys.sleep(0.2)
  
}