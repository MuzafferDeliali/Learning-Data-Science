# Variables
x = 5
y = 10
z  = (x * y)
print(z)

# Type function (class on R)
a = type(z)
print(a)

# if we use it as z. spyder shows which functions  we can use with z variable
z.bit_length()


# variable assignment
c = y / x
print(c)
type(c)#type of c

## Mathematical operations

# Power of
x**2 # is same thing with x^2

# Mods - Remainers
y % x

# User inputs
input("Please enter your age")
# How to assign input  to a variable
user_age = input("Please enter your age: ") # input assigned to a variable

## Strings

# Capitalize string and assign to another variable
b = "python programming"
b.capitalize()
n = b.capitalize()
n
b

# Split
n.split()

# str to int
user_age = input("Please enter your age: ")
user_age = int(user_age) # type conversation string to integer

# Length for strings
len(n)

# Index
b[0:5]
b[-1]

# Slicing
b[:3]  # first 3 
b[3:]  # all of them except first 3 ones
b[-3:] # last 3

# Step size
b[::2]
b[1:10:3] # take 1 to 10 but jump 3
b[::-1] #reversed the text
