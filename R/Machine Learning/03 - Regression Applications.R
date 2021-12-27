### Regression Application ###

## Regression Application 1 - Separation of Train and Test ####

model_data <- house[c("price" , "sqft_living")]

# Random sample

set.seed(145)
sampleIndex <- sample(1:nrow(model_data) , size = 0.8*nrow(model_data))

trainSet <- model_data[sampleIndex , ]
testSet <- model_data[-sampleIndex , ]

nrow(trainSet)
nrow(testSet)

## Regression Application 2 - Examination of trainSet and Checking Outliers ####
cor(trainSet) # There is a positive correlation and it's 0.69

hist(trainSet$price)
hist(trainSet$sqft_living)
#There are outliers we have to  do normalization

# But first we have to do correlation graph
library(ggplot2) 

fig <- ggplot(data = trainSet , aes(x = sqft_living , y = price)) +
        geom_point(size = 2) +
        xlab("Sqft Living") + ylab("Prices")
fig
# Even thought our outliers has correlation we have to remove them from data set
# But we don't have enough data at extreme values and that's the reason of removing

library(outliers)
scores <- scores(trainSet , type = "z" , prob = 0.95)

# If any value is true we will remove them
any.True <- apply(scores , 1 , FUN = function(x) {any(x == TRUE)} ) # 
any.True #  as we can see third one is true

index <- which(any.True) # which rows has True

trainSetRemovedOutliers <- trainSet[-index , ] # now we assign non outliers to trainSetRemovedOutliers

nrow(trainSet)
nrow(trainSetRemovedOutliers) # apparently we were have 1508 outliers

fig <- ggplot(data = trainSetRemovedOutliers , aes(x = sqft_living , y = price)) +
  geom_point(size = 2) +
  xlab("Sqft Living") + ylab("Prices")
fig

cor(trainSetRemovedOutliers) # now we have less correlation
# Depending the situation we will keep using trainSet or trainSetRemovedOutliers

# Some notes: #
# Missing value check
library(mice)
md.pattern(trainSet)
# If we were have missing values at beginning we would use imputation of missing values

## Regression Application 3 - Modelling and Estimation ####

model1 <- lm(price ~sqft_living , data = trainSet)
model2 <- lm(price ~sqft_living , data = trainSetRemovedOutliers)

summary(model1)
summary(model2)

AIC(model1)
BIC(model1)
AIC(model2)
BIC(model2)

summary(model1) # Estimated value per sqft_living 280
## Regression Application 4 - Valuation on Data Set ####

# Prediction 

model1Pred <- predict(model1, testSet)
model2Pred <- predict(model2, testSet)

model1PredData <- data.frame("actuals" = testSet$price , "predictions" = model1Pred)
model2PredData <- data.frame("actuals" = testSet$price , "predictions" = model2Pred)

View(model1PredData)
View(model2PredData)

model1_err <- model1PredData$actuals - model1PredData$predictions
model2_err <- model2PredData$actuals - model2PredData$predictions

mse1 <- sum(model1_err^2) / nrow(model1PredData)
mse2 <- sum(model2_err^2) / nrow(model2PredData)

sqrt(mse1);sqrt(mse2) # model1 has lower error value
# which it was the one who outliers are not removed

## Regression Application 5 - R2, MSE and MAE ####

# We use these metrics to calculate errors so we can pick whom fit us

install.packages("caret")
library(caret)

#R2 (R Squared)
R2(model1PredData$predictions , model1PredData$actuals)
R2(model2PredData$predictions , model2PredData$actuals)

#Root Mean Squared Error
RMSE(model1PredData$predictions , model1PredData$actuals)
RMSE(model2PredData$predictions , model2PredData$actuals)

#Mean Absolute Error
MAE(model1PredData$predictions , model1PredData$actuals)
MAE(model2PredData$predictions , model2PredData$actuals)