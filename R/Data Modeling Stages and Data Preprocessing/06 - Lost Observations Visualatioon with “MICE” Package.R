# mice: Multivariate Imputation by Chained Equations ####

install.packages("mice")
library(VIM)
library(mice)
library(ggplot2)
names(df)

#Selecting Variables
new_df <- df[c("Acedamic.percentage.in.Operating.Systems" , 
               "percentage.in.Algorithms" ,
               "Percentage.in.Programming.Concepts" ,
               "certifications" ,
               "workshops" ,
               "reading.and.writing.skills")]

#Changing Variable Names

names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , 
                   "Certi" , "Works" , "ReadingWriting")

fig <- aggr(new_df , col = c("orange" , "red") , labels = names(new_df),
            numbers = TRUE , sortVars = TRUE , cex.axis = 0.6 , 
            ylab(c("Histogram of Missing Values" , "Patterns"))
            )

#Replacing with mice functions
?mice 
new_df$ReadingWriting

new_df$ReadingWriting <- factor(new_df$ReadingWriting ,
                                levels = c("poor" , "medium" , "excellent" ) , # min to max
                                ordered = T)

#fill the default method after reading ?mice defaultMethod * It's not random * 
imputed <- mice(data = new_df , m = 3 , maxit = 3 ,
                method = NULL , defaultMethod = c("pmm" , "logreg" , "lda" , "polr"))

# m; Number of multiple imputations. The default is m=5.
# maxit; A scalar giving the number of iterations. The default is 5.

summary(imputed)
names(imputed)

imputed$m 
imputed$imp
imputed$imp$Operating # we will pick it from these 3 

# Imputed Data
imputedData <- complete(imputed , 3) # 3 means third option
View(imputedData) # now we filled NA's with third option


# We can also give methods (in order by column names)
# for example 

imputed2 <- mice(data = new_df , m = 3 , maxit = 3 ,
                method = c("rf" , "cart" , "rf" , "sample" , "sample" , "polr"))
