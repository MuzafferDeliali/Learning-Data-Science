
install.packages("neuralnet")
library(neuralnet)

diabetes <- read_csv("C:/Users/Muzaffer/Desktop/Veri_Bilimi/SourceForUdemy/DataSets/diabetes.csv")
modelData <- diabetes
modelData$Outcome <- as.factor(modelData$Outcome)

library(caret)

modelScale <- preProcess(modelData , method = c("center" , "scale"))

modelDataScaled <- predict(modelScale , modelData)
View(modelDataScaled)

set.seed(165)
trainIndex <- sample(1:nrow(modelDataScaled) , size = 0.75*nrow(modelDataScaled))

trainSet <- modelDataScaled[ trainIndex ,]
testSet <- modelDataScaled[ -trainIndex ,]

nrow(trainSet)
nrow(testSet)

table(trainSet$Outcome)
table(testSet$Outcome)
table(trainSet$Outcome)


modelNN_1 <- neuralnet(Outcome ~. , data = trainSet ,
                       hidden = 1 , threshold = 0.01 ,
                       act.fct = "logistic" ,
                       linear.output = FALSE
                       )

plot(modelNN_1)
modelNN_1


modelNN_2 <- neuralnet(Outcome ~. , data = trainSet ,
                       hidden = c(2,2) , threshold = 0.01 ,
                       act.fct = "logistic" ,
                       linear.output = FALSE
)

plot(modelNN_2)


modelNN_3 <- neuralnet(Outcome ~. , data = trainSet ,
                       hidden = c(3,3) , threshold = 0.01 ,
                       act.fct = "logistic" ,
                       linear.output = FALSE
)
plot(modelNN_3)



modelNN_4 <- neuralnet(Outcome ~. , data = trainSet ,
                       hidden = c(3,3) , threshold = 0.08 ,
                       rep = 2,
                       act.fct = "logistic" ,
                       linear.output = FALSE
)
plot(modelNN_4)

#predictions

#Model 1
predModel_1 <- predict(modelNN_1 , testSet)
predModel_1C<- ifelse(apply(predModel_1, 1, which.max) == 1 , "0" , "1")
predModel_1C

#Model 2
predModel_2 <- predict(modelNN_2 , testSet)
predModel_2C<- ifelse(apply(predModel_2, 1, which.max) == 1 , "0" , "1")
predModel_2C

#Model 3
predModel_3 <- predict(modelNN_3 , testSet)
predModel_3C<- ifelse(apply(predModel_3, 1, which.max) == 1 , "0" , "1")
predModel_3C

#Model 4
predModel_4 <- predict(modelNN_4 , testSet)
predModel_4C<- ifelse(apply(predModel_4, 1, which.max) == 1 , "0" , "1")
predModel_4C

library(caret)
confusionMatrix(as.factor(predModel_1C) ,testSet$Outcome )
confusionMatrix(as.factor(predModel_2C) ,testSet$Outcome )
confusionMatrix(as.factor(predModel_3C) ,testSet$Outcome )
confusionMatrix(as.factor(predModel_4C) ,testSet$Outcome )