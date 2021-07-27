install.packages("rstatix")
library(tidyverse)
library(rstatix)

# Note all codes bellow for between groups 

?identify_outliers

# identify_outliers works on data frames so we will use it this way
outliners <- identify_outliers(heart["chol"])
outliners

# now we have to remove outliners from df 

df <- heart %>% filter(chol < 349) # we find this values from "outliners"
max(df$chol)

# Grouping age 
# By using seq we select where it will be start and end , by length.out will determinate how many 
# pieces it will have and all of them and cut it into  equal pieces 

#Note: if we give 4 to length out there will be 3 pieces  so don't forget it's n-1

df_new <- df %>% group_by(
  age_groups = cut( age , breaks = seq(min(age)-1 , max(age) + 1 , length.out = 4) )
)
# let's check how it's divided
levels(df_new$age_groups)

df_new1 <- df_new %>% select(age_groups , chol)

# Normality test
df_new1 %>%
  group_by(age_groups) %>%
  summarise(ShapiroResults = shapiro.test(chol)$p.value)

# Variance Homogeneity Test 
# They're normal so we can use bartlett or levene

bartlett.test(df_new1$chol ~ df_new1 $age_groups) #First dependent variable then independent one
# Yes they're similar

# Let's check with levene test tho
library(car)
leveneTest(df_new1$chol ~ df_new1$age_groups)
# Yes they're similar


# ANOVA TEST
# There are two way for this , one of them comes with rstatix library 
                             # the other one is already inside of R Studio

# Between group
anov <- aov(df_new1$chol ~ df_new1$age_groups)

summary(anov)
# H0 : All groups are equal to each other
# Ha : At least one of them different others

# P value is less than 0.05 H0 declined , Ha accepted

# Let's check which one(s) is different
df_new1 %>% group_by(age_groups) %>%
            summarise( Averages = mean(chol , na.rm = T))
# we can use postok test tho for comprising each other and find which one is different


# Normality of residual values
shapiro.test(anov$residuals) # if residuals are normal too our model is right


?anova_test
class(df_new1) #we have to convert them to df 
df_new1 <- as.data.frame(df_new1)
anova_test(df_new1 , dv = chol , between = age_groups)
# dv = depended variable
# DFn = groups degree of freedom
# DFd = populations degree of freedom
# * means it's meanful and Ha alternative is right

plot(df_new1 %>% group_by(age_groups) ,
     main = "Connection Between Age & Cholesterol " ,
     xlab = "Age Groups" ,
     ylab = "Cholesterol ")
