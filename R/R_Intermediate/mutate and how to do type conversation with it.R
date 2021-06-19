#Filtering data.frames with filter() function
View(iris)
iris %>% filter(Sepal.Length < 5)
iris %>% filter(Sepal.Length < 5 , Sepal.Width > 3)
iris %>% filter(Sepal.Length < 5 & Sepal.Width > 3)
iris %>% filter(Sepal.Length < 5 | Sepal.Width > 3) #right here we can also use "or" and "and as | &

iris %>% filter(Sepal.Length < 5 | Sepal.Width > 3) %>% select(Sepal.Length , Sepal.Width) #and we said just show Length and Width


iris %>% 
  filter(Sepal.Length < 5 & Sepal.Width > 3) %>% 
  select(Sepal.Length , Sepal.Width , Species)

#example
iris %>% 
  filter(Sepal.Length < 5 | Sepal.Width > 3) %>% 
  select(Sepal.Length , Sepal.Width , Species) %>%
  group_by(Species) %>%
  summarise(
    Sepal.Width.Mean  = mean(Sepal.Width) ,
    Sepal.Length.Mean = mean(Sepal.Length)
  )

#Mutate() function

iris %>% mutate(Sepal.Length = log(Sepal.Length))
iris %>% mutate(Sepal.LengthLog = log(Sepal.Length))
iris %>% mutate(Sepal.LengthLog = log(Sepal.Length))

#Type conversions with mutate() function

df <- iris %>% mutate(Species = as.character(Species))
class(df$Species)

iris %>% mutate_if(is.numeric, function(x) {x*10})
iris %>% mutate_if(is.numeric, log)

x <- function(x){
  
  return(x/10)
}

iris %>% mutate_if(is.numeric, x)