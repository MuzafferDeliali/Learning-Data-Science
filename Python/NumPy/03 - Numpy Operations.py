import numpy as np

# Operations ##

NewArray = np.random.randint(1,100,20)
NewArray > 25 # boolean 

resultArray = NewArray > 25 
NewArray[resultArray] # It will only return values of true ones

NewArray[NewArray > 24] # short version

lastArray = np.arange(0,24)
lastArray

lastArray + lastArray # we can make calculations aswell

np.sqrt(lastArray) # squared
np.min(lastArray)
np.max(lastArray)