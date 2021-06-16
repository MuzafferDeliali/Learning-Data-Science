#Creating functions
toplama <- function(x , y){
  
  
  result = x + y
  
  return(result)
}

toplama(13,12)

#Also there is a Easier way to do it 
divide <- function(x , y){
  
  return(x/y) #Like this one
}
divide(16,4)

#complex version
newfunction <- function(x,y){
  t = x + y
  b = x / y
  z = x * y
  
  result = (t + b)/z
  return(result)
}

newfunction(15,30)