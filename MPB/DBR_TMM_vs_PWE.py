from tmm.tmm_core import coh_tmm
import numpy as np
import matplotlib.pyplot as plt

# DBR parameters
n1 = 1
d1 = 0.16 # um
n2 = 3.2
d2 = 0.16 # um
Nperiod = 15
a = d1 + d2

# list of layer thicknesses in nm
d_list = [np.inf] + Nperiod*[d1, d2] + [np.inf]
# list of refractive indices
n_list = [1] + Nperiod*[n1, n2] + [1]

# normalized frequency range
fn = np.linspace(0, 0.7, 1000)
# wavelength range
wvl_list = a/fn

# run TMM
R = []
for wvl in wvl_list:
    ret = coh_tmm('s', n_list, d_list, 0, wvl)
    R.append(ret['R'])

# plot R as a function of a/lambda
plt.plot(fn, R, label='no defect')
plt.xlabel(r'$a/\lambda$ (no unit)')
plt.ylabel('Reflectance $R$ (no unit)')
plt.title('Reflectance at $0\degree$ incidence')

# Save the data to .mat file that is easy to load in Matlab.
from scipy.io import savemat
mdic = {"wvl_list": wvl_list,
        "R": R,
         'n1': n1,
         'd1': d1,
         'n2': n2,
         'd2': d2,
         'Nperiod': Nperiod,
         'a': a}
savemat("TMM_data.mat", mdic)
