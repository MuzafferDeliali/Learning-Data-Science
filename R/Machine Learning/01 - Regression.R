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

# Coefficient of determination AKA r square
model <- lm(formula = Ozone ~ Temp, data = airquality)

summary(model)
# if temp increase 1 , ozone will increase 2.42

# Residual values
model$residuals
resi <- as.numeric(model$residuals)

plot(resi ,
     ylab = "Residual Value")

# or we can use this (don't forget to Hit <Return> to see next plot:)
plot(model)

# Mahalonobis Distance Control of Outliers 

plot(airquality$Ozone , airquality$Temp)

summary(model)

air <- na.omit(airquality[c("Ozone" , "Temp")])
View(air)

air.center = colMeans(air)
air.center
air.cov = cov(air)
air.cov

distance <- mahalanobis(air , center = air.center , cov = air.cov)
distance

cutoff <- qchisq(p = 0.95 , df = 2)
cutoff

index <- which(distance > cutoff)
air_new <- air[-index , ]

model2 <- lm(Ozone ~Temp , data = air_new)
model2 # without outliers
model # with outliers

summary(model2)
# as we can see Adjusted R-squared is incised which it means our predictions will be more accurate
plot(model2)

# Conversions ####

par(mfrow=c(2,2))
plot(model2)

#Log
model_log <- lm(Ozone ~ log(Temp) , data = air_new)
summary(model_log)

dev.off() # wipes plots

plot(model_log)

# Square Root
model_sqrt <- lm(Ozone ~ sqrt(Temp) , data = air_new)
summary(model_sqrt)

model_sqrt_ozone <- lm(sqrt(Ozone) ~ log(Temp) , data = air_new)
summary(model_sqrt_ozone)

# Guessing via model

model_log <- lm(log(Ozone) ~ Temp , data = airquality)
summary(model_log)
predict(model2 , data.frame(Temp = c(74)))

# via log model
predict <- predict(model_log , data.frame(Temp = c(74))) #predicted values are lowered

#exponential
exp(predict)

# independent log model
model_log_ba <- lm(Ozone ~log(Temp), data = airquality)
predict(model_log_ba , data.frame(Temp = c(74)))

# we don't need to do the inverse transform when predicting if it transforms over the arguments 
# but if we do transformation on dependent variables then we need 
# But we need to apply an inverse transform again, if the value we get is from the predict result. 

predict(model_log_ba , data.frame(Temp = c(74, 56, 45,78)))