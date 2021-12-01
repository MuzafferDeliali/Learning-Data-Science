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














