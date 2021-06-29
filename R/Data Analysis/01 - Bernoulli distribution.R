# Bernoulli distribution

install.packages("Rlab") # Necessary library for Bernoulli 
library(Rlab)

?dbern # The Bernoulli Distribution documentation

# Success rate is 0.6
dbern(x = 0 , prob = 0.6)

# Success rate is 0.7
dbern(x = 0 , prob = 0.7)
dbern(x = 1 , prob = 0.7)
dbern(x = 2 , prob = 0.7) # X can be 1 or 0 nothing more

# Picking black ball  chance 0.4
dbern(x = 0 , prob = 0.4)

#Pbern function

pbern(q = 1 , prob = 0.7, lower.tail = FALSE , log.p = FALSE) #Lower tail calculates cumulatively also adding dbern values
#Lower tail checks lower than 1
#Upper tail checks bigger than 1 and it will return 0 because it can't be bigger than 1 

# Note lower.tail is documented in ?dbern

pbern(q = 1 , prob = 0.7, lower.tail = FALSE)
pbern(q = 0 , prob = 0.7, lower.tail = FALSE)

#Qbern function
qbern(p = 0.5 , prob = 0.7 , lower.tail = TRUE)

#Rber Random Bern
rbern(n = 50 , prob = 0.7) #Tries 50 times with 0.7 probability
r <- rbern(n = 50 , prob = 0.7)
table(r)


r2 <- rbern(n = 50 , prob = 0.2)
table(r2)