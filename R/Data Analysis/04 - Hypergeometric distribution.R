# Hypergeometric distribution

# x what we want
# m how many a colored exist
# n how many b colored exist
# k how many time we will try 
# p probability
# nn number of observations


#Example : On 10 try picking 4 red card from deck (Deck has 52 cards half red , half black )
dhyper(x = 4 , m = 26 , n = 26 , k = 10) # x the 4 red card 
                                         # m all red card cards in  the deck
                                         # n all black cards in the deck
                                         # k we picked 10 times

plot(1:26 , dhyper(x = 1:26 , m = 26 , n = 26 , k = 10) ,
     bty = "L" ,
     pch = 19 ,
     col = "red")

lines( dhyper(x = 1:26 , m = 40 , n = 12 , k = 10)) # if there were 40 red 12 black card  it would like this 

# if we want to pick 5 or less than 5 red
phyper( q = 5 , m = 26 ,n = 26 , k = 10 , lower.tail = TRUE)

# if we want to pick more than 5 red
phyper( q = 5 , m = 26 ,n = 26 , k = 10 , lower.tail = FALSE)

#Example
# We be giving clothing ad on Instagram and targeted population is 20-25 years old males
# According this criterion there are 10000 people but according Google search data only 4000 person willing to buy
# Instagram will show ad to 3000 people out of 10000 people

# So what are the chances of showing at least 2000 people ?

phyper(q = 1999 , m = 4000 , n = 6000 , k = 3000 ,lower.tail = FALSE)

# Showing 1500 people or less 
phyper(q = 1500 , m = 4000 , n = 6000 , k = 3000 ,lower.tail = TRUE)

# Showing more than 1200 people
phyper(q = 1200 , m = 4000 , n = 6000 , k = 3000 ,lower.tail = FALSE)

# What if we do via probability value
# The number of states according to the probability value
qhyper( p = 0.6 , m = 5000 , n = 5000 , k = 3000 , lower.tail = TRUE) # with %60 probability it will be show 1506 people or less
qhyper( p = 0.6 , m = 5000 , n = 5000 , k = 3000 , lower.tail = FALSE) # with %60 probability it will be show more than 1496 people


# Creating random data 
# Picking 10 card from deck and trying 50 times
# Each time How many of them will be red out of 10 card
rhyper(nn = 50 , m = 26 , n = 26 , k = 10) 

# nn How many time we will draw 10 card (in this case 50 time we draw random 10 card)
# m  How many of them are same colored as we want
# n  How many of then aren't what we wanted
# k  For each time how many card we will draw (in this case it's 10)