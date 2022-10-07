#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Import the main TMM function we will use:
from tmm.tmm_core import coh_tmm

# Import numpy:
import numpy as np

# Import matplotlib for plotting:
import matplotlib.pyplot as plt

def main():
    n1 = 3.5
    d1 = 0.5 # um
    n2 = 1.5
    d2 = 0.5 # um
    Nperiods = 15
    
    # list of layer thicknesses in nm
    d_list = [np.inf] + Nperiods*[d1, d2] + [d1] + [np.inf]
    # list of refractive indices
    n_list = [1] + Nperiods*[n1, n2] + [n1] + [1]

    ##### YOUR CODE GOES HERE #####
    
if __name__ == "__main__":
    main()
