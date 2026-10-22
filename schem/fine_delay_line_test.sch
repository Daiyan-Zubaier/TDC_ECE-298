v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 -170 70 -120 {
lab=#net1}
N 70 -120 100 -120 {
lab=#net1}
N 70 -80 70 10 {
lab=#net2}
N 70 -80 100 -80 {
lab=#net2}
N 470 -170 470 -120 {
lab=#net3}
N 470 -120 500 -120 {
lab=#net3}
N 470 -80 470 10 {
lab=#net4}
N 470 -80 500 -80 {
lab=#net4}
N 70 -170 300 -170 {
lab=#net1}
N 70 10 300 10 {
lab=#net2}
N 870 -170 870 -120 {
lab=#net5}
N 870 -120 900 -120 {
lab=#net5}
N 870 -80 870 10 {
lab=#net6}
N 870 -80 900 -80 {
lab=#net6}
N 470 -170 700 -170 {
lab=#net3}
N 470 10 700 10 {
lab=#net4}
N 1260 -170 1260 -120 {
lab=#net7}
N 1260 -120 1290 -120 {
lab=#net7}
N 1260 -80 1260 10 {
lab=#net8}
N 1260 -80 1290 -80 {
lab=#net8}
N 1660 -170 1660 -120 {
lab=#net9}
N 1660 -120 1690 -120 {
lab=#net9}
N 1660 -80 1660 10 {
lab=#net10}
N 1660 -80 1690 -80 {
lab=#net10}
N 1260 -170 1490 -170 {
lab=#net7}
N 1260 10 1490 10 {
lab=#net8}
N 2060 -170 2060 -120 {
lab=#net11}
N 2060 -120 2090 -120 {
lab=#net11}
N 2060 -80 2060 10 {
lab=#net12}
N 2060 -80 2090 -80 {
lab=#net12}
N 2460 -170 2460 -120 {
lab=#net13}
N 2460 -120 2490 -120 {
lab=#net13}
N 2460 -80 2460 10 {
lab=#net14}
N 2460 -80 2490 -80 {
lab=#net14}
N 2060 -170 2290 -170 {
lab=#net11}
N 2060 10 2290 10 {
lab=#net12}
N 2850 -170 2850 -120 {
lab=#net15}
N 2850 -120 2880 -120 {
lab=#net15}
N 2850 -80 2850 10 {
lab=#net16}
N 2850 -80 2880 -80 {
lab=#net16}
N 3250 -170 3250 -120 {
lab=#net17}
N 3250 -120 3280 -120 {
lab=#net17}
N 3250 -80 3250 10 {
lab=#net18}
N 3250 -80 3280 -80 {
lab=#net18}
N 2850 -170 3080 -170 {
lab=#net15}
N 2850 10 3080 10 {
lab=#net16}
N 870 10 1090 10 {
lab=#net6}
N 870 -170 1090 -170 {
lab=#net5}
N 1660 -170 1890 -170 {
lab=#net9}
N 1660 10 1890 10 {
lab=#net10}
N 2460 -170 2680 -170 {
lab=#net13}
N 2460 10 2680 10 {
lab=#net14}
C {slow_delay_cell.sym} -30 -160 0 0 {name=X1 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} -20 10 0 0 {name=X2 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 190 -80 0 0 {name=X3 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {lab_pin.sym} -100 -170 0 0 {name=p1 sig_type=std_logic lab=VSTART}
C {lab_pin.sym} -100 10 0 0 {name=p2 sig_type=std_logic lab=VSTOP}
C {slow_delay_cell.sym} 370 -160 0 0 {name=X4 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 380 10 0 0 {name=X5 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 590 -80 0 0 {name=X6 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 770 -160 0 0 {name=X7 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 780 10 0 0 {name=X8 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 990 -80 0 0 {name=X9 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1160 -160 0 0 {name=X10 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1170 10 0 0 {name=X11 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 1380 -80 0 0 {name=X12 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1560 -160 0 0 {name=X13 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1570 10 0 0 {name=X14 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 1780 -80 0 0 {name=X15 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1960 -160 0 0 {name=X16 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1970 10 0 0 {name=X17 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2180 -80 0 0 {name=X18 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 2360 -160 0 0 {name=X19 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 2370 10 0 0 {name=X20 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2580 -80 0 0 {name=X21 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 2750 -160 0 0 {name=X22 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 2760 10 0 0 {name=X23 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2970 -80 0 0 {name=X24 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 3150 -160 0 0 {name=X25 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 3160 10 0 0 {name=X26 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 3370 -80 0 0 {name=X27 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {lab_pin.sym} 280 -120 2 0 {name=p3 sig_type=std_logic lab=D8}
C {lab_pin.sym} 680 -120 2 0 {name=p4 sig_type=std_logic lab=D7}
C {lab_pin.sym} 1080 -120 2 0 {name=p5 sig_type=std_logic lab=D6}
C {lab_pin.sym} 1470 -120 2 0 {name=p6 sig_type=std_logic lab=D5}
C {lab_pin.sym} 1870 -120 2 0 {name=p7 sig_type=std_logic lab=D4}
C {lab_pin.sym} 2270 -120 2 0 {name=p8 sig_type=std_logic lab=D3}
C {lab_pin.sym} 2670 -120 2 0 {name=p9 sig_type=std_logic lab=D2}
C {lab_pin.sym} 3060 -120 2 0 {name=p10 sig_type=std_logic lab=D1}
C {lab_pin.sym} 3460 -120 2 0 {name=p11 sig_type=std_logic lab=D0}
C {vsource.sym} -510 -90 0 0 {name=vstart value="PULSE(0 3.3 100p 20p 20p 20n 50n)" savecurrent=false}
C {vsource.sym} -510 10 0 0 {name=vstop value="PULSE(0 3.3 500p 20p 20p 20n 50n)" savecurrent=false}
C {gnd.sym} -510 40 0 0 {name=l1 lab=GND}
C {gnd.sym} -510 -60 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -510 -120 0 0 {name=p12 sig_type=std_logic lab=VSTART}
C {lab_pin.sym} -510 -20 0 0 {name=p13 sig_type=std_logic lab=VSTOP}
C {vsource.sym} -640 -50 0 0 {name=vdd value=3.3 savecurrent=false}
C {gnd.sym} -640 -20 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -640 -80 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {code_shown.sym} -1190 240 0 0 {name=SIM only_toplevel=false value="
.temp 25
.tran 1p 15n 0 1p

.meas tran b8 FIND v(d8) AT=12n
.meas tran b7 FIND v(d7) AT=12n
.meas tran b6 FIND v(d6) AT=12n
.meas tran b5 FIND v(d5) AT=12n
.meas tran b4 FIND v(d4) AT=12n
.meas tran b3 FIND v(d3) AT=12n
.meas tran b2 FIND v(d2) AT=12n
.meas tran b1 FIND v(d1) AT=12n
.meas tran b0 FIND v(d0) AT=12n

"}
C {code_shown.sym} -1210 100 0 0 {name=MODELS
only_toplevel=true
value="
.include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.include /usr/local/share/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
"}
