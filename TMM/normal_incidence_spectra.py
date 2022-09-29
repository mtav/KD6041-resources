#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import tmm
import numpy as np
import matplotlib.pyplot as plt
from numpy import pi, linspace, inf, array
from tmm.tmm_core import (coh_tmm, unpolarized_RT, ellips,
                       position_resolved, find_in_structure_with_inf)

def main():
    """
    Here's a thin non-absorbing layer, on top of a thick absorbing layer, with
    air on both sides. Plotting reflected intensity versus wavenumber, at two
    different incident angles.
    """
    # list of layer thicknesses in nm
    d_list = [inf, 100, 300, inf]
    # list of refractive indices
    n_list = [1, 2.2, 3.3+0.3j, 1]
    # list of wavenumbers to plot in nm^-1
    ks = linspace(0.0001, .01, num=400)
    # initialize lists of y-values to plot
    Rnorm = []
    R45 = []
    R45_s = []
    R45_p = []
    for k in ks:
		# For normal incidence, s and p polarizations are identical.
		# I arbitrarily decided to use 's'.
        Rnorm.append(coh_tmm('s', n_list, d_list, 0, 1/k)['R'])
        R45.append(unpolarized_RT(n_list, d_list, np.deg2rad(45), 1/k)['R'])
        R45_s.append(coh_tmm('s', n_list, d_list, np.deg2rad(45), 1/k)['R'])
        R45_p.append(coh_tmm('p', n_list, d_list, np.deg2rad(45), 1/k)['R'])
    kcm = ks * 1e7 #ks in cm^-1 rather than nm^-1
    
    R45_s = np.array(R45_s)
    R45_p = np.array(R45_p)
    plt.figure()
    # plt.plot(kcm, Rnorm, 'blue')
    plt.plot(kcm, R45, 'purple')
    plt.plot(kcm, R45_s, 'r--')
    plt.plot(kcm, R45_p, 'b--')
    plt.plot(kcm, (R45_s+R45_p)/2, 'ko', markevery=5)
    plt.xlabel('k (cm$^{-1}$)')
    plt.ylabel('Fraction reflected')
    plt.title('Reflection of unpolarized light at 0$^\circ$ incidence (blue), '
              '45$^\circ$ (purple)')
    plt.show()

if __name__ == "__main__":
    main()
