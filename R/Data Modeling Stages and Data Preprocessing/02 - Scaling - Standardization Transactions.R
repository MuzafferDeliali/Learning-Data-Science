# Scaling - Standardization Transactions 

?scale

scale(df$vdur)
# scaled:center = mean
mean(df$vdur)
# scaled:scale = sd (Standard deviation)
sd(df$vdur)

# We can standardize it by determining mean and sd
scale(df$vdur , center = 50, scale = 5)

# Standardization Example
par(mfrow = c(2,1))
hist(df$vdur)
hist(scale(df$vdur))
