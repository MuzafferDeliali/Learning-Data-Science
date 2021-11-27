# Basic Linear Progression Model

View(airquality)

# Linear Model
# Depended variables on left , independent ones on right side
model <- lm( Ozone ~ Temp , data = airquality)
model
summary(model)

# the Coefficients values looks good so it's significance  (both p values are lower than )
# "*" indicates significance

# F-statistic 's p value shows us significance of the model
# in this case our model is significant