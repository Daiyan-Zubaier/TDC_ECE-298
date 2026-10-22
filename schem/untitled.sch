v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 60 -10 60 20 {
lab=vout}
N 60 -90 60 -70 {
lab=vcc}
N 60 80 60 100 {
lab=GND}
N 60 50 70 50 {
lab=GND}
N 70 50 70 80 {
lab=GND}
N 60 80 70 80 {
lab=GND}
N 60 -40 70 -40 {
lab=vcc}
N 70 -80 70 -40 {
lab=vcc}
N 60 -80 70 -80 {
lab=vcc}
N 20 -40 20 50 {
lab=vin}
N 10 10 20 10 {
lab=vin}
N 60 10 100 10 {
lab=vout}
C {vsource.sym} -60 -40 0 0 {name=vcc value=3.3v savecurrent=false}
C {vsource.sym} -160 -40 0 0 {name=vcc1 value="pulse(0 3.3 1ns 1ns 1ns 5ns 10ns)" savecurrent=false}
C {/usr/local/share/pdk/gf180mcuD/libs.tech/xschem/symbols/pfet_03v3.sym} 40 -40 0 0 {name=M1
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
model=pfet_03v3
spiceprefix=X
}
C {/usr/local/share/pdk/gf180mcuD/libs.tech/xschem/symbols/nfet_03v3.sym} 40 50 0 0 {name=M2
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
C {lab_pin.sym} -60 -70 0 0 {name=p1 sig_type=std_logic lab=vcc}
C {lab_pin.sym} -160 -70 0 0 {name=p2 sig_type=std_logic lab=vin}
C {lab_pin.sym} 60 -90 0 0 {name=p4 sig_type=std_logic lab=vcc}
C {lab_pin.sym} 10 10 0 0 {name=p5 sig_type=std_logic lab=vin
}
C {lab_pin.sym} 100 10 2 0 {name=p6 sig_type=std_logic lab=vout}
C {gnd.sym} 60 100 0 0 {name=l1 lab=GND}
C {gnd.sym} -60 -10 0 0 {name=l2 lab=GND}
C {gnd.sym} -160 -10 0 0 {name=l3 lab=GND}
C {code_shown.sym} 230 -40 0 0 {name=s1 only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical

.tran 0.1n 10n
.save all"}
