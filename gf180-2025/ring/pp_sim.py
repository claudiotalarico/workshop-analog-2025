# pp_sim.py - post process simulation results using python
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

df = pd.read_csv('./inv_tb_stat_enh.txt', sep='\\s+')
par_names = df.columns.to_list()

print(par_names)

df = df.apply(pd.to_numeric)

# extract and massage the data
vin  = df[["v(in)"]]
vout = df[["v(out)"]]

VSW  = df[["VSW"]]
#VSW = VSW.iloc[[0]]
VSW = VSW.to_numpy()
VSW = VSW[0,0]

VOH  = df[["VOH"]]
#VOH = VOH.iloc[[0]]
VOH = VOH.to_numpy()
VOH = VOH[0,0]

VIL  = df[["VIL"]]
#VIL = VIL.iloc[[0]]
VIL = VIL.to_numpy()
VIL = VIL[0,0]

VOL  = df[["VOL"]]
#VOL = VOL.iloc[[0]]
VOL = VOL.to_numpy()
VOL = VOL[0,0]

VIH  = df[["VIH"]]
#VIH = VSW.iloc[[0]]
VIH = VIH.to_numpy()
VIH = VIH[0,0]


print(VSW)
print(VOH)
print(VIL)
print(VIH)

# plot
fig, ax = plt.subplots()
plt.plot(vin,vout,label="$v_{out}$")
plt.plot(vin,vin,label="$v_{out}=v_{in}$")
plt.xlabel("$vin$ (V)")
plt.ylabel("$vout$ (V)")
plt.title("DC transfer function")
plt.ylim(0,3.5)
plt.xlim(0,3.5)
plt.legend(loc='center left',frameon=False,fontsize=12)
str1 = f" = {VSW:.2f} (V)"
str2 = f" = {VOH:.2f} (V)"
str3 = f" = {VIL:.2f} (V)"
str4 = f" = {VOL:.2f} (V)"
str5 = f" = {VIH:.2f} (V)"
plt.annotate("$V_{SW}$" + str1 + '\n' + "$V_{OH}$" + str2 + '\n' +
"$V_{IL}$" + str3 + '\n' + "$V_{OL}$" + str4 + '\n' +
"$V_{IH}$" + str5,
xy=(2.5,2.0), ha='left',va='top',color='tab:purple')
fig.tight_layout()

#---- horizontal and vertical crossing lines
plt.axvline(x=VIL, color='k', linestyle='--')
# note: below xmin & xmax are specified as a percentage of x-range
plt.axhline(y=VOH, xmin=0.0, xmax=0.40 ,color='k', linestyle='--')
plt.axvline(x=VIH, color='b', linestyle=':')
plt.axhline(y=VOL, xmax=0.6, color='b', linestyle=':')
#---- 

#---- slope line
# the slope line below is infinite (commented out)
# ax.axline((VIL,VOH), slope=-1, color="k", linestyle="-", linewidth=2)
# trick to make the slope line shorter
slope = -1
point = (VIL,VOH)
x_values = np.array([0.9,1.5])
y_values = point[1] + slope * (x_values - point[0])
ax.plot(x_values, y_values, color="k", linestyle="-", linewidth=2)
#---- 

#---- mark the relevant points
plt.plot(VIL, VOH, 'ko') 
plt.plot(VIH, VOL, 'bo') 
plt.plot(VSW, VSW, 'o', color='teal') 
plt.text(VIL+0.05,VOH+0.05, "(VIL, VOH)")
plt.text(VIH+0.05,VOL+0.05, "(VIH, VOL)", color='b')
#---- 

plt.savefig("../plots/Plot_pp_sim_py.png")
plt.show()
