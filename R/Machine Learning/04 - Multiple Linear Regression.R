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

## Multiple Linear Regression 5 - Model Comparison ####

model3 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
summary(model3)
summary(model2)

AIC(model3 , k = 7)
BIC(model3)
AIC(model2 , k = 7)
BIC(model2)

## New Model
predictions3 <- predict(model3, testSet2)
R2(predictions3 , testSet2$Humidity9am)
RMSE(predictions3 , testSet2$Humidity9am)
MAE(predictions3 , testSet2$Humidity9am)

## Old Model
predictions <- predict(model2, testSet2)
R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)

## Multiple Linear Regression 6 - Detecting Multicollinearity with VIF ####
## Variance Inflation Factors

library(car)
?vif

vif(model3)
modelVif1 <- lm(Humidity9am ~ MinTemp + MaxTemp +
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif1)

summary(modelVif1)
summary(model3)

# let's check it without min temperature and max temperature
# without MinTemp
modelVif2 <-  lm(Humidity9am ~ MaxTemp + Temp9am +
                   Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
# without MaxTemp
modelVif3 <-   lm(Humidity9am ~ MinTemp + Temp9am +
                    Rainfall + WindSpeed9am , data  = trainSetRemovedOut)

vif(modelVif3)
summary(modelVif3)

# Model comparison with test set ##
# Vif3
predictionsVif3 <- predict(modelVif3 , testSet2)
R2(predictionsVif3 , testSet2$Humidity9am)
RMSE(predictionsVif3 , testSet2$Humidity9am)
MAE(predictionsVif3 , testSet2$Humidity9am)

# Vif2
predictionsVif2 <- predict(modelVif2 , testSet2)
R2(predictionsVif2 , testSet2$Humidity9am)
RMSE(predictionsVif2 , testSet2$Humidity9am)
MAE(predictionsVif2 , testSet2$Humidity9am)

# Vif1
predictionsVif1 <- predict(modelVif1 , testSet2)
R2(predictionsVif1 , testSet2$Humidity9am)
RMSE(predictionsVif1 , testSet2$Humidity9am)
MAE(predictionsVif1 , testSet2$Humidity9am)

# vif2 returns best results #

## Multiple Linear Regression 7 - Dummy variables and One hot encoding ####

# Dummy Variable ##
#  A dummy variable is either 1 or 0 and 1 can be represented as either True or False
# and 0 can be represented as False or True depending upon the user. This variable is used to 
# categorize the characteristic of an observation. For example, a person is either male or female, 
# is either good or bad, etc. Further, new columns will be made accordingly which will specify
# if the person is male or not as the binary value of gender_m and if the person is female or not 
# as the binary value of gender_f. 

# One hot encoding ##
# In this technique, the categorical parameters will prepare separate columns for both Male and Female labels.
# So, wherever there is Male, the value will be 1 in Male column and 0 in Female column, and vice-versa. 
# Consider the data where fruits and their corresponding categorical values and prices are given.


# Multiple Linear Regression 7 - Building a Model with Categorical Data ####

df_albury <- weatherAUS[ weatherAUS$Location == "Albury"  , ]
nrow(df_albury)

names(df_albury)
df_albury <- df_albury[c("Humidity9am" , "MinTemp" , 
                         "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury) , pch = 19)



##  Kayıp Gözlemeler

library(mice)

## Kayıp Gözlem Örüntüsü
md.pattern(df_albury)

## İmputation
imputed <- mice(df_albury , m = 5)
names(imputed)
imputed$imp

## Veri setini doldurma (Complate)
df_albury_Imputed <- complete(imputed , 3)
md.pattern(df_albury_Imputed)


## Çoklu Doğrusal Regresyon

set.seed(145)
sampleIndex <- sample(1:nrow(df_albury_Imputed) , size = 0.8*nrow(df_albury_Imputed))

trainSet <- df_albury_Imputed[sampleIndex , ]
testSet <- df_albury_Imputed[-sampleIndex , ]

View(trainSet)
names(trainSet)
model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)
# model1 <- lm(Humidity9am ~ . , data  = trainSet)

model1
summary(model1)

model2 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSet)
summary(model2)

AIC(model1 , k = 8)
AIC(model2 , k = 7)

BIC(model1)
BIC(model2)

# Artık plotları 
plot(model2)

testSet2 <- testSet[-5]

predictions <- predict(model2 , testSet2)

library(caret)

R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)

