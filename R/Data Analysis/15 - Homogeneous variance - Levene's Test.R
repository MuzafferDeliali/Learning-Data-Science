# Homogeneous variance - Levene's Test

library(car)
?leveneTest



View(iris)
leveneTest()

df <- subset(iris , subset = (Species != "virginica"))

# first dependent variable than independent variable
boxplot(df$Sepal.Width ~ as.character(df$Species))

leveneTest(df$Sepal.Width ~ as.character(df$Species))

# Hypothesis:
# H0:Variants are homogeneous
# Ha:Variants aren't homogeneous

# Value is higher than 0.05 so H0 is accepted

leveneTest(df$Sepal.Width ~ as.character(df$Species))
bartlett.test(df$Sepal.Width ~ as.character(df$Species))

# Higher the p value it gets more homogeneous

shapiro.test(df$Sepal.Width[df$Species == "versicolor"])
shapiro.test(df$Sepal.Width[df$Species == "setosa"])

# Both of them has higher value than 0.05 so we can say they're normal distributed

# Notes
# If they are normal distributed use Bartlett test
# If it's not normal distributed use levene test