def calculator(a,b,islem):
    if islem == "+":
        return (str(a)+" + "+str(b) + " = " +str(a+b))
        
    if islem == "-":
        return (str(a)+" - "+str(b) + " = " +str(a-b))
        
    if islem == "*":
        return (str(a)+" * "+str(b) + " = " +str(a*b))
        result = a*b
        print("Result is",result)
        
    if islem == "/":
        return (str(a)+" / "+str(b) + " = " +str(a/b))        
    else:
        print("Invalid Value")


a = int(input("Type first int: "))
b = int(input("Type second int "))
islem = input("Pick what to do ")
calculator(a,b,islem)

# now let's do same thing with "while"
def hesap(a,b,islemim):
    if islemim == "+":
        return (str(a)+" + "+str(b) + " = " +str(a+b))
        
    if islemim == "-":
        return (str(a)+" - "+str(b) + " = " +str(a-b))
        
    if islemim == "*":
        return (str(a)+" * "+str(b) + " = " +str(a*b))
        result = a*b
        print("Result is",result)
        
    if islemim == "/":
        return (str(a)+" / "+str(b) + " = " +str(a/b))        
    else:
        print("Invalid Value")
        
while True:
    a = int(input("Type first int: "))
    b = int(input("Type second int "))
    islemim = input("Pick what to do ")
    print(hesap(a,b,islemim))
