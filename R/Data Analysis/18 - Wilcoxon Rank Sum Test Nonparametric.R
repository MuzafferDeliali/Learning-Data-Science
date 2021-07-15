# Wilcoxon Rank Sum Test
# Also known as Mann-Whitney U 

# Note Wilcoxon looks median differences

View(warpbreaks)

shapiro.test(warpbreaks$breaks[warpbreaks$wool == "A"])
shapiro.test(warpbreaks$breaks[warpbreaks$wool == "B"])

# They're not normal distributed so we will use Wilcoxon rank sum test

# From now on we comprise A wool and B wool (i fallows the list as alphabetic) 
# (think like A-B )(and if we give mu = - something so that means B is greater than A)

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 0) 
# H0 : Location shift of the groups are equal to 0 # accepted
# Ha : Location shift of the groups aren't equal to 0 

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 0 ,
            conf.int = TRUE) # confidence interval
# difference in location value is inside of confidence interval so H0 is accepted

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 15 ,
            conf.int = TRUE) # H0 isn't accepted

# Using less and greater

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 15 ,
            conf.int = TRUE , alternative = "less")
# H0 : Location shift of the groups equals or greater than 15
# Ha : Location shift of the groups is less than 15
# P value is too low H0 is declined Ha is accepted


wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 15 ,
            conf.int = TRUE , alternative = "greater")
# H0 : Location shift of the groups equals or less than 15
# Ha : Location shift of the groups is greater than 15
# P value is pretty high H0 is accepted it's equals or less than 15


#example
wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 10 , 
            conf.int = TRUE , alternative = "less")
# H0 : Location shift of the groups equals or greater than 10
# Ha : Location shift of the groups is less than 10

# P value is pretty low so Ha is accepted 

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 2 , 
            conf.int = TRUE , alternative = "less")
# H0 Location shift of the groups equal or greater than 2
# Ha Location shift of the groups less than 2

# H0 is accepted A-B breaks are equal or greater than 2
# Which it means A is at least greater than 2 

#Let's control median difference
aggregate( x = warpbreaks$breaks ,
           by = list(warpbreaks$wool) ,
           FUN = median) # yes as mean A is greater than B and it's equal or more than 2 (in this case A-B is 2 so it's greater by 2 )
