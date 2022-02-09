# Numpy Index ##
import numpy as np
MyArray = np.arange(0,15)
MyArray

MyArray[3:8]

MyArray[3:8] = 5
MyArray # now the 3:8 range values are "5"

OtherArray = np.arange(0,24)
slicedArray = OtherArray[4:9] # let's slice it
slicedArray

slicedArray = 700 # don't do this, it will change array to inr

slicedArray[:]  = 700 #don't do this either because it will change original array too
slicedArray

# First create a copy than do you thing by this way it won't change the original
# Fix later ##

OtherArray = np.arange(0,24)
OtherArrayCopy = OtherArray.copy

SlicedCopy = OtherArrayCopy[3:5]
SlicedCopy

# Matrix Index
MyList = [[10,20,30],[20,30,40],[40,50,60]]

MyMatrixArray = np.array(MyList)
MyMatrixArray


MyMatrixArray[0] # first row
MyMatrixArray[1][2] #second rows "40" value
MyMatrixArray[1,2] #same thing

MyMatrixArray[1:,2] # last colums last 2 value
