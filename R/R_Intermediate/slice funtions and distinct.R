#Selecting rows with Slice() function 

iris %>% slice(3,2) #but it will create new data.frame so row names will be 1 and 2 

iris %>% slice(1:15) # 1 to 15
iris %>% slice(c(1,2,4,5,6,9))

iris %>% select(Sepal.Length , Sepal.Width) %>% slice(1:5) #creates selected data frame with selected columns and sets length

#slice_min and slice_max functions

iris %>% slice_min(order_by = Sepal.Length , n = 10) #slices 10 lowest Sepal Length values and creates data.frame

min10_sepal.l<- iris %>% slice_min(order_by = Sepal.Length , n = 10) #dont know why it takes 11 even though i said 10

class(min10_sepal.l)

max10_sepal.l<- iris %>% slice_max(order_by = Sepal.Length , n = 10)

iris %>% slice_min(order_by = Species , n = 10) #alphabetically picks species type and because all species are some valued picks all of rows not only 10

#selecting random samples with slice_sample

iris %>% slice_sample(n = 10) #takes random 10 samples from iris

#picking unique values with distinct() functions

#it is similar with unique() function

iris %>% distinct(Species) #picks uniqe species in iris
iris %>% distinct(Species , .keep_all = TRUE) #also takes other columns but we don't know which row it belongs to 