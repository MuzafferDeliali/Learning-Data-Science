## Multiple Linear Regression

## Multiple Linear Regression 1 - Correlation Check ####

# Australia Rain Dataset
# Humidity Forecast Model 

df_Albury <- weatherAUS[weatherAUS$Location == "Albury" ,]
df_Albury <- df_Albury[c("Humidity9am" , "MinTemp" , 
                         "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]


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
library(mice)
?mice

imputed <- mice(df_Albury , m = 5)
imputed$imp

df_Albury_imputed <- complete(imputed , 3) # we picked third imputation
md.pattern(df_Albury_imputed) # Now we don't have any NA

## Multiple Linear Regression 3 - Multiple Linear Regression Model ####

set.seed(145)
sampleIndex <- sample(1:nrow(df_Albury_imputed) , size = 0.8*nrow(df_Albury_imputed))

trainSet <- df_Albury_imputed[sampleIndex , ]                      
testSet <- df_Albury_imputed[-sampleIndex , ]                      

View(trainSet)                      
names(trainSet)
model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)

# or instead typing all columns we can use "." 
model1.a <- lm(Humidity9am ~ . , data  = trainSet)

model1
summary(model1)

# seems like pressure doesn't effect , we can remove it

  model2 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSet)

model2
summary(model2)

# AIC
AIC(model1 , k = 8) # K = coefficient of variance 
AIC(model2 , k = 7)

# BIC
BIC(model1)
BIC(model2)

# Residual plots
plot(model2)

testSet2 <- testSet[-5]
predictions <- predict(model2 , testSet2)
predictions

# Difference between predictions and real values
library(caret)

R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)

summary(testSet2$Humidity9am)

## Multiple Linear Regression 4 - Cook's Distance Outlier Detection ####

diste <- cooks.distance(model2)
diste

olcut1 <- mean(diste)*3
olcut2 <- 4 / length(diste)

olcut1Index <- which(diste > olcut1)
olcut2Index <- which(diste > olcut2)

# How many outliers exist
length(olcut1Index)
length(olcut2Index)

plot(1:length(diste) , diste , type = "p" , ylim = range(diste)*c(1,0.7))
abline( h = olcut1 , col = "red")

trainSetRemovedOut <- trainSet[-olcut1Index , ]