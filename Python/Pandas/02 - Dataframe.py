import numpy as np
import pandas as pd

# Dataframes

data = np.random.randn(4,5) # creating 4x5 dataframe
data

# Visualisation via Pandas
dataFrame = pd.DataFrame(data)
dataFrame

dataFrame[0] # first column

New_df = pd.DataFrame(data,index=["Muzaffer","Hakkı","Tahsin","Ahmet"], columns = ["wage","age","hour","info1","info2"])
New_df

New_df["age"] #by column

New_df.loc["Muzaffer"] #by row
New_df.iloc[0] #by index row

#Append new column
New_df["Double Age"] = New_df["age"] + New_df["age"]
New_df

New_df.drop("Double Age" , axis = 1) #we have to give axis 1, otherwise it will be searched by row
New_df #changes will be temporary

#If we want to remove permanantly we have to use inplace
New_df.drop("Double Age" , axis = 1, inplace = True)
New_df

#It works same for row
New_df.drop("Tahsin" , inplace = True)
New_df

# Selecting row and column
New_df.loc["Muzaffer"]["wage"]

# DataFramme Comparison
New_df < 0
booleanDF = New_df < 0

# we can asing it to new df
booleanDF
New_df #original one is still same
New_df[booleanDF] # this will only show True values rest of it will be replaced with NaN

New_df[New_df["hour"] > 0]
