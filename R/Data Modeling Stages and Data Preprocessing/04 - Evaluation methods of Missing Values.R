# Evaluation methods of Missing Values 

# And why are we using these methods ####
df <- student_placement_data_with_NA
# How to find missing values
is.na(df)
ids <- which(is.na(df)) #index of missing values
length(ids)  #There are 39000 missing value
df_new <- na.omit(df)

nrow(df)
nrow(df_new) # omit isn't always useful , be careful
#That's why we will use these methods


#Mean Imputation ####

nas <- which(is.na(df$Acedamic.percentage.in.Operating.Systems))
avg <- mean(df$Acedamic.percentage.in.Operating.Systems , na.rm = TRUE) # mean of Acedamic.percentage.in.Operating.Systems without na values counted
round(avg) # rounded decimal to the integer 

df$Acedamic.percentage.in.Operating.Systems[nas] <- round(avg) # na values replaced with mean

# In this case we can use this method because na ratio isn't too much
length(nas)
length(df$Acedamic.percentage.in.Operating.Systems)

#Substitution ####
#Hot Deck Imputation ####
#Cold Deck Imputation ####
#Regression Imputation ####
#Stochastic Regression Imputation