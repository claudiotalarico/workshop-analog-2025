v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 50 560 850 960 {flags=graph
y1=-62
y2=43
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
color=4
node="\\"vo db20()\\""

sim_type=ac
autoload=0
hilight_wave=0
x2=11}
B 2 50 990 850 1390 {flags=graph
y1=-180
y2=-0.00064
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-0.55
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
color=7
node=ph(vo)

sim_type=ac
autoload=0
hilight_wave=-1
x2=10.45
mode=Line}
T {tcleval(gm/id M1 =  [to_eng [xschem raw value gmoverid_m1a 0]]
fT M1       = [to_eng [xschem raw value ft_m1a 0]]
gm/id M2 =  [to_eng [xschem raw value gmoverid_m2a 0]]
fT M2       = [to_eng [xschem raw value ft_m2a 0]]
)
} 60 80 0 0 0.3 0.3 {floater = 1}
T {tcleval(A0: [to_eng [xschem raw value A0 0]]
GBW: [to_eng [xschem raw value GBW 0]]
UGF: [to_eng [xschem raw value ugf 0]]
PM: [to_eng [xschem raw value pm 0]]
)} 310 80 0 0 0.3 0.3 {floater=1}
N 260 330 300 330 {
lab=#net1}
N 80 280 80 440 {
lab=#net1}
N 80 280 260 280 {
lab=#net1}
N 80 500 80 520 {
lab=GND}
N 260 500 260 520 {
lab=GND}
N 260 420 340 420 {
lab=#net2}
N 260 420 260 440 {
lab=#net2}
N 260 370 300 370 {
lab=GND}
N 260 370 260 390 {
lab=GND}
N 180 380 180 420 {
lab=#net2}
N 340 380 340 420 {
lab=#net2}
N 260 280 260 330 {
lab=#net1}
N 180 420 260 420 {
lab=#net2}
N 220 370 260 370 {
lab=GND}
N 220 330 260 330 {
lab=#net1}
N 340 290 340 320 {lab=vim}
N 460 400 460 440 {
lab=VSS}
N 460 500 460 520 {
lab=GND}
N 560 400 560 440 {
lab=VDD}
N 560 500 560 520 {
lab=GND}
N 780 250 780 290 {lab=vo}
N 780 350 780 390 {lab=GND}
N 610 250 780 250 {
lab=vo}
N 180 210 460 210 {lab=vip}
N 180 210 180 320 {lab=vip}
N 340 290 460 290 {lab=vim}
N 540 170 540 200 {lab=#net3}
N 540 80 540 110 {lab=VDD}
C {devices/lab_wire.sym} 520 190 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 850 60 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value=".lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.inc /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.param vdd=3 vcm=1.5 cl=1p
.param ibn=10e-6 
.param W0=2e-06 W1=5e-06 W2=2e-06 
.param L0=1e-06 L1=0.5e-06 L2=1e-06
.param nf0=1.00 nf1=1.00 nf2=1.00
.option savecurrents

.control
    save all
    op
    show
    let gmoverid_m1a = \{@m.x1.xm1a.m0[gm]/@m.x1.xm1a.m0[id]\}
    let gmoverid_m1b = \{@m.x1.xm1b.m0[gm]/@m.x1.xm1b.m0[id]\}
    let gmoverid_m2a = \{@m.x1.xm2a.m0[gm]/@m.x1.xm2a.m0[id]\}
    let gmoverid_m2b = \{@m.x1.xm2b.m0[gm]/@m.x1.xm2b.m0[id]\}
    let ft_m1a = \{@m.x1.xm1a.m0[gm]/(@m.x1.xm1a.m0[cgg]+@m.x1.xm1a.m0[cgso]+@m.x1.xm1a.m0[cgdo])\}
    let ft_m1b = \{@m.x1.xm1b.m0[gm]/(@m.x1.xm1b.m0[cgg]+@m.x1.xm1b.m0[cgso]+@m.x1.xm1b.m0[cgdo])\}
    let ft_m2a = \{@m.x1.xm2a.m0[gm]/(@m.x1.xm2a.m0[cgg]+@m.x1.xm2a.m0[cgso]+@m.x1.xm2a.m0[cgdo])\}
    let ft_m2b = \{@m.x1.xm2b.m0[gm]/(@m.x1.xm2b.m0[cgg]+@m.x1.xm2b.m0[cgso]+@m.x1.xm2b.m0[cgdo])\}
    echo gmoverid_m1a = $&gmoverid_m1a
    echo gmoverid_m1b = $&gmoverid_m1b
    echo ft_m1a = $&ft_m1a
    echo ft_m1b = $&ft_m1b
    echo gmoverid_m2a = $&gmoverid_m2a
    echo gmoverid_m2b = $&gmoverid_m2b
    echo ft_m2a = $&ft_m2a
    echo ft_m2b = $&ft_m2b
    write baseline-ota-5t_gf_tb.raw
    set appendwrite

    ac dec 20 1 10e10
    let vo_mag = abs(v(vo))
    let vo_phase_margin = phase(v(vo)) * 180/pi + 180
    meas ac A0 max vo_mag
    let ref = A0/sqrt(2)
    meas ac BW when vo_mag=ref fall=1
    let GBW = A0*BW
    meas ac UGF when vo_mag=1 fall=1
    meas ac PM find vo_phase_margin when vo_mag=1
    echo A0 = $&A0 
    echo GBW = $&GBW 
    echo UGF = $&UGF 
    echo PM = $&PM
    remzerovec
    write baseline-ota-5t_gf_tb.raw
.endc
"}
C {devices/launcher.sym} 120 50 0 0 {name=h26
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/vcvs.sym} 180 350 0 1 {name=E1 value=0.5}
C {devices/vcvs.sym} 340 350 0 0 {name=E2 value=-0.5}
C {devices/vsource.sym} 80 470 0 0 {name=Vdm value="dc 0 ac 1" savecurrent=false}
C {devices/vsource.sym} 260 470 0 0 {name=Vcm value=\{vcm\} savecurrent=false}
C {devices/gnd.sym} 80 520 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 260 520 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 260 390 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 460 470 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 460 520 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 560 470 0 0 {name=V1 value=\{vdd\} savecurrent=false}
C {devices/lab_wire.sym} 460 400 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 560 400 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 560 520 0 0 {name=l1 lab=GND}
C {devices/capa.sym} 780 320 0 0 {name=C1
m=1
value=\{cl\}
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 780 390 0 0 {name=l2 lab=GND}
C {devices/isource.sym} 540 140 0 0 {name=IB value=\{ibn\}}
C {devices/lab_wire.sym} 540 80 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 400 210 0 1 {name=p4 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 400 290 0 1 {name=p6 sig_type=std_logic lab=vim}
C {ota-5t_gf.sym} 530 250 0 0 {name=x1}
C {devices/lab_wire.sym} 520 310 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 690 250 0 1 {name=p8 sig_type=std_logic lab=vo}
C {devices/launcher.sym} 370 50 0 0 {name=h27
descr="Load AC" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw ac
"
}
