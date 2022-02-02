# Range ##
range(25) # result is 0 to 25
# with shift + tab we can check documents of python
# and we can check it how it works (for example we can determine steps on range function)

# Enumerate ##
index = 0
for number in list(range(2,22)):
    print(f"current number is {number} and current index is {index} " )
    index = index + 1

# But this way we don't have to give index
for elem in enumerate(list(range(5,15))):
    print(elem)
    
# But if we give x,y to elem we can use it way effectively
for (index,numb) in enumerate(list(range(5,15))):
    print(numb) # if we want we call indexes or both of it at same time
    
for (index,numb) in enumerate(list(range(5,15))):
    print(index,numb)

# Random Value ##
from random import randint # calling librarys
randint(0, 100)

# picking one random integer from list
nList = list(range(1 , 11))
nList[randint(1,11)] 

# How to shuffle list
from random import shuffle
shuffle(nList)
nList # now let's see our shuffled list

#  Zip ##
fruitList = ["banana" , "ananas" , "apple"]
calorie = [100,200,300]
days = ["monday" , "sunday" , "thursday"]
zip(fruitList,calorie,days)
type(zip(fruitList,calorie,days)) # it's zip

# But if we do this it will peer
list(zip(fruitList,calorie,days))
zippedList = list(zip(fruitList,calorie,days))

for el in zippedList:
    print(type(el)) # it's tuple
    
# Lists Advanced ##
ListA = []
myString = "Muzaffer D"

for char in myString:
    ListA.append(char)

ListA


# Easier way to do it
ListB = "Muzaffer D"
ExampleListB = [char for char in ListB]
ExampleListB

# Now let's try it numbers
Numbers = [number * 3 for number in list(range(0,10))]
Numbers

# Squared version
NumbersSquared = [number ** 2 for number in list(range(0,10))]
NumbersSquared