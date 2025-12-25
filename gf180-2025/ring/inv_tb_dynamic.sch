v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -530 520 -490 {lab=GND}
N 640 -530 640 -490 {lab=GND}
N 520 -650 520 -590 {lab=VDD}
N 640 -620 640 -590 {lab=a}
N 800 -750 800 -700 {lab=VDD}
N 800 -540 800 -490 {lab=GND}
N 680 -620 720 -620 {lab=a}
N 1540 -620 1540 -590 {lab=#net1}
N 1540 -530 1540 -490 {lab=GND}
N 640 -620 680 -620 {lab=a}
N 870 -620 900 -620 {lab=#net2}
N 1270 -620 1340 -620 {lab=out}
N 1490 -620 1540 -620 {lab=#net1}
N 800 -720 1160 -720 {lab=VDD}
N 1200 -720 1200 -700 {lab=VDD}
N 1420 -720 1420 -700 {lab=VDD}
N 800 -520 1160 -520 {lab=GND}
N 1200 -540 1200 -520 {lab=GND}
N 1420 -540 1420 -520 {lab=GND}
N 1050 -620 1120 -620 {lab=in}
N 1160 -720 1420 -720 {lab=VDD}
N 1160 -520 1420 -520 {lab=GND}
N 980 -720 980 -710 {lab=VDD}
N 980 -540 980 -520 {lab=GND}
N 980 -710 980 -700 {lab=VDD}
C {inv.sym} 720 -700 0 0 {name=xinv1}
C {devices/vsource.sym} 520 -560 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vsource.sym} 640 -560 0 0 {name=VIN value=3.3 savecurrent=false}
C {devices/vdd.sym} 520 -650 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 800 -750 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 520 -490 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 640 -490 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 800 -490 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 1090 -620 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/code_shown.sym} 620 -890 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} -200 -860 0 0 {name=NGSPICE only_toplevel=true
value=".control
save all

** Define input signal
let fsig = 1e9
let tper = 1/fsig
let tfr = 0.01*tper
let ton = 0.5*tper-2*tfr
let tofs = tper

** Define transient params
let tstop = 4*tper
let tstep = 0.001*tper

** Set Sources
alter @VIN[PULSE] = [ 0 3.3 $&tofs $&tfr $&tfr $&ton $&tper 0 ]

** Simulations
tran $&tstep $&tstop

** Plots
setplot tran1
let vout = v(out)
let vin = v(in)
meas tran tpLH trig v(in) val=1.65 fall=2 TARG v(out) val=1.65 rise=2
meas tran tpHL trig v(in) val=1.65 rise=2 TARG v(out) val=1.65 fall=2
meas tran trise trig v(out) val=0.1*3.3 rise=2 TARG v(out) val=0.9*3.3 rise=2
meas tran tfall trig v(out) val=0.9*3.3 fall=2 TARG v(out) val=0.1*3.3 fall=2
plot vout vin + 4

echo $plots
.endc
"}
C {capa-2.sym} 1540 -560 0 0 {name=CLOAD
m=1
value=10f
footprint=1206
device=polarized_capacitor
}
C {devices/gnd.sym} 1540 -490 0 0 {name=l8 lab=GND}
C {inv.sym} 1120 -700 0 0 {name=xinv3}
C {inv.sym} 1340 -700 0 0 {name=xinv4}
C {devices/lab_wire.sym} 1320 -620 0 0 {name=p2 sig_type=std_logic lab=out
}
C {devices/lab_wire.sym} 680 -620 0 0 {name=p3 sig_type=std_logic lab=a}
C {inv.sym} 900 -700 0 0 {name=xinv2}
