#Kendall Rank Correlation Test

hist(iris$Petal.Width)
hist(iris$Petal.Length)

cor.test(iris$Petal.Width , iris$Petal.Length , method = "kendall")
# correlation is not equal to 0

cor.test(iris$Petal.Width , iris$Petal.Length , method = "kendall" , alternative = "less")
# P value is "1" which it means we will accept H0
#H0 : true tau is equal or greater than 0
#Ha : true tau is less than 0

# Correlation Maris
cor(iris[,1:4] , method = "kendall")
