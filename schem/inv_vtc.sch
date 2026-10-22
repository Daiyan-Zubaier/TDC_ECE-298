v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 40 -10 40 10 {
lab=vout}
N 40 0 90 -0 {
lab=vout}
N -10 -40 0 -40 {
lab=vin}
N -10 -40 -10 40 {
lab=vin}
N -10 40 -0 40 {
lab=vin}
N -50 0 -10 0 {
lab=vin}
N 40 -100 40 -70 {
lab=vdd}
N 40 70 40 100 {
lab=gnd}
N 40 -40 50 -40 {
lab=vdd}
N 50 -80 50 -40 {
lab=vdd}
N 40 -80 50 -80 {
lab=vdd}
N 40 40 50 40 {
lab=gnd}
N 50 40 50 80 {
lab=gnd}
N 40 80 50 80 {
lab=gnd}
C {symbols/pfet_03v3.sym} 20 -40 0 0 {name=M1
L=0.28u
W=0.88u
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
C {symbols/nfet_03v3.sym} 20 40 0 0 {name=M2
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
C {ipin.sym} -50 0 0 0 {name=p1 lab=vin}
C {ipin.sym} 40 100 3 0 {name=p2 lab=gnd}
C {ipin.sym} 40 -100 1 0 {name=p3 lab=vdd}
C {opin.sym} 90 0 0 0 {name=p4 lab=vout}
