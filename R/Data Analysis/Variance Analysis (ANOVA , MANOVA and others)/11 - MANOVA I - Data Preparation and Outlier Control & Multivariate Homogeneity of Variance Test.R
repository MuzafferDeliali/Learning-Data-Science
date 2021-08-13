library(tidyverse)
library(rstatix)

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


