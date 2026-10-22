v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -360 30 -360 40 {
lab=GND}
N -450 30 -450 50 {
lab=GND}
C {vsource.sym} -360 0 0 0 {name=Vin value="PULSE(0 3.3 1n 20p 20p 3n 6.6n)" savecurrent=false}
C {gnd.sym} -360 40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -80 0 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -360 -30 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {vsource.sym} -450 0 0 0 {name=vdd value=3.3 savecurrent=false}
C {gnd.sym} -450 50 0 0 {name=l2 lab=GND}
C {code_shown.sym} -230 -170 0 0 {name=MODELS
only_toplevel=true
value="
.include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.include /usr/local/share/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
"}
C {code_shown.sym} 290 -60 0 0 {name=SIM
only_toplevel=true
value="
.temp 25
.param CL=1f

Xa1 Vin out_a1 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlya_1
Xa2 Vin out_a2 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlya_2
Xa4 Vin out_a4 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlya_4

Xb1 Vin out_b1 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyb_1
Xb2 Vin out_b2 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyb_2
Xb4 Vin out_b4 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyb_4

Xc1 Vin out_c1 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyc_1
Xc2 Vin out_c2 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyc_2
Xc4 Vin out_c4 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyc_4

Xd1 Vin out_d1 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyd_1
Xd2 Vin out_d2 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyd_2
Xd4 Vin out_d4 VDD VDD 0 0 gf180mcu_fd_sc_mcu7t5v0__dlyd_4

Ca1 out_a1 0 \{CL\}
Ca2 out_a2 0 \{CL\}
Ca4 out_a4 0 \{CL\}
Cb1 out_b1 0 \{CL\}
Cb2 out_b2 0 \{CL\}
Cb4 out_b4 0 \{CL\}
Cc1 out_c1 0 \{CL\}
Cc2 out_c2 0 \{CL\}
Cc4 out_c4 0 \{CL\}
Cd1 out_d1 0 \{CL\}
Cd2 out_d2 0 \{CL\}
Cd4 out_d4 0 \{CL\}

.tran 1p 30n 0 1p

.control
run

foreach cell a1 a2 a4 b1 b2 b4 c1 c2 c4 d1 d2 d4
    echo Cell: $cell
    meas tran rise_\{$cell\} TRIG v(Vin) VAL=1.65 RISE=2 TARG v(out_\{$cell\}) VAL=1.65 RISE=2
    meas tran fall_\{$cell\} TRIG v(Vin) VAL=1.65 FALL=2 TARG v(out_\{$cell\}) VAL=1.65 FALL=2
end

.endc
"}
C {lab_pin.sym} -450 -30 0 0 {name=p4 sig_type=std_logic lab=VDD}
