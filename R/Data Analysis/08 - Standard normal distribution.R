# Standard normal distribution

# The simplest case of a normal distribution is known as the standard normal distribution or unit normal distribution. 
#Therefore, the average of the obtained normal distribution is equal to 0 and its variance is equal to 1, 
#so that easier processing can be achieved. The method used for this process is called the standard normal distribution. 


# Normal distribution example
dnorm(x = 20 , mean = 15 , sd = 5)


# Standard normal distribution example
dnorm( x = 20 , mean = 0 , sd = 1) # it's basically 0
dnorm( x = 0.6 , mean = 0 , sd = 1)
dnorm( x = -0.6 , mean = 0 , sd = 1)


vec <- seq(0,1 , by = 0.001) # creating seq 0 to 1 by 0.001 increasing 

plot(x = vec , y = dnorm(x = vec, mean = 0 , sd = 1 ) , 
     bty = "L" ,
     pch = 19
)

vec2 <- seq(-1,1 , by = 0.001) # for rest of 
plot(x = vec2 , y = dnorm(x = vec2, mean = 0 , sd = 1 ) , 
     bty = "L" ,
     pch = 19
)

# How to create random standard normal distribution ?
rnorm(n = 100 , mean = 0 , sd = 1) # mean have to be 0 and sd have to 1 otherwise it will be Normal distribution , not Standard normal distribution
