import numpy as np

MyList = [10,20,30]
type(MyList)
np.array(MyList)

MatrixList = [[10,20,30],[20,30,40],[30,40,50]]
MatrixList[1][0]

np.array(MatrixList)

# Arange ##
list(range(0,10))
np.arange(0,10)

np.arange(0,10,2) # with step

# Zeros ##
np.zeros(5) # create zeros array
np.ones(5)

np.zeros((3,3)) # zero matrix

# Linspace ##
np.linspace(0, 20,5) # divide evenly and return 5 values

# Eye ##
# identity matrix
np.eye(5)

# Random
np.random.rand(4) 

np.random.rand(4,4) # 4x4 matrix

np.random.randint(1,10) # for intagers

np.random.randint(1,300,5) # random 5 values but 300 isn't included

NumpyArray = np.arange(30)
NumpyArray

RandomArray = np.random.randint(0,100,30)

# Numpy array methods ##

# Reshape
RandomArray.reshape(5,5) # size doesnt fit we can't resize it to 5,5

RandomArray.reshape(5,6)

# Min Max values
RandomArray.max() #  max value 
RandomArray.argmax() # locatiton of max value

RandomArray.min() # min value
RandomArray.argmin() # location of min value