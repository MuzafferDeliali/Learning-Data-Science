View(iris)

apply(iris[1:4], MARGIN = 1, FUN = mean) #Margin 1 means row and margin 2 means column

#Getting provide
iris[1 , 1:4]          #when we run like iris[1:4] it creates a data frame
class(iris[1 , 1:4])   
as.numeric(iris[1 , 1:4])#and apply wont works on data frame so we have to do class conversation
mean(as.numeric(iris[1 , 1:4]))


sd(as.numeric(iris[1 , 1:4]))
apply(iris[1:4], MARGIN = 1, FUN = sd)
apply(iris[1:4], MARGIN = 1 ,FUN = sum)

#Margin 2 means column
apply(iris[1:4] , MARGIN = 2 , FUN = sd)
apply(iris[1:4] , MARGIN = 2 , FUN = mean)
apply(iris[1:4] , MARGIN = 2 , FUN = sum)
apply(iris[1:4] , MARGIN = 2 , FUN = max)
apply(iris[1:4] , MARGIN = 2 , FUN = min)



#lapply
lapply(iris, FUN = mean)
#the diffrence between apply and lapply 
#lapply only works on row and lists

l <- list('a' = c(13,24,55,67,89,90) , 
          'b' = c(13,45,65,23,45) , 
          'c' = c(11,22,34,23,12))

lapply(l , FUN = sd)
lapply(l , FUN = mean)
lapply(l , FUN = sum)
lapply(l , FUN = max)
lapply(l , FUN = min)