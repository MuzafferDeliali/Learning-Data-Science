# Classes and Objects ##
# Instance and Attribute
# Class vs Instance
#https://www.toptal.com/python/python-class-attributes-an-overly-thorough-guide

SuperHeroName = "Superman"
SuperHeroAge = 30
SuperHeroJob = "Journalist"

class SuperHero():
    def __init__(self,name,age,job): # These are our input
        print("init called")
        self.name = name #The name we defined above is the second "name" 
        self.age = age # .age and age are not the same thing
        self.jop = job # The one on the left is what we will call

Superman = SuperHero("Superman",30,"Journalist")
Superman.name # we call it by .name which we defined above

# We can change the values
Superman.name = "Clak Kent"
Superman.name

# Default Values
class Dog():
    
    Humanize = 7
    
    def __init__(self,age=5):
        self.age = age
        
    def humanAge(self):
        return self.age  * self
        
MyDog = Dog()
MyDog.age # will return default value

MyDog = Dog(3) # We can still give number if we want