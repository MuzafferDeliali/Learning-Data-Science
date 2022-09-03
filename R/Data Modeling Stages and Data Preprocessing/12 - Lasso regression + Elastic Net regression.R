## Creating model and model evaluation ####

View(mtcars)

library(tidyverse)
library(glmnet)
library(caret)

modelData <- mtcars %>% mutate(
                            cyl = as.factor(cyl),
                            vs = as.factor(vs),
                            am = as.factor(am),
                            gear = as.factor(gear),
                            carb = as.factor(carb)
)

class(modelData$cyl)

modelDataDummy <- model.matrix( ~. , data = modelData)
View(modelDataDummy)

set.seed(155)
sampleTrainIndex <- sample(1:nrow(modelDataDummy), size = 0.75*nrow(modelDataDummy))

trainData <- modelDataDummy[sampleTrainIndex , ]
testData <- modelDataDummy[sampleTrainIndex , ]

trainDataX <- trainData[, -c(1,2)]
trainDataY <- trainData[, 2]

testDataX <- testData[, -c(1,2)]
testDataY <- testData[, 2]

lambdas <- 10^seq(2, -2 , by = -0.01)
fitGl <- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = lambdas)
fitGl

plot(fitGl , xvar = "lambda")
legend("right" , lwd = 1 , col = 1:nrow(trainDataX) , legend = colnames(trainDataX))

## Assigning a Cross Validation Lambda Value ####

fitGLCV <- cv.glmnet(trainDataX , trainDataY , alpha = 1 , lambda = lambdas)
# Option grouped=FALSE enforced in cv.glmnet, since < 3 observations per fold # 
# this happens because we're trying 24 to fold 10 
nrow(trainDataX)

## correct way
fitGLCV <- cv.glmnet(trainDataX , trainDataY , alpha = 1 , lambda = lambdas , nfolds = 3)
plot(fitGLCV)

best_lambda <- fitGLCV$lambda.min

# Model performance

fitGlLasso <- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = best_lambda)
fitGlLasso$beta
fitGlLasso

#let's make predictions
predictions <- predict(fitGlLasso , testDataX)

# and now let's compare it with the real ones
R2(predictions , testDataY) # deviance values are closer to each other which it's good
MAE(predictions , testDataY)
RMSE(predictions , testDataY)


# OLS model
fitGlOLS <- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = 0)
fitGlOLS$beta

predictionsOLS <- predict(fitGlOLS , testDataX)

R2(predictionsOLS , testDataY)
MAE(predictionsOLS , testDataY)
RMSE(predictionsOLS , testDataY)

###### Elastic Net Regression Model ####

fitElastic <- glmnet(trainDataX , trainDataY , alpha = 0.5 , lambda = lambdas)
fitElastic

plot(fitElastic , xvar = "lambda")
cv.glmnet() #not usable for cross validation

## Elastic net cross validation ####
library(caret)

trControl = trainControl(method = "repeatedcv" , number = 3 ,
             repeats = 5,
             search = "random",
             verboseIter = TRUE)

fitElasCV <- train(trainDataX, trainDataY, method = "glmnet",
                   tuneLength = 30,
                   trControl = trControl,
                   preProcess = c("center" , "scale"))

#Aggregating results
#Selecting tuning parameters
#Fitting alpha = 0.21, lambda = 1.22 on full training set

fitElasCV$bestTune
fitElasCV$finalModel


## Cross validation alpha and lambda tune grid ####
trControlGrid = trainControl(method = "repeatedcv" , number = 3 ,
                         repeats = 5,
                         verboseIter = TRUE)
#{base}
gridAlphaLambda <- expand.grid(alpha = seq(0,2, by= 0.25) ,
                              lambda = seq(0,2, by= 0.20)
                              )
gridAlphaLambda

fitElasCVGrid <- train(trainDataX, trainDataY, method = "glmnet",
                   tuneGrid = gridAlphaLambda,
                   trControl = trControl,
                   preProcess = c("center" , "scale"))


fitElasCVGrid$bestTune
fitElasCVGrid$finalModel

# estimation and evaluation
fitElasCV$bestTune

predictModel <- glmnet(trainDataX , trainDataY , alpha = 0.3638, lambda = 1.3935)
predictions_1 <- predict(predictModel, testDataX)
predictions_1

caret::R2(predictions_1 , testDataY)
caret::RMSE(predictions_1 , testDataY)
caret::MAE(predictions_1 , testDataY)

## Lowest square  #####
predictio_LS <- predict(fitGlOLS , testDataX)
predictio_LS

caret::R2(predictio_LS , testDataY)
caret::RMSE(predictio_LS , testDataY)
caret::MAE(predictio_LS , testDataY)