#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Import the main TMM function we will use:
from tmm.tmm_core import coh_tmm

# Import numpy:
import numpy as np

# Import matplotlib for plotting:
import matplotlib.pyplot as plt

def main():
    ##### YOUR CODE GOES HERE #####
    # list of layer thicknesses in nm
    d_list = [np.inf, 100, 300, np.inf]
    # list of refractive indices
    n_list = [1, 2.2, 3.3+0.3j, 1]
    # call the coh_tmm function
    ret = coh_tmm('s', n_list, d_list, 0, 700)
    # print the return values obtained:
    print(ret)
    
if __name__ == "__main__":
    main()
