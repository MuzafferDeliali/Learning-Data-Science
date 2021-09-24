# Outlier Types

# Box plot (non parametric) ####
library(rstatix)
?identify_outliers

# I will use AirbnbNewyork.csv

identify_outliers(Nyork["price"]) # by using vector C() we can use it for multiple columns
out <- identify_outliers(Nyork["price"])

min(out$price)
max(out$price)

min(Nyork[,"price"])
max(Nyork[,"price"])

ids <- which(out$is.extreme == TRUE)
out[ids, "price"]
extreme <- out[ids, "price"]

min(extreme)
max(extreme)

# Filtering extremes
as <- Nyork %>% filter(Nyork$price < 495)
View(as)

# How many outlieers we have ?
nrow(out)
# How many extreme values we have ?
length(extreme)
# we have 292 outliers and 1328 of then are extreme outliers


# Z-score , T-score , Chi-Square , IQR and MAD ####

install.packages("outliers")
library(outliers)

?scores
# For Type z and type T comparison 
# Source : https://www.educba.com/z-score-vs-t-score/
# Z-score , T-score , Chi-Square , IQR and MAD are not multivariate


  # Type Z ----

View(airquality)
scores(na.omit(airquality$Ozone) , type = "z" , prob = 0.95) 

out2 <- scores(na.omit(airquality$Ozone) , type = "z" , prob = 0.95)
# Note :prob is two sided 

ids <- which(out2 == TRUE)
na.omit(airquality$Ozone)[ids]
# The number greater than 97 are outliers

par(mfrow = c(2,1))
hist(airquality$Ozone) # Normal histogram
hist(na.omit(airquality$Ozone)[-ids]) # without outliers

  # Type T ----

# It's pretty much same with type Z

View(airquality)
scores(na.omit(airquality$Ozone) , type = "t" , prob = 0.95) 

out2 <- scores(na.omit(airquality$Ozone) , type = "t" , prob = 0.95)

ids <- which(out2 == TRUE)
na.omit(airquality$Ozone)[ids]
# The number greater than 97 are outliers

par(mfrow = c(2,1))
hist(airquality$Ozone) # Normal histogram
hist(na.omit(airquality$Ozone)[-ids]) # without outliers

  # Chi-Square ----

View(airquality)
scores(na.omit(airquality$Ozone) , type = "chisq" , prob = 0.95) 

out2 <- scores(na.omit(airquality$Ozone) , type = "chisq" , prob = 0.95)
# Note :prob is two sided 

ids <- which(out2 == TRUE)
na.omit(airquality$Ozone)[ids]
# now we have less outliers because chi square is more positive skewed

par(mfrow = c(2,1))
hist(airquality$Ozone) # Normal histogram
hist(na.omit(airquality$Ozone)[-ids]) # without outliers

  # IQR ----

View(airquality)
scores(na.omit(airquality$Ozone) , type = "iqr" , prob = 0.95) 

out2 <- scores(na.omit(airquality$Ozone) , type = "iqr" , prob = 0.95)
# Note :prob is two sided 

ids <- which(out2 == TRUE)
na.omit(airquality$Ozone)[ids]
# The are no outliers

par(mfrow = c(2,1))
hist(airquality$Ozone) # Normal histogram
hist(na.omit(airquality$Ozone)[-ids]) # without outliers

  # MAD ----

# Median Absolute Deviation

View(airquality)
scores(na.omit(airquality$Ozone) , type = "mad" , prob = 0.95) 

out2 <- scores(na.omit(airquality$Ozone) , type = "mad" , prob = 0.95)
# Note :prob is two sided 

ids <- which(out2 == TRUE)
na.omit(airquality$Ozone)[ids]
# Minimum outlier is 77 which that's why we have more outliers than others

par(mfrow = c(2,1))
hist(airquality$Ozone) # Normal histogram
hist(na.omit(airquality$Ozone)[-ids]) # without outliers
# And it's less skewed


# Mahalanobis Distance (focused on variance - parametric) ####
library(ggplot2)
library(car)

View(airquality)

fig <- ggplot(airquality , aes(x = Ozone , y = Temp)) +
      geom_point(size = 2) +
      xlab("Ozone Values") +
      ylab("Temp")

fig

X <-na.omit(airquality[c("Ozone" , "Temp")])
View(X)

air.center <- colMeans(X)
air.center

air.cov <- cov(X)
cov(X)
# if we change 0.95 we can make larger or smaller ellipses
rad <- sqrt(qchisq(0.95 , df = 2)) # we have 2 columns so df will be 2

elli <- ellipse(center = air.center , shape = air.cov , rad = rad ,
        segments = 100 , draw = FALSE)

colnames(elli) <- colnames(X)
elli
elli <- as.data.frame(elli)

fig <- fig +geom_polygon(data = elli , color = "Orange" , fill = "Orange" ,
                  alpha = 0.3 ) +
    geom_point(aes(x = air.center[1] , y = air.center[2]) ,
               size = 4 , color = "blue")
fig
  # The dots who outside of ellipse are outliers

dist <- mahalanobis(X , center = air.center , cov = air.cov)
dist

cutoff <- qchisq(p = 0.95 , df = 2) # we didn't take square because distences are already squared

ids <- which(dist > cutoff)
X[ids, ] # values of outliers 



# Cook's Distance (Regression , Parametric) ####
# DBScan clustering ####

