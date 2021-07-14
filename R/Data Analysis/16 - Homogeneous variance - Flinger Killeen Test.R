# Homogeneous variance - Flinger Killeen Test

# If we're using it on non-parametric(discrete data) Flinger Killeen test is better than others

View(warpbreaks)

# H0: Normal distributed
# Ha: Not normal distributed

shapiro.test(warpbreaks$breaks[warpbreaks$wool == "A"])
shapiro.test(warpbreaks$breaks[warpbreaks$wool == "B"])

# Ha is accapted for both of them because p value is pretty low

boxplot(warpbreaks$breaks ~ warpbreaks$wool)

# Variance of B seems like equal but we can't be sure before test

fligner.test(warpbreaks$breaks ~ warpbreaks$wool)
# H0: Variance is homogeneous (p value is higher than 0.05 so it's accepted)
# Ha: Variance isn't homogeneous 

# So according to Fligner Killeen test variance of break value of these two  groups are similar to each other

library(car)
# Let's look at it with other tests 
fligner.test(warpbreaks$breaks ~ warpbreaks$wool)
leveneTest(warpbreaks$breaks ~ warpbreaks$wool)
bartlett.test(warpbreaks$breaks ~ warpbreaks$wool) # Bartlett is so sensitive that's why we get lower value on this test
# Levene is less sensitive yet p value is high enough and gives better results if it's not normal distributed

# Notes : On 2 test they are homogeneous variance so we can say it's variances are homogeneous
