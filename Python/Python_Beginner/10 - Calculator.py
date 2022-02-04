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