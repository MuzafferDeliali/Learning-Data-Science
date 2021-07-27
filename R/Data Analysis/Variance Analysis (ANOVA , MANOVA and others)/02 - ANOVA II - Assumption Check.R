install.packages("rstatix")
library(tidyverse)
library(rstatix)

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