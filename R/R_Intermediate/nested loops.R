for(k in 1:10){
  
  for(l in 1:10){
    cat(l , '.l Loop of' , k , '. k Loop' , '\n')
    Sys.sleep(1)
  }
  
}

#nested loop using data sets

for (i in 1:nrow(iris)) {
  
  for(k in 1:length(iris)){
    
    text <- paste(i ,".rows ", names(iris)[k], "value equals", iris[i , k])
    print(text)
    Sys.sleep(1)
  }
}

#for loop inside of while loop
while (TRUE){
  print("New While loop started")
  for (i in 1:5) {
    print(i)
    Sys.sleep(1)
  }
  Sys.sleep(3)
}