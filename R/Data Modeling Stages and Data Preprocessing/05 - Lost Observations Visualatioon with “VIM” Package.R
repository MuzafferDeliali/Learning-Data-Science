?VIM

install.packages("VIM")
library(VIM)
library(ggplot2)

names(df)

new_df <- df[c("Acedamic.percentage.in.Operating.Systems" ,
               "percentage.in.Algorithms" ,
               "Percentage.in.Programming.Concepts" ,
               "certifications" ,
               "workshops")]

View(new_df) 

names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , "Certification" , "Workshops")

fig <- aggr(new_df , col = c("orange" , "red") , labels = names(new_df),
            numbers = TRUE , sortVars = TRUE, cex.axis = 0.6 ,
            ylab(c("Histogram of Missing Values" , "Pattern")))


marginplot( cbind(new_df$Operating , new_df$Algorithms) )
