# Exponential distribution
 
# Example: On bus stop on every 10 minute a bus passes over. In this case ;

# Poisson Problem : On one minute What is the possibility of bus doesn't pass over
# Exponential Problem : What is the probability of the bus will take longer 
#                       than a minute to arrive?

# For one minute Lambda value is equal to 1/10 

?dexp


# Rate value equals lambda
# Wanted pass over count int this case we will be calculate as it won't pass over 

# That's why we will type 0 car (x = 0)
dpois( x = 0 , lambda = 1/10) # Poisson


# At least it will be one minute late ( q = 1)
pexp( q = 1 , rate = 1/10 , lower.tail = FALSE) # Exponential distribution

# It pass overs within second minute
dexp(x = 2 , rate = 1/10)

# Let's take plot to when it will be pass over
plot(1:30 , dexp(1:30 , rate = 1/10) ,
     bty = "L" ,
     pch = 19 ,
     col = "red")
# What if it pass over once in every ... minute ?
lines(dexp(1:30 , rate = 1/30) , col = "black")  # 30 minute
lines(dexp(1:30 , rate = 1/15) , col = "Blue")   # 15 minute
lines(dexp(1:30 , rate = 1/5) , col = "brown")   #  5 minute



# it passes once in every 20 minute what is the probability of it takes more than 5 minute
pexp(5 , rate = 1/20 , lower.tail = FALSE) # with %77 probability it will take more than 5 minute
pexp(5 , rate = 1/20 , lower.tail = TRUE) # with %22 probability it will take less than 5 minute



# By giving probability
qexp( p = 0.7 , rate = 1/20 , lower.tail = TRUE) # it returned 24
                                                 # That means before 24th minute it will reach %70 probability

qexp( p = 0.7 , rate = 1/20 , lower.tail = FALSE)# That means after 7th minute it will reach %70 probability

qexp( p = 0.2 , rate = 1/20 , lower.tail = TRUE) # With %20 probability it will arrive before 4 min (%20 isn't much so probably it wont arrive)

# usually every 20 mi one bus arrives
rexp(n = 50 , rate = 1/20) # Simulated 50 time and this results are when will bus arrive