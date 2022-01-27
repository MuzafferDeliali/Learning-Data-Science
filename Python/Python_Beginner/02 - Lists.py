name = "Muzaffer"
name[4]

name[4] = "F" # we can't do that because it's immutible
# And that's why we'll use lists 
MyList = [10, 20, 30, 40, 50]
type(MyList)

MyList[2] # but if it's a list we can change the values by location
MyList[2] = 100
MyList 

MyList.append(60) # adding new value to end of list
MyList.pop() # pops last index and updates the list
MyList.remove(30) # removed 30 from the list
MyList.count(20) # counts how many 20 exist
MyList.reverse() # reverses the list

# How to combine 2 list?
str1 = ["a","b", "c"]
str2 = ["d", "e", "f"]
combined = str1 + str2
combined

# Nested Lists
NestedList = [1,5,"muzo",["d", 7, 9]]
NestedList[3] # Returns our nested list
type(NestedList[3]) # as we can see it's a "list"
NestedList[3][2]