import pandas as pd
import numpy as np

Data_dict = {"City A" : [30,29,np.nan] , "City B" : [20,np.nan,25] , "City C" : [35,32,34]}
Weather_DF = pd.DataFrame(Data_dict)
Weather_DF

## Drop na ##
#Drop na rows
Weather_DF.dropna()

#Drop na column
Weather_DF.dropna(axis=True)

#if we want to update df we have to use inplace

# tresholding
Data_dict2 = {"City A" : [30,29,np.nan] , "City B" : [20,np.nan,25] , "City C" : [35,32,34] , "City D" : [40,np.nan,np.nan]}
Weather_DF2 = pd.DataFrame(Data_dict2)
Weather_DF2

Weather_DF2.dropna(axis=1 ,thresh=2) # drop the column if it has 2 or more na
Weather_DF2.dropna(thresh=2) # drop the row if it has 2 or more na

# Replacing Na with value
Weather_DF2.fillna(32)