## Data pre processing - Standardization

install.packages("glmnet", dependencies=TRUE)
library(caret)
library(glmnet)
library(tidyverse)

loan <- Bank_Loan_Data
names(loan)

modelData <- loan %>% select(loan_amount , term , income_category , purpose_cat ,
                grade , interest_payments , loan_condition , annual_inc , emp_length_int)

View(modelData)
num_cols <- c("annual_inc" , "emp_length_int")

# Standardization
pre_scaled <- preProcess(modelData[, num_cols] , method =c("center" , "scale"))
modelDataScaled <- predict(pre_scaled , modelData)

class(modelDataScaled$purpose_cat) #the class must be a factor, we can't use it as integer

# Standardized data set
View(modelDataScaled)
modelDataScaled$purpose_cat <- as.factor(modelDataScaled$purpose_cat)

view(modelDataScaled)

# shortcut 

# we can remove 20 and 23th line, if we use mutate at while creating modeldata
#
# modelData <- loan %>% 
#   mutate(purose_cat = as.factor(purpose_cat)) %>%
#   select(loan_amount , term , income_category , purpose_cat ,
#          grade , interest_payments , loan_condition , annual_inc , emp_length_int)
#

## One Hot Encoding Dummy Variable ####
#we use dependand variable
modelDataScaled1 <- model.matrix(loan_amount ~. , data = modelDataScaled)
head(modelDataScaled1)

# dividing as test and train
set.seed(145)
sampleTrainIndex <- sample(1:nrow(modelDataScaled1) , size = 0.8*nrow(modelDataScaled1))
trainSet <- modelDataScaled1[sampleTrainIndex,]
testSet <- modelDataScaled1[-sampleTrainIndex]

# Modelling at Ridge Regression