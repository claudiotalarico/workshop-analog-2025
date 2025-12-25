v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {ring_pex.sym} 720 -870 0 0 0.3 0.3 {}
N 370 -710 370 -670 {lab=GND}
N 370 -830 370 -770 {lab=VDD}
N 640 -920 640 -870 {lab=VDD}
N 640 -710 640 -660 {lab=GND}
N 710 -790 760 -790 {lab=out}
C {devices/vsource.sym} 370 -740 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vdd.sym} 370 -830 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 640 -920 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 370 -670 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 640 -660 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 750 -790 0 0 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 20 -1000 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 20 -890 0 0 {name=NGSPICE only_toplevel=true
value=".control
save all

** Define transient params
let fsig = 1e9
let tper = 1/fsig
let tstop = 3*tper
let tstep = 0.001*tper

** Simulations
tran $&tstep $&tstop

** Plots
setplot tran1
let vout = v(out)
meas tran tosc trig v(out) val=0.5*3.3 rise=4 TARG v(out) val=0.5*3.3 rise=5
plot vout

echo $plots
.endc
"}
C {ring_pex.sym} 560 -870 0 0 {name=x1}
C {code_shown.sym} 30 -490 0 0 {name=include only_toplevel=false value=".include ./ring.pex.spc"}
