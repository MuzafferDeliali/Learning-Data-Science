#Spearman Correlation Test

# It's only usable when data is ordinal 

x <- c(2,3,4,1,1,3,4,5,1,2,2,3)
y <- c(3,4,4,2,1,2,5,3,1,3,3,2)

cor.test(x , y , method = "spearman")
# Ha accepted

# They have positive correlation

cor(x,y, method = "spearman")

#how to visualize Correlation
plot(iris$Sepal.Length , iris$Sepal.Width) # not exist
plot(iris$Petal.Length , iris$Petal.Width) # exist
