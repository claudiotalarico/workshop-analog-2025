v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 640 -330 640 -290 {lab=GND}
N 760 -330 760 -290 {lab=GND}
N 640 -450 640 -390 {lab=VDD}
N 760 -420 760 -390 {lab=in}
N 920 -550 920 -500 {lab=VDD}
N 920 -340 920 -290 {lab=GND}
N 800 -420 840 -420 {lab=in}
N 1040 -420 1040 -390 {lab=out}
N 1040 -330 1040 -290 {lab=GND}
N 760 -420 800 -420 {lab=in}
N 990 -420 1040 -420 {lab=out}
C {inv.sym} 840 -500 0 0 {name=xinv1}
C {devices/vsource.sym} 640 -360 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vsource.sym} 760 -360 0 0 {name=VIN value=3.3 savecurrent=false}
C {devices/vdd.sym} 640 -450 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 920 -550 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 640 -290 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 760 -290 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 920 -290 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 830 -420 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_wire.sym} 1040 -420 0 0 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 620 -890 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 20 -890 0 0 {name=NGSPICE only_toplevel=true
value="

.control
save all

** Define input signal
* let fsig = 1e3 ; too slow
let fsig = 1e9
let tper = 1/fsig
let tfr = 0.01*tper
let ton = 0.5*tper-2*tfr
let tofs = tper

** Define transient params
let tstop = 4*tper
let tstep = 0.001*tper

** Set Sources
alter @VIN[DC] = 0.0
alter @VIN[PULSE] = [ 0 3.3 $&tofs $&tfr $&tfr $&ton $&tper 0 ]

** Simulations
op
dc vin 0 3.3 0.01
tran $&tstep $&tstop

** Plots
setplot dc1
let vout = v(out)
let dvout = deriv(v(out))
plot v(in) vout
meas dc VSW find v(in) when v(out)=1.65
meas dc VIL find v(in) when dvout=-1 cross=1
meas dc VIH find v(in) when dvout=-1 cross=2
meas dc VOH find v(out) when dvout=-1 cross=1
meas dc VOL find v(out) when dvout=-1 cross=2

setplot tran1
let vout = v(out)
let vin = v(in)
let ivdd = -v1#branch*1e4
meas tran tpLH trig v(in) val=1.65 fall=2 TARG v(out) val=1.65 rise=2
meas tran tpHL trig v(in) val=1.65 rise=2 TARG v(out) val=1.65 fall=2
meas tran trise trig v(out) val=0.1*3.3 rise=2 TARG v(out) val=0.9*3.3 rise=2
meas tran tfall trig v(out) val=0.9*3.3 fall=2 TARG v(out) val=0.1*3.3 fall=2
plot ivdd
plot vin+4 vout


setplot op1
write inv_tb.raw

echo $plots
.endc
"}
C {devices/launcher.sym} 680 -710 0 0 {name=h1
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"}
C {capa-2.sym} 1040 -360 0 0 {name=CLOAD
m=1
value=10f
footprint=1206
device=polarized_capacitor
}
C {devices/gnd.sym} 1040 -290 0 0 {name=l8 lab=GND}
