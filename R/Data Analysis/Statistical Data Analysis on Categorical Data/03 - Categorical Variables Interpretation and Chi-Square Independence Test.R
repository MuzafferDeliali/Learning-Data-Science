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