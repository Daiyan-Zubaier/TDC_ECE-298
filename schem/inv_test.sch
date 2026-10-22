v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -170 40 -170 50 {
lab=GND}
N -80 40 -80 50 {
lab=GND}
N -170 -30 -170 -20 {
lab=Vdd}
N -80 -30 -80 -20 {
lab=Vin}
N 70 -10 70 0 {
lab=GND}
C {vsource.sym} -80 10 0 0 {name=Vin value="PULSE(0 3.3 0 .3n .3n 3n 6.6n 5)" savecurrent=false}
C {vsource.sym} -170 10 0 0 {name=Vdd value=3.3 savecurrent=false}
C {gnd.sym} -170 50 0 0 {name=l1 lab=GND}
C {gnd.sym} -80 50 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -170 -30 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -80 -30 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 0 -80 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 70 -150 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 170 -80 2 0 {name=p5 sig_type=std_logic lab=Vout}
C {gnd.sym} 70 0 0 0 {name=l3 lab=GND}
C {code_shown.sym} 270 -40 0 0 {name=s1 only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical

.dc Vin 0 3.3 1m
.tran .02n 10n
.save all
.end
"}
C {inv_vtc.sym} 20 60 0 0 {name=x1}
