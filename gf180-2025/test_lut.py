import numpy as np
from pygmid import Lookup as lk

# read data for gf180mcuD NMOS and PMOS device
# the range of channel lengths is 0.28 to 3
# the range for VGS, VDS is 0 to 3.3
n = lk('./nfet_03v3.mat')
p = lk('./pfet_03v3.mat')

# basic example of usage mode 1
gm_n = n.look_up('GM', L=0.28, VGS=0.9, VDS=0.9, VSB=0.0)
ID_n = n.look_up('ID', L=0.28, VGS=0.9, VDS=0.9, VSB=0.0)
gm_p = p.look_up('GM', L=0.28, VGS=0.9, VDS=0.9, VSB=0.0)
ID_p = p.look_up('ID', L=0.28, VGS=0.9, VDS=0.9, VSB=0.0)
print(f'nch - (gm/ID) is: {gm_n/ID_n:0.2f} (S/A)')
print(f'pch - (gm/ID) is: {gm_p/ID_p:0.2f} (S/A)')

# check bias
gm_id_n = gm_n/ID_n
VGS = n.lookupVGS(GM_ID = gm_id_n, VDS = 0.9, VSB = 0.0, L = 0.28)
print(f'nch - VGS is: {VGS:0.2f} (V)')
gm_id_p = gm_p/ID_p
VGS = p.lookupVGS(GM_ID = gm_id_p, VDS = 0.9, VSB = 0.0, L = 0.28)
print(f'pch - VGS is: {VGS:0.2f} (V)')

# basic example of usage mode 2
GM_GDS_n= n.look_up('GM_GDS', GM_ID=gm_id_n, L=0.28, VSB=0, VDS = 0.9)
GM_GDS_p= p.look_up('GM_GDS', GM_ID=gm_id_p, L=0.28, VSB=0, VDS = 0.9)
print(f'nch - GM_GDS is: {GM_GDS_n:0.2f}')
print(f'pch - GM_GDS is: {GM_GDS_p:0.2f}')

