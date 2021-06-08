View(singapore)

mean(singapore$price)

any(is.na(singapore$price))
which(is.na(singapore$price))

mean(singapore$price, na.rm = T)
sd(singapore$price, na.rm = T) #Sd is way bigger than mean which that means date is spread out and not clustered about the mean
median(singapore$price, na.rm = T) #if mean is bigger than median which that mean it's positively skewed

hist(singapore$price) #we create a histogram to better view that it is skewed to the right 
hist(singapore$price[singapore$price < 1000]) #we created a histogram for a better view of how its spread on prices less than 1000

sd(singapore$price, na.rm = T)
var(singapore$price, na.rm = T) #the square of the standard deviation is equal to the variance 

table(singapore$room_type) #categorical representation of room_type data with variable name and the frequency

quantile(singapore$price, na.rm = T) #There is a big gap between %75 and %100 that means %75 of data values are between 0 and 199 only %25 is bigger than 199(i should check 199 and 200 are included or not) 


#for better View we should remove them from data frame but we can't remove them rightnow
#firstly we should do class conversation and then we will remove them from data frame

class(singapore$room_type)
singapore$room_type <- as.character(singapore$room_type)
table(singapore$room_type)
inds <- which( singapore$room_type == '' | singapore$room_type == '110' | 
                 singapore$room_type == '1200' | singapore$room_type == '294' | 
                 singapore$room_type == '31' | singapore$room_type == '40' | 
                 singapore$room_type == '50' | singapore$room_type == '60' | 
                 singapore$room_type == '74' | singapore$room_type == '75' | 
                 singapore$room_type == '750' | singapore$room_type == '299' )

singapore <- singapore[-inds , ]


table(singapore$room_type)