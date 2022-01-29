# Sets ##
# Set's are similliar to lists but a set can't hold same value
# But sets works faster than list

Li = [1,2,3,4,1,2,3,4] 
set(Li) # removed duplicates

# sets are unordered so when we use it might gets on different order
Ki = set(Li)
Ki

# Tuple ##
TheTuple = (1,2,"a",4.5)
TheTuple[0]

TheTuple[1] = 9 # 'tuple' object does not support item assignment 
TheTuple # we can't assign new value 

# Booleans ##
# True and False
WageList = [5000,2000,3000,7500,10000,2500]
len(WageList)
sum(WageList)

avg = sum(WageList) / len(WageList)
avg

WageList[3] < avg # returns false because avg wage is 5000

# Comparison
55 >= 55
x = 5
y = 10

x == y # no they're not equal
x != y # yes they're not equal

# Gates
3 > 1 and 3 > 2 # and gate
1 > 3 or 3 > 2 # or gate

not 5 == 5 # shows opposite of result