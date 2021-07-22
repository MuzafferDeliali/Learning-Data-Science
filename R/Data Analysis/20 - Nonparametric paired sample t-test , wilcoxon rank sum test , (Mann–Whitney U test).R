# Nonparametric paired sample t-test / wilcoxon rank sum test / (Mann–Whitney U test)
# as i know there are atleast 3 names of it


?wilcox.test

par(mfrow=c(1,2))
hist(ins$RPostsViewed)
hist(ins$LPostsViewed)

# They don't seem like normal distributed but let's check it with shapiro test
shapiro.test(ins$RPostsViewed)
shapiro.test(ins$LPostsViewed) 

# Nope they're not normal distributed
# they're not normal distributed and as we can see in dataset it's discrete data
# so we have one option  and it's Nonparametric paired sample t-test 

median(ins$RPostsViewed)
median(ins$LPostsViewed)

# by looking medians when people saw similar contents they stop looking post

wilcox.test(x = ins$LPostsViewed , y = ins$RPostsViewed , mu = 0 , paired = T)
# P value is too low so alternative hypothesis is accepted

# Let's find confidence interval
wilcox.test(x = ins$LPostsViewed , y = ins$RPostsViewed , mu = 0 , paired = T , 
            conf.int = TRUE)
# confidence interval values are - that's because Random one has greater value than L one


wilcox.test(x = ins$LPostsViewed , y = ins$RPostsViewed , mu = -10 , paired = T , 
            conf.int = TRUE , alternative = "greater")
# p value is greater pretty high so it's less or equal than -10

# iin this case if we typed r first we will accept alternative 
wilcox.test(x = ins$RPostsViewed , y = ins$LPostsViewed , mu = -10 , paired = T , 
            conf.int = TRUE , alternative = "greater")
  