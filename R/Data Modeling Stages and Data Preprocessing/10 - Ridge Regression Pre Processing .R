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
pre_scaled <- preProcess(modelData[, num_cols] , method =c("center" , "scale"))

modelDataScaled <- predict(pre_scaled , modelData)
class(modelDataScaled$purpose_cat)

View(modelDataScaled)

modelDataScaled$purpose_cat <- as.factor(modelDataScaled$purpose_cat)
view(modelDataScaled)
