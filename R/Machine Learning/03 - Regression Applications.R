### Regression Application ###

# Regression Application 1 - Separation of Train and Test

model_data <- house[c("price" , "sqft_living")]

#random sample

set.seed(145)
sampleIndex <- sample(1:nrow(model_data) , size = 0.8*nrow(model_data))

trainSet <- model_data[sampleIndex , ]
testSet <- model_data[-sampleIndex , ]

nrow(trainSet)
nrow(testSet)