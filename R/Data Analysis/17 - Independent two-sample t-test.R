# Independent two-sample t-test

View(iris)

spe <- subset(iris , subset = (Species != "virginica"))

class(spe$Species)

spe$Species <- as.character(spe$Species) # we need them as character because we don't want to see empty virginica factor


View(spe)

# Let's create histogram
par(mfrow = c(1,2)) # we want to see 2 histogram so we're using this
hist(spe$Sepal.Width[spe$Species == "setosa"])
hist(spe$Sepal.Width[spe$Species == "versicolor"])

# Normality Test
shapiro.test(spe$Sepal.Width[spe$Species == "setosa"])
shapiro.test(spe$Sepal.Width[spe$Species == "versicolor"])

# Hypothesis
# H0: Normal distributed (accepted)
# Ha: Not normal distributed

# Yes they're normal but are they homogeneous?
bartlett.test(spe$Sepal.Width ~ spe$Species)

# Hypothesis
# H0: Variances are homogeneous (accepted)
# Ha: Variances aren't homogeneous

# Yes they're normal distributed and variances homogeneous
# And now we can use T test

?t.test

t.test(spe$Sepal.Width ~ spe$Species , mu = 0 , var.equal = TRUE) # it gives us alternative hypothesis so we can type H0 and Ha
# Mu = 0 means they're same and var equal is depends on the homogeneous test (it was homogeneous so we make var.equal True)

# Hypothesis
# H0: difference of means are equal = 0 difference
# Ha: true difference in means is not equal to 0

# p value is too low so H0 isn't true, Ha is accepted
# gives us confidence interval and means of both are listed on console and they're sorted as data bases species list


# What if difference is 0.7
t.test(spe$Sepal.Width ~ spe$Species , mu = 0.7 , var.equal = TRUE)
# H0 is accepted and difference is 0.7 and it's in confidence interval

# Using less and greater

t.test(spe$Sepal.Width ~ spe$Species , mu = 0.7 , var.equal = TRUE , 
       alternative = "greater")
# H0 is equal or less than 0.7
# H0 is declined and Ha is accepted


t.test(spe$Sepal.Width ~ spe$Species , mu = 0.7 , var.equal = TRUE ,
       alternative = "less")
# H0 is equal or greater than 0.7
# H0 is accepted
