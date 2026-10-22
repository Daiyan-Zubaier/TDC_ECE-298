v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 40 -50 40 -30 {
lab=Vds}
N 40 -50 170 -50 {
lab=Vds}
N -70 -0 -0 0 {
lab=Vgs}
N 40 30 50 30 {
lab=GND}
N 50 -0 50 30 {
lab=GND}
N 40 0 50 -0 {
lab=GND}
C {symbols/nfet_03v3.sym} 20 0 0 0 {name=M1
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {vsource.sym} -70 30 0 0 {name=Vgs value=0 savecurrent=false}
C {vsource.sym} 170 -20 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} -70 60 0 0 {name=l1 lab=GND}
C {gnd.sym} 40 30 0 0 {name=l2 lab=GND}
C {gnd.sym} 170 10 0 0 {name=l3 lab=GND}
C {code_shown.sym} 300 0 0 0 {name=s1 only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical

.dc Vgs 0 3.3 1m Vds 0 3.3 .5
.save all
.end
"}
C {lab_pin.sym} -70 0 0 0 {name=p1 sig_type=std_logic lab=Vgs}
C {lab_pin.sym} 170 -50 2 0 {name=p2 sig_type=std_logic lab=Vds}
