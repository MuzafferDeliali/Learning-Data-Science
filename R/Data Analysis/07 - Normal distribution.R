# Normal distribution

?dnorm

# dnorm - Density  norm

# we want to give population value but can't give directly
# so we will use mean and sd for this

dnorm( x = 20 , mean = 30 , sd = 5) # is the probability of picking 20 in this array
dnorm( x = 25 , mean = 30 , sd = 5) 
dnorm( x = 30 , mean = 30 , sd = 5) # x 25 and 35 has same probability 
dnorm( x = 35 , mean = 30 , sd = 5) # because they have the same distance from the mean 

plot( 1:60 , dnorm( x = 1:60 , mean = 30 , sd = 5 ) ,
      xlab = "Numbers 1 to 60" ,
      ylab = "Probability" ,
      pch = 19 ,
      bty = "L")

lines(dnorm( x = 1:60 , mean = 30 , sd = 7.5 ))
lines(dnorm( x = 1:60 , mean = 30 , sd = 10 ))
lines(dnorm( x = 1:60 , mean = 30 , sd = 15 ))

# pnorm - Probability norm

# Example
# In a class average male height is 180 cm and standard deviation is 10 cm

# If we pick someone from this class what is probability of being taller than 160 cm
pnorm( q = 160 , mean = 180 , sd = 10 , lower.tail = FALSE) # It's cumulative so we will use pnorm  and the result is %97.7 

pnorm( q = 170 , mean = 180 , sd = 10 , lower.tail = TRUE)  # Shorter than 170 cm
pnorm( q = 175 , mean = 180 , sd = 10 , lower.tail = TRUE)  # Shorter than 175 cm
pnorm( q = 185 , mean = 180 , sd = 10 , lower.tail = FALSE) # Taller than 185 cm
pnorm( q = 190 , mean = 180 , sd = 10 , lower.tail = FALSE) # Taller than 190 cm

# qnorm - Quantile norm

qnorm(p = 0.70 , mean = 180 , sd = 10 , lower.tail = FALSE) # With %70 probability he will be taller 174
# Every 7 people out of 10 are taller than 174

qnorm(p = 0.70 , mean = 180 , sd = 10 , lower.tail = TRUE)
# Every 7 people out of 10 are shorter than 185 


# %90 of people are between 167cm and 192cm
# Rest of the people (%10) are shorter than 167cm or taller than 192cm
qnorm(p = 0.90 , mean = 180 , sd = 10 , lower.tail = FALSE)
qnorm(p = 0.90 , mean = 180 , sd = 10 , lower.tail = TRUE)

# rnorm - Random normal distracted

rnorm(n = 50 , mean = 40 , sd = 5) # Random 50 value with 40 mean and 5 sd
r <- rnorm(n = 50 , mean = 40 , sd = 5)

mean(r)
sd(r)

hist(r) # Let's visualize
