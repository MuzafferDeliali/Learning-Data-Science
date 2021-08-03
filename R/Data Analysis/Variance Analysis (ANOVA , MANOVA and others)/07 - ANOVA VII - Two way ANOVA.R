library(tidyverse)
library(rstatix)

# Two way variance analysis
df <- heart %>% filter(chol< 400 )

df %>% group_by(cp , fbs) %>% summarise(Shapiro = shapiro.test(chol)$p.value)

# according to p-value if cp and fbs is 0 cholesterol value is normal distributed
# rest of them are normal too

# Is it homogeneous ?
bartlett.test(df$chol ~ interaction(df$cp , df$fbs)) # Yes they're homogeneous too


# ANOVA Test
# we can't use interaction in aov so we will do it like this
# we can't use it as numeric 
anova_1 <- aov(df$chol ~ as.factor(df$cp) * as.factor(df$fbs))
summary(anova_1)

# p value is high so there are no meanful difference
# it's same for fbs and cp fbs  interaction

# H0 is accepted there are no meanful difference between cp , fbs

# Same thing with rstatix library
anova_test(df , dv = chol , between = c(cp , fbs))

#others
anova_1 <- aov(df$trestbps ~ as.factor(df$cp) * as.factor(df$fbs))
summary(anova_1)
anova_test(df , dv = trestbps , between = c(cp , fbs))
# independent variables affect dependent variables on cp (according to ges value)
# cb:fbs p value is too high so 8 roups similliar to each other but independents does not affect much