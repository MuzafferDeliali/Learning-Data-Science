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
