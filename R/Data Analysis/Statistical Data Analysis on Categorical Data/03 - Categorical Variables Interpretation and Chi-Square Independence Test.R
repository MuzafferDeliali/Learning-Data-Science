#### Frequency Table of Two Categorical Variables Interpretation of the Relationship Over ####

df1 <- data.frame(x= SPSS_Gorus_Anketi$`Mesleðim gereði istatistik yazýlýmlarýný kullanmayý öðrenmem gerekir.` , 
                  y= SPSS_Gorus_Anketi$`Sosyal bilimler alanýnda uygulanmýþ istatistiksel çalýþmalarý incelemekten keyif alýrým.`)

table(df1$x , df1$y)
table(df1) # it does same thing both can be used
# with this way can compare  answers

#### Chi-Square Test of Independence ####
#### Chi-Square Test of Association ####
prop.table(table(df1)) # With this way can find ratio of it
tbl <- table(df1)
chisq.test(tbl)
result <- chisq.test(tbl)

result$observed
result$expected
chisq.test(tbl)
# Because of expected values are low we get 

# Hypothesis
# H0 : Two values are independent from each other. There are no relationship.
# Ha : Two values are dependent from each other. The relationship exist.(Accepted)

# P value is too low so H0 is declined and Ha is accepted and there is a meaningful relationship. 

# how to find degree of freedom on chi square 
# n-1 * k-1 (unique rows - 1) * (unique column - 1)

# without the test we can say diagonal vectors high so relationship exist.

####  Fisher's Exact Test ####

library(tidyverse)

df2 <- df1%>% filter (x %in% c('Katýlýyorum' , 'Katýlmýyorum') & 
                      y %in% c('Katýlýyorum' , 'Katýlmýyorum'))
                      
df1$x %in% c('Katýlýyorum' , 'Katýlmýyorum')
head(df2)
table(df2)

fisher.test(table(df2))
# p-value is greater than  0.05 so odd ratio is equal to 1
# If it is greater than 1, it is positively similar. If it's less it negative similarity

# An odds ratio of 1.5 means the odds of the outcome in group A happening are 
# one and a half times the odds of the outcome happening in group B

# How to calculate odds ration on paper:
# Odd ratio = (a/c) / (b/d)  
# in our case it's  (9/3) / (7/1) = 3/7 

# How to calculate reporting odds ration(ROR) on paper:
# ROR = (a/b) / (c/d)

fisher.test(table(df1))
# H0: The two variables are independent of each other. No relationship.
# Ha: The two variables are dependent of each other. Relationship exist. 

# H0 is accepted.

table(df2)
# 2 x 2 odds ratio table
fisher.test(table(df2))
fisher.test(table(df2) , alternative = 'less')
fisher.test(table(df2) , alternative = 'greater')

# 5 x5 table
fisher.test(table(df1))
