#### Chi-Square Goodness of Fit Test ####
# The difference between chi-square and binom is ; binom only works for 2 but chi-square can be used for more

# Chi-Square = sum( (Oi-Ei)^2 /Ei)
# Oi means observed , Ei means expected
# if Chi-Square is used on 2 category the expected value must be at least 5

q1 <- SPSS_Gorus_Anketi$`Mesleðim gereði istatistik yazýlýmlarýný kullanmayý öðrenmem gerekir.`
table(q1)

length(q1)
0.20*55

?chisq.test
#we will not use as vector we will use as frequency
chisq.test(table(q1))
##PS First hypothesis always will be equality 

#Hypothesis:
# H0 : Expected values are equal to observed values
# Ha : Expected values are not equal to observed values
# 0.0002 < 0.05 | %95 trust level 
# H0 isn't accepted

#for better view
result <- chisq.test(table(q1))
result$expected
result$observed #as we can see they're not same 

result1 <- chisq.test(table(q1) , p = c(0.1 , 0.2 , 0.5 , 0.1 , 0.1)) #By doing this we can adjust our expected
result1$observed
result1$expected

result1
#Hypothesis:
# H0 : Expected values are equal to observed values
# Ha : Expected values are not equal to observed values
# 0.59 < 0.05 | %95 trust level 
# As result H0 is accepted

result2 <- chisq.test(table(q1) , p = c(0.05 , 0.2 , 0.5 , 0.15 , 0.1))
# Expected values shouldn't lower than 5