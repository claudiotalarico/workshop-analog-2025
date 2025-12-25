v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 620 -540 620 -500 {lab=GND}
N 740 -540 740 -500 {lab=GND}
N 620 -660 620 -600 {lab=VDD}
N 740 -630 740 -600 {lab=in}
N 900 -760 900 -710 {lab=VDD}
N 900 -550 900 -500 {lab=GND}
N 780 -630 820 -630 {lab=in}
N 740 -630 780 -630 {lab=in}
N 970 -630 1020 -630 {lab=out}
C {inv.sym} 820 -710 0 0 {name=xinv1}
C {devices/vsource.sym} 620 -570 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vsource.sym} 740 -570 0 0 {name=VIN value=3.3 savecurrent=false}
C {devices/vdd.sym} 620 -660 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 900 -760 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 620 -500 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 740 -500 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 900 -500 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 810 -630 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_wire.sym} 1020 -630 0 0 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 620 -890 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 20 -890 0 0 {name=NGSPICE only_toplevel=true
value="
.control
option num_digit = 3
set wr_singlescale
set wr_vecnames
save all

** Simulation (DC Sweep)
dc vin 0 3.3 0.01

** Plots
let vout = v(out)
let dvout = deriv(v(out))
plot v(in) vout
meas dc VSW find v(in) when v(out)=1.65
meas dc VIL find v(in) when dvout=-1 cross=1
meas dc VIH find v(in) when dvout=-1 cross=2
meas dc VOH find v(out) when dvout=-1 cross=1
meas dc VOL find v(out) when dvout=-1 cross=2

wrdata inv_tb_stat_enh.txt v(in) v(out) VSW VIL VIH VOH VOL 

echo $plots
.endc
"}
