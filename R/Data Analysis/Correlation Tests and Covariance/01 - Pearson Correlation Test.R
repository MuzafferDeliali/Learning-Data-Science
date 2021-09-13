# Pearson Correlation Test

View(iris)

#Which correlation test we need?
shapiro.test(iris$Sepal.Width) # Greater than 0.05 so it's normal distributed
hist(iris$Sepal.Width) # Visualized

shapiro.test(iris$Sepal.Width)
shapiro.test(iris$Petal.Width) # Not normal distributed
hist(iris$Petal.Width)

hist(iris$Sepal.Length) # approximately  normal so we can use Pearson Correlation Test

cor(iris$Sepal.Width , iris$Sepal.Length)

# We can use it by determining method
cor(iris$Sepal.Width , iris$Sepal.Length , method = "pearson")

# But is the correlation meaningful ?
cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson")


# p value is higher than 0.05 so H0 is accepted 
# True correlation is equal to 0 which that means correlation isn't meaningful

# we can say it's meaningful with %85(1-pvalue) probability 
# But we cannot say it's meaningful with %95

# Correlation Matrices
cor(iris[,1:4])
cor(iris[,1:4], method = "pearson") # Via using method we can use other tests


cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson" , alternative = "less")  
cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson" , alternative = "greater")  
