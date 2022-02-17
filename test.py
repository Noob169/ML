
from cmath import pi
from scipy import sparse as sp
import numpy as np
import matplotlib.pyplot as mp
import IPython as ip
import pandas as pd

# eye=np.eye(4)
# sparse_matrix = sp.csr_matrix(eye)
# print("\nSciPy sparse CSR matrix:\n{}".format(sparse_matrix))
# data = np.ones(4)
# row_indices = np.arange(4)
# col_indices = np.arange(4)
# eye_coo = sp.coo_matrix((data, (row_indices, col_indices)))
# print("COO representation:\n{}".format(eye_coo))


# x=np.linspace(0.0,2*pi,1000)
# x2=np.arange(0,2*pi,0.01)
# y=np.sin(x2)
# mp.plot(x2,y,marker='x')
# mp.plot(x,np.sin(x),marker='x')
# mp.show()

# create a simple dataset of people
data = {'Name': ["John", "Anna", "Peter", "Linda"],
 'Location' : ["New York", "Paris", "Berlin", "London"],
 'Age' : [24, 13, 53, 33]
 }
data_pandas = pd.DataFrame(data)
# IPython.display allows "pretty printing" of dataframes
# in the Jupyter notebook
print(data_pandas[data_pandas.Age>30])
