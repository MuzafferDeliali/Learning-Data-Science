#Tidyverse

install.packages("tidyverse") #installing tidyverse library
library(tidyverse) #uses for data manipulation

#data %>% select(v1) %>% filter(v2 > 5) #created pipeline and select "(something)" from it

#Selecting variable with select() function
View(iris)

iris_new <- iris %>% select(Sepal.Length , Sepal.Width) #As you can see in the console it created data frame with these 2 column we selected

View(iris_new)