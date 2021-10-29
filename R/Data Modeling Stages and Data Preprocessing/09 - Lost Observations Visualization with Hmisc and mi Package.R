## Hmisc and mi ####

install.packages("Hmisc")
install.packages("mi")

library(Hmisc)
library(mi)

df <- student_placement_data_with_NA

new_df <- df[c("Acedamic.percentage.in.Operating.Systems" , 
               "percentage.in.Algorithms" ,
               "Percentage.in.Programming.Concepts" ,
               "certifications" ,
               "workshops" ,
               "reading.and.writing.skills")]

names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , 
                   "Cert" , "Works" , "ReadingWriting")

View(new_df)

new_df$ReadingWriting <- factor(new_df$ReadingWriting , 
                                levels = c("poor" , "medium" , "excellent"),
                                ordered = T
)

?impute # Hmisc package
?aregImpute # Hmisc package

result <- impute(new_df$Operating , fun = median)
as.numeric(result)

result <- aregImpute(~ Operating + Algorithms + Concepts + Cert ,
                     data = new_df , n.impute = 3)

names(result)
result

?mi

result <- mi(new_df , n.iter = 1)
result

summary(result)