# Cook's Distance 

dist <- cooks.distance(model2)
olcut1 <- mean(dist)*3
olcut2 <- 4 / length(dist)

olcut1Index <- which(dist > olcut1)
olcut2Index <- which(dist > olcut2)

olcut1
length(olcut1Index)
length(olcut2Index)


plot(1:length(dist) , dist , type="p" , ylim = range(dist)*c(1,0.07))
abline( h = olcut1 , col = "red")


trainSetRemovedOut <- trainSet[-olcut1Index , ]

### Model Kaşılaştırmaları

model3 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
summary(model3)
summary(model2)

AIC(model3 , k = 7)
BIC(model3)
AIC(model2 , k = 7)
BIC(model2)

## Yeni Model
predictions3 <- predict(model3 , testSet2)
R2(predictions3 , testSet2$Humidity9am)
RMSE(predictions3 , testSet2$Humidity9am)
MAE(predictions3 , testSet2$Humidity9am)
# Eski Model
predictions <- predict(model2 , testSet2)
R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)


## VIF Varyans Şişkinlik Faktörü

library(car)
?vif
vif(model3)

modelVif1 <- lm(Humidity9am ~ MinTemp + MaxTemp + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif1)

summary(modelVif1)
summary(model3)


modelVif2 <- lm(Humidity9am ~ MinTemp + Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif2)
summary(modelVif2)


modelVif3 <- lm(Humidity9am ~ Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)

vif(modelVif3)
summary(modelVif3)

# Test veri seti üzerinden model değerlendirme 
predictionsVif3 <- predict(modelVif3 , testSet2)
R2(predictionsVif3 , testSet2$Humidity9am)
RMSE(predictionsVif3 , testSet2$Humidity9am)
MAE(predictionsVif3 , testSet2$Humidity9am)

predictionsVif2 <- predict(modelVif2 , testSet2)
R2(predictionsVif2 , testSet2$Humidity9am)
RMSE(predictionsVif2 , testSet2$Humidity9am)
MAE(predictionsVif2 , testSet2$Humidity9am)

predictionsVif1 <- predict(modelVif1 , testSet2)
R2(predictionsVif1 , testSet2$Humidity9am)
RMSE(predictionsVif1 , testSet2$Humidity9am)
MAE(predictionsVif1 , testSet2$Humidity9am)



### Aşamalı Regresyon StepWise Regression 


model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)

step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )
## Burada presure9am çıakrtılıyor
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )


## Backward Geri DOğru gitme
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = trainSetRemovedOut) )
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = df_albury_Imputed) )

# Both / Çift Yönlü 
step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )

# Model kaydetme
modelStep <- step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
                    Rainfall + WindSpeed9am + Pressure9am )

modelStep


# Multiple Linear Regression 8 - Stepwise regretions ####

levels(weatherAUS$Location)
df_albury_cat <- weatherAUS[ weatherAUS$Location == "Albury" | 
                               weatherAUS$Location == "Bendigo" | 
                               weatherAUS$Location == "Sydney", ]
nrow(df_albury_cat)

