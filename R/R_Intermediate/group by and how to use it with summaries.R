extra <- c(rep('A' , 30) , rep('B' , 30) , rep('C' , 30) , rep('D' , 30) , rep('E' , 30))

iris$extra <- extra
View(iris)


iris %>% group_by(Species , extra)

# group_by() function
View(iris)
iris %>% group_by(Species)

df <- iris %>% group_by(Species)

View(df)

iris %>% group_by(Species)

# group_by() function with summaries

#Average sepal.length grouped by species 
#does same thing with aggregate
iris %>% 
  group_by(Species) %>% 
  summarise(
  Sepal.Width.Mean  = mean(Sepal.Width) ,
  Sepal.Length.Mean = mean(Sepal.Length)
)

#we can also use our functions and use them
MinMax <- function(x) {
  return(min(x) - max(x))
}
#MinMax calculates difference between min and max value 
#MinMax(x) for example lets replace x with column names


#summaries with extras
iris %>% group_by(Species , extra) %>% 
  summarize(
    Avarage_Sepal_Length = mean(Sepal.Length) ,
    Avarage_Sepal_Width  = mean(Sepal.Width)  ,
    MinMax               = MinMax(Sepal.Length)
  )