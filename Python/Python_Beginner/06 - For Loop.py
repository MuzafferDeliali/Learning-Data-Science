# For Loop##
NumberList = [10,20,30,40,50]

if 10 in NumberList:
    print("Yes it's on the list")
    
NumberList[0] * 5 / 4
NumberList[1] * 5 / 4

# But there is a easy way to do it. If we use loops we don't have to write it for every index

for numbers in NumberList:
    print(numbers)
    
# Let's make same calculations with for loop

for calculations in NumberList:
    NewNumber = calculations *  5 / 4
    print(NewNumber)
    

newList = [1,2,3,4,5,6]
for calculations in newList:
    if calculations % 2 == 0:
        print("dividable")
    if not calculations % 2 == 0:
        print("not dividable")
       
# Continue, Break, Pass

MyList = [5,10,15,20,25,30]

for numb in MyList:
    print(numb / 5)

for numb in MyList: # This one will skip value 15
    if numb == 15:
        continue
    print(numb)
    
# But this one will skip the block(ofcourse it have to fulfill requirements)
for numb in MyList: # if we won't use pass it will return an error
    pass # unexpected EnOfFile litterlly means code can't fide EOF and doesn't know what to do