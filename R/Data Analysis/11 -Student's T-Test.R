# T Test

# On big data t-test might give use right answers

?t.test # mu is what we will comprise with 
        # confident level is 0,95 by default
        # alternative is two.sided by default

View(iris)

hist(iris$Sepal.Length)

shapiro.test(iris$Sepal.Length) # Not normal distributed but close to 0.05 so we can use it

t.test(iris$Sepal.Length , mu = 3 , alternative = "two.sided" , # df is degree of freedom 
       conf.level = 0.95)
  
# Hypothesis :
# H0: Mean equal test value (3)
# Ha: Mean isn't equal test value (3)

# Explanation: with 95 percent confidence level  mean isn't equal test value

result <- t.test(iris$Sepal.Length , mu = 3 , alternative = "two.sided" , # df is degree of freedom 
          conf.level = 0.95)

names(result) 

result$statistic # by this way can check specific  things


# Alternative hypothesis 

# Alternative hypothesis 1
t.test(iris$Sepal.Length , mu = 3 , alternative = "less" ,
       conf.level = 0.95)

# H0: Mean is higher or equal to 3 
# Ha: Mean is lower than 3

# p value is 1 which so H0 is accepted 
# with 95 confidence level mean is bigger than 3 or equals 

##################################

# Alternative hypothesis 2
t.test(iris$Sepal.Length , mu = 3 , alternative = "greater" ,
       conf.level = 0.95)

# H0: Mean is less or equal to 3
# Ha: Mean is greater than 3

# p value is too low so H0 isn't valid Ha is accepted
# with 95 percent trust level mean is greater than 3 



# More Examples


# is it equal 5.5
t.test(iris$Sepal.Length , mu = 5.5 , alternative = "two.sided" ,
       conf.level = 0.95)

# H0: Mean is equal to 5.5
# H1: Mean isn't equal 5.5

###########################################

# is it equal to 5.8
t.test(iris$Sepal.Length , mu = 5.8 , alternative = "two.sided" ,
       conf.level = 0.95)

# H0: Mean is equal to 5.8
# H1: Mean isn't equal 5.8

# P value is higher than 0.05 so with 95 percent confidence mean equals to 5.8 
