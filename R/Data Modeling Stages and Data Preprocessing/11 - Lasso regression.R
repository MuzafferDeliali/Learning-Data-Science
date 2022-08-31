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
