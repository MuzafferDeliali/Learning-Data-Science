# Uniform distribution

?dunif
# x -> what we want
# min, max -> lower and upper limits of the distribution

dunif(x = 5 , min = 0 , max = 10)
dunif(x = 4 , min = 0 , max = 10)
dunif(x = 3 , min = 0 , max = 10)
dunif(x = 2 , min = 0 , max = 10)
dunif(x = 1 , min = 0 , max = 10) # as you can see all of them has same chance  

plot(1:40 , dunif(1:40 , min = 1 , max = 40) , # visualized Uniform distribution
     xlab = "Numbers" ,
     ylab = "Probility")

punif(q = 5 , min = 0 , max = 10 , lower.tail = TRUE) # probability of 5 or less 
                                                      # as you can see basically it's total of dunif(between 1 and 5) just like adding "+" at the end

punif(q = 3 , min = 0 , max = 10 , lower.tail = FALSE) # 4 ... 10 


punif(q = 12 , min = 0 , max = 10 , lower.tail = FALSE) # 12 isn't in range of our min and max value so it will return 0


qunif(p = 0.8 , min = 0 , max = 20 ) # with %80 probability  numbers will be 16 or lower
qunif(p = 0.8 , min = 0 , max = 20 , lower.tail = FALSE) # with %80 probability  numbers will be higher than 4
                                                         # which means only 4 unit is lower 16 unit is higher (i am not exactly sure about this) (on)

qunif(p = 0.75 , min = 0 , max = 100 , lower.tail = TRUE) # 75 percent of values equals 75 or lower than it 
qunif(p = 0.75 , min = 0 , max = 100 , lower.tail = FALSE) # only 25 value higher 75 (or %75) (that part makes me kinda confused)

runif(n = 50 , min = 0 , max = 20) # random 50 value between 0-20

d <- runif(n = 50 , min = 0 , max = 20) # random 50 value between 0-20

round(d) # decimal to integer


## Note myself ctrl + shift l selects the line works similar to ctrl + shift d short cut