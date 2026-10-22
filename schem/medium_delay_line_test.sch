v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -170 200 -140 200 {
lab=#net1}
N -140 110 -140 200 {
lab=#net1}
N -140 110 -110 110 {
lab=#net1}
N -380 200 -340 200 {
lab=VSTART}
N 130 200 160 200 {
lab=#net2}
N 160 110 160 200 {
lab=#net2}
N 160 110 190 110 {
lab=#net2}
N -140 200 -40 200 {
lab=#net1}
N 430 200 460 200 {
lab=#net3}
N 460 110 460 200 {
lab=#net3}
N 460 110 490 110 {
lab=#net3}
N 730 200 760 200 {
lab=#net4}
N 760 110 760 200 {
lab=#net4}
N 760 110 790 110 {
lab=#net4}
N 460 200 560 200 {
lab=#net3}
N 1040 200 1070 200 {
lab=#net5}
N 1070 110 1070 200 {
lab=#net5}
N 1070 110 1100 110 {
lab=#net5}
N 1340 200 1370 200 {
lab=#net6}
N 1370 110 1370 200 {
lab=#net6}
N 1370 110 1400 110 {
lab=#net6}
N 1070 200 1170 200 {
lab=#net5}
N 1640 200 1670 200 {
lab=#net7}
N 1670 110 1670 200 {
lab=#net7}
N 1670 110 1700 110 {
lab=#net7}
N 1940 200 1970 200 {
lab=#net8}
N 1970 110 1970 200 {
lab=#net8}
N 1970 110 2000 110 {
lab=#net8}
N 1670 200 1770 200 {
lab=#net7}
N 160 200 260 200 {
lab=#net2}
N 760 200 870 200 {
lab=#net4}
N 1370 200 1470 200 {
lab=#net6}
N -360 20 -110 20 {
lab=VSTOP}
N -110 20 -110 70 {
lab=VSTOP}
N -110 20 2000 20 {
lab=VSTOP}
N 190 20 190 70 {
lab=VSTOP}
N 490 20 490 70 {
lab=VSTOP}
N 790 20 790 70 {
lab=VSTOP}
N 1100 20 1100 70 {
lab=VSTOP}
N 1400 20 1400 70 {
lab=VSTOP}
N 1700 20 1700 70 {
lab=VSTOP}
N 2000 20 2000 70 {
lab=VSTOP}
N 2190 200 2220 200 {
lab=#net8}
N 2220 110 2220 200 {
lab=#net8}
N 2220 110 2250 110 {
lab=#net8}
N 2490 200 2520 200 {
lab=#net9}
N 2520 110 2520 200 {
lab=#net9}
N 2520 110 2550 110 {
lab=#net9}
N 2220 200 2320 200 {
lab=#net8}
N 2790 200 2820 200 {
lab=#net10}
N 2820 110 2820 200 {
lab=#net10}
N 2820 110 2850 110 {
lab=#net10}
N 3090 200 3120 200 {
lab=#net11}
N 3120 110 3120 200 {
lab=#net11}
N 3120 110 3150 110 {
lab=#net11}
N 2820 200 2920 200 {
lab=#net10}
N 3400 200 3430 200 {
lab=#net12}
N 3430 110 3430 200 {
lab=#net12}
N 3430 110 3460 110 {
lab=#net12}
N 3700 200 3730 200 {
lab=#net13}
N 3730 110 3730 200 {
lab=#net13}
N 3730 110 3760 110 {
lab=#net13}
N 3430 200 3530 200 {
lab=#net12}
N 4000 200 4030 200 {
lab=#net14}
N 4030 110 4030 200 {
lab=#net14}
N 4030 110 4060 110 {
lab=#net14}
N 4300 200 4330 200 {
lab=#net15}
N 4330 110 4330 200 {
lab=#net15}
N 4330 110 4360 110 {
lab=#net15}
N 4030 200 4130 200 {
lab=#net14}
N 2520 200 2620 200 {
lab=#net9}
N 3120 200 3230 200 {
lab=#net11}
N 3730 200 3830 200 {
lab=#net13}
N 2250 20 2250 70 {
lab=VSTOP}
N 2250 20 4360 20 {
lab=VSTOP}
N 2550 20 2550 70 {
lab=VSTOP}
N 2850 20 2850 70 {
lab=VSTOP}
N 3150 20 3150 70 {
lab=VSTOP}
N 3460 20 3460 70 {
lab=VSTOP}
N 3760 20 3760 70 {
lab=VSTOP}
N 4060 20 4060 70 {
lab=VSTOP}
N 4360 20 4360 70 {
lab=VSTOP}
N 2000 20 2250 20 {
lab=VSTOP}
N 1970 200 2190 200 {
lab=#net8}
C {pdk_dff.sym} -20 110 0 0 {name=X1 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} -190 240 0 0 {name=X2 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {lab_pin.sym} -380 200 0 0 {name=p1 sig_type=std_logic lab=VSTART}
C {pdk_dff.sym} 280 110 0 0 {name=X3 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 110 240 0 0 {name=X4 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 580 110 0 0 {name=X5 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 410 240 0 0 {name=X6 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 880 110 0 0 {name=X7 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 710 240 0 0 {name=X8 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1190 110 0 0 {name=X9 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1020 240 0 0 {name=X10 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1490 110 0 0 {name=X11 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1320 240 0 0 {name=X12 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1790 110 0 0 {name=X13 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1620 240 0 0 {name=X14 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 2090 110 0 0 {name=X15 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1920 240 0 0 {name=X16 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {lab_pin.sym} -360 20 0 0 {name=p2 sig_type=std_logic lab=VSTOP}
C {lab_pin.sym} 70 70 2 0 {name=p3 sig_type=std_logic lab=D15}
C {lab_pin.sym} 370 70 2 0 {name=p4 sig_type=std_logic lab=D14}
C {lab_pin.sym} 670 70 2 0 {name=p5 sig_type=std_logic lab=D13}
C {lab_pin.sym} 970 70 2 0 {name=p6 sig_type=std_logic lab=D12}
C {lab_pin.sym} 1280 70 2 0 {name=p7 sig_type=std_logic lab=D11}
C {lab_pin.sym} 1580 70 2 0 {name=p8 sig_type=std_logic lab=D10}
C {lab_pin.sym} 1880 70 2 0 {name=p9 sig_type=std_logic lab=D9}
C {lab_pin.sym} 2180 70 2 0 {name=p10 sig_type=std_logic lab=D8}
C {vsource.sym} -550 70 0 0 {name=vstart value="PULSE(0 3.3 1n 20p 20p 10n 30n)" savecurrent=false}
C {vsource.sym} -630 150 0 0 {name=vstop value="PULSE(0 3.3 6n 20p 20p 10n 30n)" savecurrent=false}
C {gnd.sym} -630 180 0 0 {name=l1 lab=GND}
C {gnd.sym} -550 100 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -550 40 0 0 {name=p11 sig_type=std_logic lab=VSTART}
C {lab_pin.sym} -630 120 0 0 {name=p12 sig_type=std_logic lab=VSTOP}
C {code_shown.sym} -130 -160 0 0 {name=MODELS
only_toplevel=true
value="
.include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.include /usr/local/share/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
"}
C {code_shown.sym} -1250 -390 0 0 {name=SIM
only_toplevel=true
value="
.tran 1p 30n 0 1p

.meas tran b15 FIND v(d15) AT=8n
.meas tran b14 FIND v(d14) AT=8n
.meas tran b13 FIND v(d13) AT=8n
.meas tran b12 FIND v(d12) AT=8n
.meas tran b11 FIND v(d11) AT=8n
.meas tran b10 FIND v(d10) AT=8n
.meas tran b9 FIND v(d9) AT=8n
.meas tran b8 FIND v(d8) AT=8n
.meas tran b7 FIND v(d7) AT=8n
.meas tran b6 FIND v(d6) AT=8n
.meas tran b5 FIND v(d5) AT=8n
.meas tran b4 FIND v(d4) AT=8n
.meas tran b3 FIND v(d3) AT=8n
.meas tran b2 FIND v(d2) AT=8n
.meas tran b1 FIND v(d1) AT=8n
.meas tran b0 FIND v(d0) AT=8n

.meas tran t1 WHEN v(net1)=1.65 RISE=1
.meas tran t2 WHEN v(net2)=1.65 RISE=1
.meas tran t3 WHEN v(net3)=1.65 RISE=1

.meas tran bin1 PARAM='t2-t1'
.meas tran bin2 PARAM='t3-t2'
"}
C {vsource.sym} -770 50 0 0 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} -770 80 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -770 20 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {pdk_dff.sym} 2340 110 0 0 {name=X17 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_dff.sym} 2640 110 0 0 {name=X18 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 2470 240 0 0 {name=X19 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 2940 110 0 0 {name=X20 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 2770 240 0 0 {name=X21 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3240 110 0 0 {name=X22 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3070 240 0 0 {name=X23 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3550 110 0 0 {name=X24 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3380 240 0 0 {name=X25 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3850 110 0 0 {name=X26 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3680 240 0 0 {name=X27 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 4150 110 0 0 {name=X28 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3980 240 0 0 {name=X29 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 4450 110 0 0 {name=X30 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 4280 240 0 0 {name=X31 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {lab_pin.sym} 2430 70 2 0 {name=p14 sig_type=std_logic lab=D7}
C {lab_pin.sym} 2730 70 2 0 {name=p15 sig_type=std_logic lab=D6}
C {lab_pin.sym} 3030 70 2 0 {name=p16 sig_type=std_logic lab=D5}
C {lab_pin.sym} 3330 70 2 0 {name=p17 sig_type=std_logic lab=D4}
C {lab_pin.sym} 3640 70 2 0 {name=p18 sig_type=std_logic lab=D3}
C {lab_pin.sym} 3940 70 2 0 {name=p19 sig_type=std_logic lab=D2}
C {lab_pin.sym} 4240 70 2 0 {name=p20 sig_type=std_logic lab=D1}
C {lab_pin.sym} 4540 70 2 0 {name=p21 sig_type=std_logic lab=D0}
