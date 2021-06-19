#Sorting with arrange() function 
View(iris)

iris %>% arrange(Sepal.Length) #sorts from min to max
iris %>% arrange(Sepal.Width , Sepal.Length) #Sorts by width first, but also sorts them among themselves if the length is not the same. 

iris %>% arrange(desc(Sepal.Length)) #Sort Sepal.Length as descending
iris %>% arrange(desc(Sepal.Length), desc(Sepal.Width)) #2 variable version
#if we don't type second desc it will order as desc Length and ascending Width

#Summaries function 

iris %>% summarise( Mean = mean(Sepal.Length) ,
                    Median = median(Sepal.Length) ,
                    Sd = sd(Sepal.Length))