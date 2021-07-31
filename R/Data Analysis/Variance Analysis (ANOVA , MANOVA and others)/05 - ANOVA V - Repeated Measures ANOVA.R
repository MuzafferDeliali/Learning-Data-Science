install.packages("ggplot2")
install.packages("ggpubr")

library(ggpubr) # This package will be use while we visualize
library(tidyverse)
library(rstatix)

# Within subjects ANOVA =  Repeated Measures

final <- dtest %>% gather(key = "Groups" , value = "Scores" ,
                   ADesign , BDesign , CDesign) %>%
                   convert_as_factor(Groups)

ggboxplot(final , x = "Groups" , y = "Scores" , color = "black")
plot(final)
#both do the same

anova_test(final , dv = "Scores" , within = "Groups") #it will return error because we didn't specify wid

ids <- c(rep(seq(1,100) , 3)) # 1 to 100 repeat 3 time
final$wid = ids # with that we specify there are 100 people and matched them with same people (sort them with wid you'll get it)
anova_test(final , dv = "Scores" , within = "Groups" , wid = "wid")

# p value is too low which that means with %95 probability at least one of them are from different group 
# ges value is too high so groups are effecting scores by a lot

# if p value were critical place , for example 0.06 , we were suppose to check Sphericity Corrections