names(df_albury)
df_albury_cat <- df_albury_cat[c("Humidity9am" , "Location", "MinTemp" , 
                                 "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]
df_albury_cat$Location <- as.character(df_albury_cat$Location )
df_albury_cat$Location <- as.factor(df_albury_cat$Location )

df_albury_cat <- na.omit(df_albury_cat)

# Train Test split
set.seed(145)
sampleIndex <- sample(1:nrow(df_albury_cat) , size = 0.8*nrow(df_albury_cat))

trainSet <- df_albury_cat[sampleIndex , ]
testSet <- df_albury_cat[-sampleIndex , ]


model1Cat <- lm(Humidity9am ~ Location + MinTemp + MaxTemp + Temp9am + 
                  Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)

summary(model1Cat)

predictionsCat <- predict(model1Cat , testSet)

library(caret)

R2(predictionsCat , testSet$Humidity9am)
RMSE(predictionsCat , testSet$Humidity9am)
MAE(predictionsCat , testSet$Humidity9am)

## #####
#### Çoklu Doğrusal Regresyon 

### Australia Rain Dataset
### Nem oranı tahmin modeli

df_albury <- weatherAUS[ weatherAUS$Location == "Albury"  , ]
nrow(df_albury)

names(df_albury)
df_albury <- df_albury[c("Humidity9am" , "MinTemp" , 
                         "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury) , pch = 19)



##  Lost observ
library(mice)

## Kayıp Gözlem Örüntüsü
md.pattern(df_albury)

## İmputation
imputed <- mice(df_albury , m = 5)
names(imputed)
imputed$imp

## Veri setini doldurma (Complate)
df_albury_Imputed <- complete(imputed , 3)
md.pattern(df_albury_Imputed)


## Çoklu Doğrusal Regresyon

set.seed(145)
sampleIndex <- sample(1:nrow(df_albury_Imputed) , size = 0.8*nrow(df_albury_Imputed))

trainSet <- df_albury_Imputed[sampleIndex , ]
testSet <- df_albury_Imputed[-sampleIndex , ]

View(trainSet)
names(trainSet)
model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)
# model1 <- lm(Humidity9am ~ . , data  = trainSet)

model1
summary(model1)

model2 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSet)
summary(model2)

AIC(model1 , k = 8)
AIC(model2 , k = 7)

BIC(model1)
BIC(model2)

# Artık plotları 
plot(model2)

testSet2 <- testSet[-5]

predictions <- predict(model2 , testSet2)

library(caret)

R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)

# Cook's Distance 

dist <- cooks.distance(model2)
olcut1 <- mean(dist)*3
olcut2 <- 4 / length(dist)

olcut1Index <- which(dist > olcut1)
olcut2Index <- which(dist > olcut2)

olcut1
length(olcut1Index)
length(olcut2Index)


plot(1:length(dist) , dist , type="p" , ylim = range(dist)*c(1,0.07))
abline( h = olcut1 , col = "red")


trainSetRemovedOut <- trainSet[-olcut1Index , ]

### Model Kaşılaştırmaları

model3 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
summary(model3)
summary(model2)

AIC(model3 , k = 7)
BIC(model3)
AIC(model2 , k = 7)
BIC(model2)

## New Model
predictions3 <- predict(model3 , testSet2)
R2(predictions3 , testSet2$Humidity9am)
RMSE(predictions3 , testSet2$Humidity9am)
MAE(predictions3 , testSet2$Humidity9am)
# Old Model
predictions <- predict(model2 , testSet2)
R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)


## VIF Varyans Şişkinlik Faktörü

library(car)
?vif
vif(model3)

modelVif1 <- lm(Humidity9am ~ MinTemp + MaxTemp + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif1)

summary(modelVif1)
summary(model3)


modelVif2 <- lm(Humidity9am ~ MinTemp + Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif2)
summary(modelVif2)


modelVif3 <- lm(Humidity9am ~ Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)

vif(modelVif3)
summary(modelVif3)

# Test veri seti üzerinden model değerlendirme 
predictionsVif3 <- predict(modelVif3 , testSet2)
R2(predictionsVif3 , testSet2$Humidity9am)
RMSE(predictionsVif3 , testSet2$Humidity9am)
MAE(predictionsVif3 , testSet2$Humidity9am)

predictionsVif2 <- predict(modelVif2 , testSet2)
R2(predictionsVif2 , testSet2$Humidity9am)
RMSE(predictionsVif2 , testSet2$Humidity9am)
MAE(predictionsVif2 , testSet2$Humidity9am)

predictionsVif1 <- predict(modelVif1 , testSet2)
R2(predictionsVif1 , testSet2$Humidity9am)
RMSE(predictionsVif1 , testSet2$Humidity9am)
MAE(predictionsVif1 , testSet2$Humidity9am)



### Aşamalı Regresyon StepWise Regression 


model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)

step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )
## Burada presure9am çıakrtılıyor
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )


## Backward 
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = trainSetRemovedOut) )
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = df_albury_Imputed) )

# Both way
step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )

# Let's save the Model 
modelStep <- step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
                    Rainfall + WindSpeed9am + Pressure9am )

modelStep
