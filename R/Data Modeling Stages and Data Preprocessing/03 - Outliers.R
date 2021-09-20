# Outliers

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

# How many outliners we have ?
nrow(out)
# How many extreme values we have ?
length(extreme)

# we have 292 outliners and 1328 of then are extreme outliners



# Z-score , T-score and Chi-Square statistics ####



# Mahalanobis Distence (focused on variance - parametric) ####
# Cook's Distence (Regression , Parametric) ####
# DBScan clustering ####

