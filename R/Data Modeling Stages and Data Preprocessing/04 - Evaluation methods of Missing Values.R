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
#Hot Deck Imputation (Random inputs)####

set.seed(155)
rnorm(2)

rnorm(2)

set.seed(155)#if we give same seed we will get same values
rnorm(2)

index <- which(is.na(df$Acedamic.percentage.in.Operating.Systems))
length(index)

random <- sample(df$Acedamic.percentage.in.Operating.Systems[-index], size = 1) #taking sample without na 
random

x <- df$Acedamic.percentage.in.Operating.Systems
x[index] <- random #na values are replaced with sample
which(is.na(x)) # for checking

# Original 
mean(df$Acedamic.percentage.in.Operating.Systems, na.rm = T)

# After Hot deck imputation
mean(x)

# Taking more than one sample
random_many <- sample(df$Acedamic.percentage.in.Operating.Systems[-index] ,
                      size = length(index))

random_many
y <- df$Acedamic.percentage.in.Operating.Systems
y[index] <- random_many

# Comparetion between them
mean(df$Acedamic.percentage.in.Operating.Systems, na.rm = T) # original
mean(x) # one random sample
mean(y) # all random sample

# so if we will use Hot deck imputation , it's better to take sample size as na length

#Cold Deck Imputation (closest inputs)####

df <- student_placement_data_with_NA
index <- which(is.na(df$percentage.in.Algorithms))
length(index)

index[1]
names(df)

#certification
#workshop

df[c("certifications" , "workshops")][index[1] , ]

subs <-subset(df ,
       select = c("percentage.in.Algorithms" , "certifications" , "workshops") ,
       subset = ( certifications == "python" & workshops == "data science" ) )

View(subs)

avg <- mean(subs$percentage.in.Algorithms , na.rm = T)

df$percentage.in.Algorithms[index[1]] <- avg
df$percentage.in.Algorithms[31]


#Regression Imputation ####
#Stochastic Regression Imputation