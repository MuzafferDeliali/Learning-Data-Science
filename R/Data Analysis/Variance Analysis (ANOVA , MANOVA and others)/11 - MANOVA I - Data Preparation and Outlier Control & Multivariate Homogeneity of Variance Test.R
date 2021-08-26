library(tidyverse)
library(rstatix)
#### Data Preparation and Outliner Control ####
heart %>% group_by(cp) %>% 
  summarise(ShapiroResult = mshapiro_test(cbind(chol, thalach))$p.value) # instead of using cbind we can use as.dataframe 

# only cp = 2  does not show a multivariate normal distribution(according to chol and thalac values)

?identify_outliers
identify_outliers(heart["chol"])
identify_outliers(heart["thalach"])

# is 71 min or max 
quantile(heart$thalach) # it's minimum

heart <- heart %>% filter( chol < 394 & thalach > 71)

# let's chechk normality again
heart %>% group_by(cp) %>% 
  summarise(ShapiroResult = mshapiro_test(cbind(chol, thalach))$p.value)

# Yes mostly they changed but cp=2 one is still not normal but it's only one value so we can use MANOVA

#### Multivariate Homogeneity of Variance Test ####

install.packages("heplots")
library(heplots)

# now we multivariate version of tests
#bartlettTests()
#leveneTests

?bartlettTests

bartlettTests(y = heart[c("chol" , "thalach")], group = heart$cp)
# H0 is accepted variances are homogeneous

leveneTests(y = heart[c("chol" , "thalach")], group = heart$cp)
# they return different results but still p is high enough to say the variance is homogeneous

leveneTest(heart$chol , heart$cp) # as we can see it's same result but this one only returned chol

#### Checking the Homogeneity of Box's M Covariance Matrices ####
?box_m

#co-variance
cov(heart$chol , heart$thalach)

#Result is - which it means they're still in co- but reversed

box_m(heart[c("chol" , "thalach")] , group = heart$cp)
#PS:
# Data must be data frame 
# Group must be vector

# H0 : Co-variance matrices are homogeneous
# Ha : Co-variance matrices are not homogeneous

#### Manova data analytics application ####
?manova
# dependence variables should use as data frame that's why we will use cbind
model <- manova( cbind(chol , thalach) ~ cp , data = heart)
summary(model)

#H0 isn't accepted
#Ha is accepted there are difference between chest pains

#lineer model
model2 <- lm( cbind(chol , thalach) ~ cp , data = heart)

# Disclaimer use right manova
# We will use Manova which it's in car model

library(car)
Manova(model2 , test.statistic = "Pillai")

# if we use lm we have use Manova not "manova" this is alternative version

#### Using PostHoc tests after manova ####

# POST HOC Tests
library(tidyverse)

grouped <- heart %>% gather(key="variable" , value="values" , thalach ,chol) %>%
          group_by(variable)

grouped


#Welch Anova Test
library(rstatix)
#convert_as_factor came with rstatix

grouped %>% convert_as_factor(cp) %>%
        welch_anova_test(values ~ cp)
#we can do same thing by using anova_test

# thalch is low so h0 declined, ha accepted the difference exist 


#Tukey HSD Test
#if homogeneous variance exist use Tukey HSD if it doesn't exist we will use games howell test
grouped %>% convert_as_factor(cp) %>%
        tukey_hsd(values ~ cp)
#thalach group1 = 0(cp) ones has meanful difference

#Games-Howell Test
#uses rstatix aswell

#if homogeneous variance doesn't exist we will use games howell test
grouped %>% convert_as_factor(cp) %>%
        games_howell_test(values ~ cp)
