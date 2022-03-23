import pandas as pd

## Group_By
wage_dict = {"Departmant" : ["programmer" , "sale" , "sale" ,"hr" , "programmer"] ,
             "Name" : ["Ahmet" , "Mehmet" , "Taho" ,"Burak" , "Sabri"] ,
             "Wage" : [100,200,150,100,300]}

wageDF = pd.DataFrame(wage_dict)
wage_dict

grouped =   wageDF.groupby("Departmant")
grouped.count()
grouped.mean()
grouped.max()
grouped.min()

suggested_personel = {"Name" : ["Ahmet" , "Mehmet" , "Taho" ,"Burak" , "Sabri"] ,
                      "RecommandRatio" :[65, 30, 55, 65,100]} 

sugestDF = pd.DataFrame(suggested_personel)

## Concat Function
#  Concat function concatenates dataframes along rows or columns. We can think of it as stacking up multiple dataframes.

pd.concat([wageDF , sugestDF], axis=1)

## Merge Function
#  Merge combines dataframes based on values in shared columns. Merge function offers more flexibility compared to concat function because it allows combinations based on a condition.
wageDF.merge(sugestDF , on="Name", how='outer')
# Further info for merging ways --> https://towardsdatascience.com/3-key-differences-between-merge-and-concat-functions-of-pandas-ab2bab224b59
