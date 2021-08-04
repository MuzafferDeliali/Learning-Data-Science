library(tidyverse)

heart %>% group_by(cp) %>% summarise(Normality = shapiro.test(oldpeak)$p.value)
# first 3 group has pretty low so H0 is declined they're not normal distributed
# only cp = 3 groups is normal distributed

# only one of them isn't  enough for using ANOVA we have to check for are they homogeneous or not
bartlett.test(heart$oldpeak ~ heart$cp) # p value is too low so it's not homogeneous / variances aren't similar 

# we will use non parametric test Krusal Wallis test
# it's like wilcoxon rank sum but Krusal Wallis works with more than two group
?kruskal.test

kruskal.test( x = heart$oldpeak , g = as.factor(heart$cp))
# H0 : There are no difference between groups
# Ha : At least one of them is difference than the others

# p value is too low Ha is accepted
# Which that means chest pain level effects old peak values

# if we want to find which ones are  different we have to use Dunn's test