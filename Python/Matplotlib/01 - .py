import numpy as np
import matplotlib.pyplot as plt

ageList = [10,20,30,40,50,60,70,80,90]
weiList = [20,60,65,65,70,65,60,60,55]

numpAgeList = np.array(ageList)
numpWeiList = np.array(weiList)

plt.plot(numpAgeList , numpWeiList , "r")
plt.xlabel("Age")
plt.ylabel("Weight")
plt.title("Age - Weight graph")
plt.show()

