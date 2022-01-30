# If Function ##
3 > 1
if 3 > 1:
    print("yes it's bigger than 1")
    
print("we are not in condition")

# if and else if(elif)
x = 4
y = 5

if x > y:
    print("x is bigger than y")
elif y > x:
            print("no y bigger than x")
elif x == y:
    print("they're equal")

# Boolean
IsAlive = True

# don't do this
if IsAlive == True:
    print("It's alive")
else:
    print("it's dead")
    
# Do this
if IsAlive:
    print("it's alive")
else:
    print("it's dead")
    
# if we are looking dead
if not IsAlive:
    print("It's dead")
else:
    print("It's is fine")
    
# If we're working on strings keep in mind it's upper case lower case sensitive

# Using "in" func
myString = "Muzaffer Deliali"

if "Muzaffer" in myString:
    print("you're on the list")
else:
    print("i don't even know who you are")
    
# Does it contain "f" or "F"
if "f" or "F" in myString:
    print("This name contains 'f' or 'F' " )
else:
    print("Sorry, we can't find F even if it's lower case")