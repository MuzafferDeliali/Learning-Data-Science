f1 <- function(){
  x = 5
  y = 10
  z = 12
  
  return(x + y + z) #if we try to call them outside of the "{}" it will return object cant find
}

#we can give object value with like this <-
#and there wont be any difference
f2 <- function(){
  x <- 5
  y <- 10
  z <- 12
  
  return(x + y + z)
}

#but if we do it like this example anad use as <<-
#we actually can use objects outside of the function
f3 <- function(){
  x <<- 5 #but the values wont directly show up first you must run the function it will do assingments for us
  y <<- 10
  z <<- 12
  
  return(x + y + z)
}

#note :Using <<- isnt always good idea if you have x on outside of the function 
#that will make change the x and that will cause mistakes

f4 <- function(x , y){
  return(x * y)
}

#There are no difference between these 3
f4(4 , 5)
f4(x=4 , y=5) #but this is the most common way so when you return your code in the future it's much easier to understand it so sake of your mind use this one
f4(x <- 4, y <-5 )

f4(x=4,t=5) #we cant use it becuse we didnt have any t in f4 function


x = 15

f5 <- function(){
  x = 20
  y = 5
  return(x + y)
}

f5() #as you can see here it's using x as 20. That means if there is a x in the function it's first priority to use it 
#only if there are no x value in the function it will use the one who outside of function and in this casae it will return 20

x = 15
f6 <- function(){
  x <<- 20
  y <<- 22
  
  return(x + y)
}

f6() #when i run this it will override x and new value will be 20 
      #after the override x will be 20 everywhere (inside and outside of the function)

f6()
