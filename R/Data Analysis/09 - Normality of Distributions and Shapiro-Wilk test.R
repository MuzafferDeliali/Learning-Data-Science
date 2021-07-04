# Normality of Distributions and Shapiro-Wilk test 

View(iris)

hist(iris$Sepal.Length)

shapiro.test(iris$Sepal.Length) # p value is based on W 
# depending on p value either we accept H0 Hypothesis or we will reject the H0 and move to Ha hypothesis


shapiro.test(iris$Sepal.Width) # p is more  than 0.05 so H0 hypothesis is valid and we will accept it 

# Visualize sepal length and sepal width histograms side by side

par(mfrow = c(1,2))
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

# As we can see on width histogram it's obviously normal distributed

# Shapiro-Wilk shouldnt use on big data it may give wrong results