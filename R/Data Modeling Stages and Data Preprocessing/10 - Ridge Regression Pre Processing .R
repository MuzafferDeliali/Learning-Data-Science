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

# shortcut 

# we can remove 20 and 23th line, if we use mutate at while creating modeldata
## 
modelData <- loan %>% 
  mutate(purose_cat = as.factor(purpose_cat)) %>%
  select(loan_amount , term , income_category , purpose_cat ,
         grade , interest_payments , loan_condition , annual_inc , emp_length_int)