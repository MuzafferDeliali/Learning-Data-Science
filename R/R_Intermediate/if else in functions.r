f1 <- function(x){
  
  if(x %% 2 == 0){
    x2 <-x^2
    cat("it divides 2 without remaining and square of x is", x2)  
    
  }else if(x %% 3 == 0){
    x3 <-x^3
    cat("it divides 3 without remaining and  cube root of x is",x3)
  }else{
      cat("sorry it cant divide either")
    }
}

f1(10)

#another example

f2 <- function(x , y){
  if(x > y){
    r = x + y 
  }else{ #if we dont add elses x it will be undefined
    r=0
  }
  
  if(x < 10){
    r1 = x - y
  }else{
    r1 =0
  }
  
  return(r - r1)
}


#without using else
#we defined r and r1 at the beginning so if conditions doesnt work it will return value of 0

f3 <- function(x , y){
  r = 0
  r1 = 0
  
  if(x > y){
    r = x + y 
  }
  if(x < 10){
    r1 = x - y
  }
  
  return(r - r1)
}
