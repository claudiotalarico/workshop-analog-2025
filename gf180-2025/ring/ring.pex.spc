* PEX produced on Thu Dec 18 11:01:03 PM CET 2025 using /foss/tools/sak/iic-pex.sh with m=1 and s=1
* NGSPICE file created from ring.ext - technology: gf180mcuD

.subckt ring_pex VDD VOUT VSS
X0 VOUT a_1208_130# VSS VSS nfet_03v3 ad=0.61p pd=3.22u as=0.61p ps=3.22u w=1u l=0.28u
X1 a_1208_130# a_470_130# VDD VDD pfet_03v3 ad=1.3p pd=5.3u as=1.3p ps=5.3u w=2u l=0.28u
X2 a_1208_130# a_470_130# VSS VSS nfet_03v3 ad=0.61p pd=3.22u as=0.61p ps=3.22u w=1u l=0.28u
X3 a_470_130# VOUT VDD VDD pfet_03v3 ad=1.3p pd=5.3u as=1.3p ps=5.3u w=2u l=0.28u
X4 VOUT a_1208_130# VDD VDD pfet_03v3 ad=1.3p pd=5.3u as=1.3p ps=5.3u w=2u l=0.28u
X5 a_470_130# VOUT VSS VSS nfet_03v3 ad=0.61p pd=3.22u as=0.61p ps=3.22u w=1u l=0.28u
C0 VOUT VSS 2.28632f
C1 VDD VSS 6.94136f
C2 a_1208_130# VSS 1.45559f
C3 a_470_130# VSS 1.45559f
.ends

