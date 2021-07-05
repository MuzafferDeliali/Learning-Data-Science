# Non-Parametric Wilcoxen signed rank test

?wilcox.test # if we give value to  y we can compare 2 of them

hist(warpbreaks$breaks) # not normal distributed it's skewed right (That's one of the reason why we used wilcoxen test)
shapiro.test(warpbreaks$breaks) # p value is too low so it's not normal distributed

#if it's not normal distributed we will use wilcoxen test

wilcox.test(x = warpbreaks$breaks , # While testing non parametric use median not mean
            mu = 40 )
# H0 : Median equals to 40
# Ha : Median isn't equal 40 

# Ha : Approved with 95 percent trust confidence

median(warpbreaks$breaks)



# Alternative (less than 40)
wilcox.test( x = warpbreaks$breaks ,
             mu = 40 , 
             alternative = "less")

# H0 : Median equals or greater than 40
# Ha : Median value lesser than 40

# p value is too low so Ha accepted  with 95 percent

############################################################

# Alternative (greater than 40)
wilcox.test( x = warpbreaks$breaks ,
             mu = 40 , 
             alternative = "greater")

# H0 : Median equals or less than 40
# Ha : Median value greater than 40

# p value is very high so Ha accepted

###########################################################

