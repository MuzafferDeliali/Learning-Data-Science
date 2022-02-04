# Scope ##
#some info https://realpython.com/python-scope-legb-rule/

num = 20

def agg(inte):
    num = 10
    return num + inte

agg(5) # scoping is the reason why it didn't return 25

# Local, Enclosing, Global,Built-In

MyName = "Muzaffer" #Global

def func():
    MyName = "Eren" 
    #Enclosing
    print(MyName)
    def newFunc():
        MyName = "Seren" #Local
        print(MyName)
    newFunc()

print(MyName)


y = 10
def funci(y):
    print(y)
    y = 5
    print(y)
    return y

funci(3)

# How we can change global value
y = 10

def somef():
    global y
    y = 5
    print(y)
    
somef()
y
