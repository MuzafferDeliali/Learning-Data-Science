# Homogeneous variance - Barlett Test

View(iris)

df <- subset(iris , subset = ( Species != "setosa")) # filtered  setosa

View(df)

shapiro.test(df$Sepal.Width[df$Species == "versicolor"]) # before using benet test we should check are they normal distributed or not
shapiro.test(df$Sepal.Width[df$Species == "virginica"])

boxplot( df$Sepal.Width ~ as.character(df$Species)) #if we don't add as.character it will take setosa (even if we filtered it before)

# it seems similar to each other but we can't be sure without testing it

bartlett.test( df$Sepal.Width ~ as.character(df$Species))

# Hypotheses
# H0 : They're homogeneous (similar to each other)
# Ha : They're not homogeneous (similar to each other)

# p value is pretty high so they're homogeneous (for sepal.with of versicolor and virginica)



boxplot( df$Sepal.Length ~ as.character(df$Species)) 
bartlett.test( df$Sepal.Length ~ as.character(df$Species))

# p values is bigger than 0.05 so H0 is accepted again