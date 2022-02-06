# Special Methods ##
# Speciak Method List: https://docs.python.org/3/reference/datamodel.html#special-method-names
class Fruit():
    
    def __init__(self,name,calorie):
        self.name = name
        self.calorie = calorie
        
banana = Fruit("Banana", 150)
banana.calorie

print(banana) # returns location on the ram

# But if we do this we can type it
class Fruit():
    
    def __init__(self,name,calorie):
        self.name = name
        self.calorie = calorie
        
    def __str__(self):
        return f"{self.name} has {self.calorie} calories"
    
banana = Fruit("Banana", 150)
banana.calorie

print(banana)

apple = Fruit("Apple", 200)

print(apple)

# Try, except, else and finally
while True:
    try:
        MyInt = int(input("Please enter int: "))
    except:
        print("This isn't integer")
        continue
    else:
        print("Thanks")
        break
    finally:
        print("i wil activate it whatever happens")