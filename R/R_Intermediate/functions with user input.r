
f <- function(){
  
  x = readline(prompt = "Type first number  :") #readline always takes input as character type
  y = readline(prompt = "Type second number :")
  
  
  x = as.numeric(x) #that's why we have to convert them to numeric
  y = as.numeric(y)
  
  d = x + y
  return(d)
}

#another example

f1 <- function(){
  
  x = readline(prompt = "Type first number  :") #readline always takes input as character type
  y = readline(prompt = "Type second number :")
  z = readline(prompt = "Type third number  :")
  
  x = as.numeric(x) 
  y = as.numeric(y)
  z = as.numeric(z)
  
  avg = (x + y + z)/3
  
  result = paste("Avarage of 3 number is :", avg)
  
  return(result)
}