import matplotlib.pyplot as plot
plot.hist(y, 100) # plot histogram 

# correlation matrix 
import matplotlib.pyplot as plt
import seaborn as sns
corrmat = data.corr() 
f, ax = plt.subplots(figsize=(12, 9))
sns.heatmap(corrmat, vmax=0.8, square=True);
