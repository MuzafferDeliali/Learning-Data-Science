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
