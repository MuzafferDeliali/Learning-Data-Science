## Multiple Linear Regression

## Multiple Linear Regression 1 - Correlation Check 

# Australia Rain Dataset
# Humidity Forecast Model 

df_Albury <- weatherAUS[weatherAUS$Location == "Albury" ,]
df_Albury <- df_Albury[c("Humidity9am" , "MinTemp" , "MaxTemp" ,
                         "WindSpeed9am" , "Pressure9am" , "Temp9am")]


cor(df_Albury) # because of NA values it's all NA
cor(na.omit(df_Albury)) 

pairs(df_Albury , pch = 19)