# Poisson distribution

?dpois

# 15 cars pass over the bridge in an hour 

# What is the possibility of 20 cars pass over the bridge in an hour ?
dpois(x = 20 , lambda = 15)

# What is the possibility of 5 cars pass over the bridge in an hour ?
dpois(x = 5 , lambda = 15) # when we compare the two of them this is way far away from lambda value that's why this returns lower value

plot(1:30 , dpois( 1:30 , lambda = 15) ,
     bty = "L" ,
     pch = 19 ,
     col = "red" ,
     xlab = "Amount of cars")

lines(dpois( 1:30 , lambda = 20) , lwd = 2 , col = "blue") # Line of what we wanted

# 20 cars pass over the bridge in an hour
# we want to see it by minute (20/60 = 1/3)

dpois(x = 2 , lambda = 1/3) # in this case we want 2 cars in a minute and  lambda is value of cars passed in a minute
dpois(x = 1 , lambda = 1/3) # it returns bigger value because 1 car possibility is way closer to lambda value rather than 2 car

# Ppoisson - cumulative probability

# probability of only one car pass over in a minute lambda = 1/3

ppois( q = 2 , lambda = 1/3 , lower.tail = FALSE) # probability more than 2 cars 
  # Because of we want more that 2 we will use upper.tail(upper.tail func doesn't exist so we will use lower.tail = FALSE)

# using lower.tail
ppois( q = 2 , lambda = 1/3 , lower.tail = TRUE) # probability of less than 2 cars 

### Example :
### A Machine Learning algorithm has been added on the e-Commerce site and it is desired to predict
# the probability of making sales by predicting the products that customers may like with the algorithm.
# 20 customers make a purchase. In what is by any other 1-hour time period at noon in the possibility of making more than 30 sales? 

ppois( q = 30 , lambda = 20 , lower.tail = FALSE)

# More than 15 purchase chance
ppois( q = 15 , lambda = 20 , lower.tail = FALSE) # 0.84 means %84 chance


#   Finding x by probability value 
qpois( p = 0.6 , lambda = 15 , lower.tail = TRUE) #  with %60 probability less than 16 cars
qpois( p = 0.2 , lambda = 15 , lower.tail = TRUE) #  with %20 probability less than 12 cars
qpois( p = 0.9 , lambda = 15 , lower.tail = FALSE) # with %90 probability more than 10 cars
qpois( p = 0.2 , lambda = 15 , lower.tail = FALSE) # with %20 probability more than 18 cars
# by running probability we find how many car will pass

# How to create random poisson data
rpois(n = 50 , lambda = 25) # 50 times returns values and values are around 25


rpois(n = 100 , lambda = 10) # 100 times returns values and values are around 10
