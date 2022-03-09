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

NumpArray = np.array([50,40])
NumpArray

# Index naming
pd.Series(NumpArray)
pd.Series(NumpArray , myName)

pd.Series(["Zelensky" ,"Putin"] , [1,2]) # with this way can change index order

# if they have same name we can merge them 
competition1 = pd.Series([10,25,5] , ["Putin","Zelensky","Luko"])
competition1

competition2 = pd.Series([15,20,5] , ["Putin","Zelensky","Luko"])
competition2

FinalCompetition = competition1 + competition2
FinalCompetition

# But if they're not same
DiffSeries = pd.Series([20,30,40,50] , ["a","b","c","d"])
DiffSeries2 = pd.Series([20,30,40,50] , ["a","c","f","g"])

DiffSeries
DiffSeries2

DiffSeries + DiffSeries2 #Only a and c is in both series 
# if it's only in one series those indexes will retur NaN