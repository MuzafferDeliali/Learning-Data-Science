
#While Loop
#the diffrence between while and for is ; for loops works limited eras 1:20 etc

#But with while function we can make endless loops
x = 10

while (x > 5) {
  
  print("It's Works")
  Sys.sleep(1) #added 1 second delay
  
  
}

x = 5
l = 1

while(x < 10) {
  
  cat("The loop completed", l, "times ", "\n" )
  l = l + 1
  Sys.sleep(1)

}


while(x < 10) {
  
  cat("The loop completed", l, "times ", "\n" )
  if(l == 6){
    x = 11
    cat("i am gonna terminate the program")
  }
  l = l + 1
  Sys.sleep(1)
  
}