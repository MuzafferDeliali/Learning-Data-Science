# Inheritance
class Animals():
    def __init__(self):
        print("Animal class init")
        
    def method1(self):
        print("Animal class method1")
        
    def method2(self):
        print("Animal class method2")
        
MyAnimal = Animals()

MyAnimal.method1()
MyAnimal.method2()

class Cat(Animals):
    def __init__(self):
        Animals.__init__(self)
        print("Cat class init")
        
    def Meow(self):
        print("Meow")
            
MyCat = Cat()

MyCat.Meow()
MyCat.method1() # even though we didn't defined it at class Cat
# we can still use it