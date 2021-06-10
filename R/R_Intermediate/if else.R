#If & Else
if(10 > 5){
  x = paste('10 is bigger than 5') #if is true type this
}else{
  x = paste("10 isn't bigger than 5") #if it isn't true type this
}


#cat example
x <- c(12,34,45,23,34)
mean(x)

if(mean(x) > 30){
  cat(mean(x), "is bigger than 30")
}else cat(mean(x), "isn't bigger than 30")


#cat example 2
x = c(12,14,15,16,17,12,13,18,90)

if(length(x) < 10 & median(x) > 5){
  cat('Average value of vector' , 'calculated as', mean(x)  )
}else{
  cat('Conditions not met for variable X ')
}


#Else if
if(mean(iris$Sepal.Length) < 4){
  
  print('First requirement complated') #If it's true do this
  
}else if(mean(iris$Sepal.Length) < 6){
  
  print('Second requirement complated') #If first one is wrong but this one is true , do this
  
}else{
  print("Both of them are wrong") #If all of them failed do that
}