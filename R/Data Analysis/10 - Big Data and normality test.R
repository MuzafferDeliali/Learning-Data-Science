# Big Data and normality test

df <- StudentsPerformance

nrow(df)

hist(df$math.score)

# H0 : It's Normal distributed
# Ha : It's not normal distributed
# 0.05
shapiro.test(df$math.score) # p value is way lower than 0.05 , so H0 isn't true Ha is accepted


clean<- df$math.score[ -which( df$math.score < 30) ] # We removed <30 values and now we have cleaned data


hist(clean) # it seems normal distributed
shapiro.test(clean) # but result tells us something different.

# So why it did happened like that ?
# Because shapiro test isn't for big data
# How can we check then ? ---> By taking sample for example let's check first 100 value

# Let's  test it by pieces
shapiro.test(clean[1:100]) 
shapiro.test(clean[100:200])   # H0 is accepted

# Sample pieces
cleansample <- sample(clean , size = 100)
 hist(cleansample)
 shapiro.test(cleansample)
 
 
# Testing for multiple times 
 
pvalues <- numeric(50)
 
 for(i in 1:50){
   
   sampleA <- sample(clean , size = 100)
   result <- shapiro.test(sampleA)
   pvalue <- result$p.value
   pvalues[i] <- pvalue
}

# Average p value 
mean(pvalues)

# Explanation : With %95 confidence level H0 is accepted 
                # confidence level  comes from p = 0.05
