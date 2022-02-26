import numpy as np
import pandas as pd

# Series

myDictionary = {"Putin" : 25 , "Zelensky" : 50}
pd.Series(myDictionary)

myValue = [25,50]
myName = ["Putin", "Zelensky"]

pd.Series(myValue)
pd.Series(myName)

pd.Series(myName, myValue)

pd.Series(data=myValue, index=myName)