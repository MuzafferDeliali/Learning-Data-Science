# Binom distribution

?dbinom

dbinom # only one
pbinom # cumulative
qbinom # with probability
rbinom # random binom

# Success rate is 0.7 , unsuccessful  rate = 1 - 0.7 = 0.3

dbinom(x = 5 , size = 10 , prob = 0.7) # We are searching for can we success 5 times and try 10 times
dbinom(x = 7 , size = 10 , prob = 0.7)

plot( x = 1:30 , y = dbinom(x = 1:30 , size = 30 , prob = 0.7) ,
      bty = "L" ,
      pch = 19)


lines(dbinom(x = 1:30 , size = 30 , prob = 0.5) ,
      bty = "L" ,
      pch = 19)


# Top point of the graph is equal to 0.7 of the chart
# If prob were 0.5 the top point will be at 15


plot( x = 1:30 , y = dbinom(x = 1:30 , size = 30 , prob = 0.51) ,
      bty = "L" ,
      pch = 19)
# 5 times or more success rate

pbinom( q = 5 , size = 30 , prob = 0.7 , lower.tail = TRUE)   # Lower than 5 times (as default it's lower.tail True)
pbinom( q = 16 , size = 30 , prob = 0.7 , lower.tail = FALSE) # Higher than 16 times
pbinom( q = 16 , size = 30 , prob = 0.7 , lower.tail = TRUE)  # Lower than 16 times


pbinom( q = 10 , size = 30 , prob = 0.7 , lower.tail = TRUE)  # 10 times or less  10 >= x
pbinom( q = 10 , size = 30 , prob = 0.7 , lower.tail = FALSE)  # More than 10     10 < x

# Cumulative calculations 
pbinom( q = 10 , size = 30 , prob = 0.7 , lower.tail = TRUE) # They do same with longer version

dbinom(x = 10 , size = 30 , prob = 0.7 ) +
  dbinom(x = 9 , size = 30 , prob = 0.7 )+
  dbinom(x = 8 , size = 30 , prob = 0.7 )+
  dbinom(x = 7 , size = 30 , prob = 0.7 )+
  dbinom(x = 6 , size = 30 , prob = 0.7 )+
  dbinom(x = 5 , size = 30 , prob = 0.7 )+
  dbinom(x = 4 , size = 30 , prob = 0.7 )+
  dbinom(x = 3 , size = 30 , prob = 0.7 )+
  dbinom(x = 2 , size = 30 , prob = 0.7 )+
  dbinom(x = 1 , size = 30 , prob = 0.7 )+
  dbinom(x = 0 , size = 30 , prob = 0.7 )

# Example :
# On average, 1 out of 4 customers coming to an e-commerce site is shopping. 
# 30 customers are expected to enter this e-commerce site for a day. 
# What is the probability of making at least 10 purchases? 

m <- 1/4

pbinom(q = 9 , size = 30 , prob = m , lower.tail = FALSE) # it's cumulative
                                                          # Result is 0.19 so almost %20 will do


# How many times do we get according to the probability value? 
qbinom(p = 0.7 , size = 30 , prob = m , lower.tail = FALSE) # With %70 probability More than 6 out of 30  times customers will do

qbinom(p = 0.7 , size = 30 , prob = m , lower.tail = TRUE)  # 9 or fewer customers out of 30 will buy with a probability of 0.7. 

# Random binomial distributed datas

rbinom(n = 50 , size = 30 , prob = m)
d <- rbinom(n = 50 , size = 30 , prob = m) # if we increse prob value our top point will move to right

hist(d ,
     main = "How many times they will buy somethings" ,
     xlab = "item count" ,
     ylab = "How many times")
# The results are hot many time they will buy something from 30 customer and tried it 50 times