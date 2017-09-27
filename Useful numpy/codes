# List in python

a = [1, 2, 3, 4, 5] # list in Python 
a.append(item)
a.insert(position, item) # insert 
a.pop() # return the last 
a.pop(i) # return item at the ith position 
a.sort()
a.reverse()
del a[pos] # delete the number in the ith position 
a.index(item) # Returns the index of the first occurrence of item
a.count(item) # number of occurrences of the item 
a.remove(item) # remove the first occurrence of the item 

# Strings 

s.center(w)
s.count(item)
s.ljust(w)
s.lower()
s.rjust(w)
s.find(item)
s.split(char) 

d = {}
d[key] = value 
d.keys()
d.values()
d.items()
d.get(key) # returns value associated with key 
     
#Math functions: 
import math as math 
math.sqrt(25) 
np.arange(0, 10, 1) # creates numpy array 0, 1, 2, ..., 9 
np.mean(X) 
np.std(X) # standard deviation 
np.var(X) # variance 
np.array([item1, item2, item3]) # creates an array 
a**2 (a^2) 

# A, B are two matrices 
A*B  #elementwise product 
A.dot(B) # matrix product 


np.ndim(X) # number of dimensions 
np.shape(X)[0] # number of rows 
np.shape(X)[1] # number of columns 
np.size(X) # number of items in X 
np.arange(15).reshape((3,5)) # create numpy array 0,... 14, reshape into 3 rows and 5 columns 

np.where(data['var1']>=10, 1, 0) # returns 1 when value >= 10, else return 0 
np.argmax(X, axis = 0) # returns the index of the biggest number in each column 
np.argmax(X) # return the index of the biggest item 


# Python pandas 
import pandas as pd 
data = pd.read_csv("file.csv")
data.describe() 
data.T # transpose 
data[0:3] # get the first 3 rows 
data["sqldate"][0:5]
data.loc[0:5, ["sqldate", "countryname"]]
data.iloc[3] # get the 4th row 
data.iloc[3, 4] # get the 4th row, 5th column 

# subset data in pandas 
data = data[(data["var1"] > 1000) & (data["var2"] < 500)]
data[data["var1"] > 0]
data[data["var1"].isin(["one", "two"])]  
var_list = ["var1", "var2", "var3"]
data_sub = data[var_list]

# summarize pandas columns 
data["var1"].describe()
data.head()
data.tail(3)

# missing values 
data["var1"].fillna() # fill nas with 0 
data.dropna(how = "any")
data[data['var1'].isnull()] # display the data where var1 is null
data[data['var1'].notnull()]
     
     
data[data >= 0] # boolean indexing, returns all the other values as NaN

# merging 
pd.merge(df1, df2, how = "inner", on = "key")
# how can be "inner", "left", "right", "outer"
# left_on, right_on     
pd.concat(data1, data2)
pd.concat(data1, data2).drop_duplicates()

# SQL like functions 
data.groupby("var1").size() # applies to only var1 
data.groupby("var1").mean()
data.groupby(["Var1", "Var2"]).sum()
data.groupby('var1').agg({'var2': np.mean, 'var3': np.size})

   
    
# sklearn steps 
from sklearn import preprocessing 
scalerX = preprocessing.StandardScaler().fit(X_train)
X_train_scaled = scalerX.transform(X_train) 

from sklearn import linear_model 
classifier = linear_model.LogisticRegression(class_weight = {0:1, 1:3}, penalty = "l1")
fit = classifier.fit(X_train_scaled, y_train) 

y_train_predict = fit.predict(X_train_scaled) # predict classes 
accuracy = np.mean(y_train_predict == y_train)*100 
y_train_prob = fit.predict_proba(X_train_scaled) # predict probabilities 

from sklearn.metrics import precision_recall_fscore_support 
precision_recall_fscore_support(y_cv, y_cv_predict, average = None) 

coefs = fit.coef_ 
coefs = pd.DataFrame(coefs)
coefs = pd.DataFrame(coefs.transpose())
coefs_name = pd.DataFrame(var)
coefs_res = pd.concat([coefs_name, coefs], axis = 1)
