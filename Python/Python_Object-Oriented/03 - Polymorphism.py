# Polymorphism ##
class Apple():
    def __init__(self,name):
        self.name = name
        
    def GimmeInfo(self):
        return self.name + " 100 calorie"

    
class Banana():
    def __init__(self,name):
        self.name = name
        
    def GimmeInfo(self):
        return self.name + " 150 calorie"
    
apple = Apple("Apple")
banana = Banana("Banana")

apple.GimmeInfo()
banana.GimmeInfo()

FruitBasket = [apple,banana] # Ps: They're not string, they're variable

for fruit in FruitBasket:
    print(fruit.GimmeInfo())