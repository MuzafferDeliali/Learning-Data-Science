## AMELIA: Multiple Imputation of Incomplete Multivariate Data ####

install.packages("Amelia")
library(Amelia)
?amelia

# MCAR ####
# Missing completely at random (MCAR) – like “flipping a coin” whether to answer a
# question; missing data does not depend on the observed or the missing data

# MAR ####
# Missing at random (MAR) – something known (from the data or another source) makes a
# person less likely to answer a question; missing data depends on the observed data and does
# not depend on non-observed data

# MNAR #### 
# Missing not at random (MNAR) (Non-ignorable missingness)– something 
# (not known/measured) makes a person less likely to answer a questions; the missing data
# depends on something not observed 








df <- student_placement_data_with_NA

#Selecting Variables ----
new_df <- df[c("Acedamic.percentage.in.Operating.Systems" , 
               "percentage.in.Algorithms" ,
               "Percentage.in.Programming.Concepts" ,
               "certifications" ,
               "workshops" ,
               "reading.and.writing.skills")]


#Changing Variable Names ----
names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , 
                   "Certi" , "Works" , "ReadingWriting")

fig <- aggr(new_df , col = c("orange" , "red") , labels = names(new_df),
            numbers = TRUE , sortVars = TRUE , cex.axis = 0.6 , 
            ylab(c("Histogram of Missing Values" , "Patterns"))
)

result <- amelia(x = new_df , m = 3 , 
          noms = c("Certi" , "Works") ,
          ords = c("ReadingWriting") )

names(result)
result$imputations

write.amelia(result , file.stem = "results")