# Range ##
range(25) # result is 0 to 25
# with shift + tab we can check documents of python
# and we can check it how it works (for example we can determine steps on range function)

# How to look documentation of functions
help(range)

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
ListA # let's take a look

help(ListA.append) # documentation of append function

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

# Creating Our Own Function ##
def MyFirstFunc():
    print("My First Function")

# Let's try it    
MyFirstFunc()

# Input and Return ##
def HiWorld(name):
    print("Hello There")
    
HiWorld() # It won't work because it's expecting the "name"
HiWorld("Muzaffer")

def Hello (name = "Muzaffer"):
    print("Hi")
    print(name)

Hello()    
Hello("Some random dude")    # with if elses we can allow only for "Muzaffer"

# Creating Our Own Aggregation Function  
def Agg(num1, num2):
    result = num1+num2
    print(result)

Agg() # expects values
Agg(5, 10)

# Args and Kwargs ##
# *args and **kwargs allow you to pass multiple arguments or keyword arguments to a function.

# *args 
def newAgg (*args):
    return sum(args)
newAgg(10,20,30,80)

# if we use return while defining functions it will return tuple
# otherwise it's noneType

# **kwargs
def Func(**kwargs):
    return(kwargs)

Func(banana = 100, apple = 200, pineapple = 300)
type(Func(banana = 100, apple = 200, pineapple = 300))

def KeyWordCheck (**kwargs):
    if "Muzaffer" in kwargs:
        print("Yep you're on the list")
    else:
        print("I don't even know who you are!")

KeyWordCheck(ahmet = 50, mehmet = 40, Muzaffer = 99)

def divide(num):
    return num / 2
divide(20)

# First way
TheList = [1,2,3,4,5,6,7,8,9,10]
List2 = []
for elem in TheList:
    List2.append(divide(elem))
    
List2 # calculated and created new list

#But we can do it easy way
# Second Way

# Map ##
list(map(divide, TheList)) #we 


def CheckTheChar(string):
    return "a" in string

"a" in "Muzaffer" # it exist
CheckTheChar("a") # it's same thing with the one above

names = ["ahmet" , "mehmet" , "didier" , "hazal"]
list(map(CheckTheChar, names))
result = list(map(CheckTheChar, names))
result.count(True) # simply counts how many people has "a" in the name

# Filter ##
list(filter(CheckTheChar, names)) # and that's their name

# Lambda ##
carp = lambda num : num * 3
carp(10)