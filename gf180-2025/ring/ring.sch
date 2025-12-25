v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 900 -540 900 -500 {lab=vdd}
N 780 -420 820 -420 {lab=vout}
N 970 -420 1010 -420 {lab=#net1}
N 1160 -420 1200 -420 {lab=#net2}
N 780 -420 780 -240 {lab=vout}
N 780 -240 1400 -240 {lab=vout}
N 900 -520 1090 -520 {lab=vdd}
N 1090 -520 1090 -500 {lab=vdd}
N 1090 -520 1280 -520 {lab=vdd}
N 1280 -520 1280 -480 {lab=vdd}
N 900 -340 900 -300 {lab=vss}
N 900 -320 1090 -320 {lab=vss}
N 1090 -340 1090 -320 {lab=vss}
N 1090 -320 1280 -320 {lab=vss}
N 1280 -340 1280 -320 {lab=vss}
N 1420 -420 1440 -420 {lab=vout}
N 1350 -420 1390 -420 {lab=vout}
N 1390 -420 1420 -420 {lab=vout}
N 1420 -420 1420 -240 {lab=vout}
N 1400 -240 1420 -240 {lab=vout}
C {devices/iopin.sym} 900 -540 3 0 {name=p3 lab=vdd}
C {devices/opin.sym} 1440 -420 0 0 {name=p4 lab=vout}
C {devices/iopin.sym} 900 -300 1 0 {name=p1 lab=vss}
C {inv.sym} 1200 -500 0 0 {name=xinv3}
C {inv.sym} 1010 -500 0 0 {name=xinv2}
C {inv.sym} 820 -500 0 0 {name=xinv1}
