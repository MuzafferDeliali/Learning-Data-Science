## Multiple Linear Regression

## Multiple Linear Regression 1 - Correlation Check ####

# Australia Rain Dataset
# Humidity Forecast Model 

df_Albury <- weatherAUS[weatherAUS$Location == "Albury" ,]
df_Albury <- df_Albury[c("Humidity9am" , "MinTemp" , "MaxTemp" ,
                         "WindSpeed9am" , "Pressure9am" , "Temp9am")]


cor(df_Albury) # because of NA values it's all NA
cor(na.omit(df_Albury)) 

pairs(df_Albury , pch = 19)

## Multiple Linear Regression 2 - Imputation of Missing Values ####

library(mice)

# Which values are missing?
md.pattern(df_Albury)

#2996 of them doesnt have any na value
#6 of them has missing value at MinTemp
#4 of them has missing value at windspeed9am
#4 of them has missing value at humidty9am etc. etc.

# Imputation of NA values with mice
?mice

imputed <- mice(df_Albury , m = 5)
imputed$imp

df_Albury_imputed <- complete(imputed , 3) # we picked third imputation
md.pattern(df_Albury_imputed) # Now we don't have any NA
