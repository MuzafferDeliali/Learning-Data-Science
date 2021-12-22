### Regression Metrics

### Mean Squared Error ####

model <- lm(Ozone ~ Temp , data = airquality , na.action = na.omit) # via na.action we determine what we will do if we have na values

mse <- sum(model$residuals**2) / length(model$residuals)
mse
# RMSE = Root Mean Square Error

# AIC and BIC criteria ####
# AIC means Akaike’s Information Criteria and BIC means Bayesian Information Criteria.

## AIC = n * log(RSS/n) + 2 * num_params 
## AIC = -2 * (log-likelihood) + k * N_par # R uses this function
## AIC = 2k + n * (log(2 * pi * RSS/n ) + 1)  # This function returns same result with R  
# RSS = Root Some of Square

## BIC = -2 * (log-likelihood) + k *log(n) # R BIC uses this function
## BIC = n * log(RSS/n) + k * log(n)

# k = modeldeki parameter sayýsý Bo dahil olarak
# Ayýrca AIC formulünde varyans ayrý bir parametre olarak sayýlmaktadýr. 
# Bu nedenle toplam parametre sayýsý = k + 1 ; bir diðer parametre varyans olarak alýnmalýdýr. 

loglik <- logLik(model)
loglik <- as.numeric(loglik)
k = 3 
N_par = 3

AIC <- -2 * (loglik) + k * N_par
AIC

AIC(model , k = 3)
BIC(model)

air <- airquality[c("Ozone" , "Temp")]
air <- na.omit(air)
dist <- mahalanobis(air , center = colMeans(air) , cov = cov(air))
cutoff <- qchisq(p = 0.95 , df = 2)
ids <- which(dist > cutoff)
air <- air[-ids , ]


modelRemovedOut <-  lm(Ozone ~ Temp , data = air)

AIC(model , k = 3)
BIC(model)

AIC(modelRemovedOut , k = 3)
BIC(modelRemovedOut )