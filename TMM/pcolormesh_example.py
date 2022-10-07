#!/usr/bin/env python3
# -*- coding: utf-8 -*-

'''
Example of the different pcolormesh shading options, illustrating non-regular meshes in particular.
See here for more examples:
  https://matplotlib.org/stable/gallery/images_contours_and_fields/pcolormesh_grids.html
'''

# Import the main TMM function we will use:
from tmm.tmm_core import coh_tmm

# Import numpy:
import numpy as np

# Import matplotlib for plotting:
import matplotlib.pyplot as plt

def main():
  X = [0,1,5]
  Y = [3,4,5,10,20]
  
  X, Y = np.meshgrid(X, Y)
  
  Z = [[1,2,3],
       [4,5,6],
       [7,8,9],
       [10,11,12],
       [13,14,15]]
  
  shading_list = ['flat', 'nearest', 'gouraud']
  
  for s in shading_list:
    plt.figure()
    plt.pcolormesh(X, Y, X, shading=s)
    plt.colorbar()
    plt.title(s)
    plt.xticks(np.arange(X.min(), X.max()+1, 1))
    plt.yticks(np.arange(Y.min(), Y.max()+1, 1))
    plt.plot(X.flat, Y.flat, 'o', color='m')

if __name__ == "__main__":
    main()
