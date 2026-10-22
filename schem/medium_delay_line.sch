v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -210 140 -180 140 {
lab=#net1}
N -180 50 -180 140 {
lab=#net1}
N -180 50 -150 50 {
lab=#net1}
N -420 140 -380 140 {
lab=VSTART}
N 90 140 120 140 {
lab=#net2}
N 120 50 120 140 {
lab=#net2}
N 120 50 150 50 {
lab=#net2}
N -180 140 -80 140 {
lab=#net1}
N 390 140 420 140 {
lab=#net3}
N 420 50 420 140 {
lab=#net3}
N 420 50 450 50 {
lab=#net3}
N 690 140 720 140 {
lab=#net4}
N 720 50 720 140 {
lab=#net4}
N 720 50 750 50 {
lab=#net4}
N 420 140 520 140 {
lab=#net3}
N 1000 140 1030 140 {
lab=#net5}
N 1030 50 1030 140 {
lab=#net5}
N 1030 50 1060 50 {
lab=#net5}
N 1300 140 1330 140 {
lab=#net6}
N 1330 50 1330 140 {
lab=#net6}
N 1330 50 1360 50 {
lab=#net6}
N 1030 140 1130 140 {
lab=#net5}
N 1600 140 1630 140 {
lab=#net7}
N 1630 50 1630 140 {
lab=#net7}
N 1630 50 1660 50 {
lab=#net7}
N 1900 140 1930 140 {
lab=#net8}
N 1930 50 1930 140 {
lab=#net8}
N 1930 50 1960 50 {
lab=#net8}
N 1630 140 1730 140 {
lab=#net7}
N 120 140 220 140 {
lab=#net2}
N 720 140 830 140 {
lab=#net4}
N 1330 140 1430 140 {
lab=#net6}
N -400 -40 -150 -40 {
lab=VSTOP}
N -150 -40 -150 10 {
lab=VSTOP}
N -150 -40 1960 -40 {
lab=VSTOP}
N 150 -40 150 10 {
lab=VSTOP}
N 450 -40 450 10 {
lab=VSTOP}
N 750 -40 750 10 {
lab=VSTOP}
N 1060 -40 1060 10 {
lab=VSTOP}
N 1360 -40 1360 10 {
lab=VSTOP}
N 1660 -40 1660 10 {
lab=VSTOP}
N 1960 -40 1960 10 {
lab=VSTOP}
N 2150 140 2180 140 {
lab=#net8}
N 2180 50 2180 140 {
lab=#net8}
N 2180 50 2210 50 {
lab=#net8}
N 2450 140 2480 140 {
lab=#net9}
N 2480 50 2480 140 {
lab=#net9}
N 2480 50 2510 50 {
lab=#net9}
N 2180 140 2280 140 {
lab=#net8}
N 2750 140 2780 140 {
lab=#net10}
N 2780 50 2780 140 {
lab=#net10}
N 2780 50 2810 50 {
lab=#net10}
N 3050 140 3080 140 {
lab=#net11}
N 3080 50 3080 140 {
lab=#net11}
N 3080 50 3110 50 {
lab=#net11}
N 2780 140 2880 140 {
lab=#net10}
N 3360 140 3390 140 {
lab=#net12}
N 3390 50 3390 140 {
lab=#net12}
N 3390 50 3420 50 {
lab=#net12}
N 3660 140 3690 140 {
lab=#net13}
N 3690 50 3690 140 {
lab=#net13}
N 3690 50 3720 50 {
lab=#net13}
N 3390 140 3490 140 {
lab=#net12}
N 3960 140 3990 140 {
lab=#net14}
N 3990 50 3990 140 {
lab=#net14}
N 3990 50 4020 50 {
lab=#net14}
N 4260 140 4290 140 {
lab=#net15}
N 4290 50 4290 140 {
lab=#net15}
N 4290 50 4320 50 {
lab=#net15}
N 3990 140 4090 140 {
lab=#net14}
N 2480 140 2580 140 {
lab=#net9}
N 3080 140 3190 140 {
lab=#net11}
N 3690 140 3790 140 {
lab=#net13}
N 2210 -40 2210 10 {
lab=VSTOP}
N 2210 -40 4320 -40 {
lab=VSTOP}
N 2510 -40 2510 10 {
lab=VSTOP}
N 2810 -40 2810 10 {
lab=VSTOP}
N 3110 -40 3110 10 {
lab=VSTOP}
N 3420 -40 3420 10 {
lab=VSTOP}
N 3720 -40 3720 10 {
lab=VSTOP}
N 4020 -40 4020 10 {
lab=VSTOP}
N 4320 -40 4320 10 {
lab=VSTOP}
N 1960 -40 2210 -40 {
lab=VSTOP}
N 1930 140 2150 140 {
lab=#net8}
C {pdk_dff.sym} -60 50 0 0 {name=X1 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} -230 180 0 0 {name=X2 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 240 50 0 0 {name=X3 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 70 180 0 0 {name=X4 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 540 50 0 0 {name=X5 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 370 180 0 0 {name=X6 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 840 50 0 0 {name=X7 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 670 180 0 0 {name=X8 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1150 50 0 0 {name=X9 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 980 180 0 0 {name=X10 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1450 50 0 0 {name=X11 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1280 180 0 0 {name=X12 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 1750 50 0 0 {name=X13 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1580 180 0 0 {name=X14 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 2050 50 0 0 {name=X15 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 1880 180 0 0 {name=X16 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 2300 50 0 0 {name=X17 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_dff.sym} 2600 50 0 0 {name=X18 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 2430 180 0 0 {name=X19 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 2900 50 0 0 {name=X20 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 2730 180 0 0 {name=X21 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3200 50 0 0 {name=X22 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3030 180 0 0 {name=X23 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3510 50 0 0 {name=X24 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3340 180 0 0 {name=X25 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 3810 50 0 0 {name=X26 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3640 180 0 0 {name=X27 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 4110 50 0 0 {name=X28 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 3940 180 0 0 {name=X29 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {pdk_dff.sym} 4410 50 0 0 {name=X30 model=gf180mcu_fd_sc_mcu7t5v0__dffq_4}
C {pdk_delay_cell.sym} 4240 180 0 0 {name=X31 model=gf180mcu_fd_sc_mcu7t5v0__dlyc_1}
C {ipin.sym} -400 -40 0 0 {name=p11 lab=VSTOP}
C {ipin.sym} -420 140 0 0 {name=p1 lab=VSTART}
C {opin.sym} 30 10 0 0 {name=p2 lab=D15}
C {opin.sym} 330 10 0 0 {name=p3 lab=D14}
C {opin.sym} 630 10 0 0 {name=p4 lab=D13}
C {opin.sym} 930 10 0 0 {name=p5 lab=D12}
C {opin.sym} 1240 10 0 0 {name=p6 lab=D11}
C {opin.sym} 1540 10 0 0 {name=p7 lab=D10}
C {opin.sym} 1840 10 0 0 {name=p8 lab=D9}
C {opin.sym} 2140 10 0 0 {name=p9 lab=D8}
C {opin.sym} 2390 10 0 0 {name=p10 lab=D7}
C {opin.sym} 2690 10 0 0 {name=p12 lab=D6}
C {opin.sym} 2990 10 0 0 {name=p13 lab=D5}
C {opin.sym} 3290 10 0 0 {name=p14 lab=D4}
C {opin.sym} 3600 10 0 0 {name=p15 lab=D3}
C {opin.sym} 3900 10 0 0 {name=p16 lab=D2}
C {opin.sym} 4200 10 0 0 {name=p17 lab=D1}
C {opin.sym} 4500 10 0 0 {name=p18 lab=D0}
