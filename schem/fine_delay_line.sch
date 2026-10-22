v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -400 -90 -400 -40 {
lab=#net1}
N -400 -40 -370 -40 {
lab=#net1}
N -400 0 -400 90 {
lab=#net2}
N -400 0 -370 0 {
lab=#net2}
N 0 -90 0 -40 {
lab=#net3}
N 0 -40 30 -40 {
lab=#net3}
N 0 0 0 90 {
lab=#net4}
N 0 0 30 0 {
lab=#net4}
N -400 -90 -170 -90 {
lab=#net1}
N -400 90 -170 90 {
lab=#net2}
N 400 -90 400 -40 {
lab=#net5}
N 400 -40 430 -40 {
lab=#net5}
N 400 0 400 90 {
lab=#net6}
N 400 0 430 0 {
lab=#net6}
N 0 -90 230 -90 {
lab=#net3}
N 0 90 230 90 {
lab=#net4}
N 790 -90 790 -40 {
lab=#net7}
N 790 -40 820 -40 {
lab=#net7}
N 790 0 790 90 {
lab=#net8}
N 790 0 820 0 {
lab=#net8}
N 1190 -90 1190 -40 {
lab=#net9}
N 1190 -40 1220 -40 {
lab=#net9}
N 1190 0 1190 90 {
lab=#net10}
N 1190 0 1220 0 {
lab=#net10}
N 790 -90 1020 -90 {
lab=#net7}
N 790 90 1020 90 {
lab=#net8}
N 1590 -90 1590 -40 {
lab=#net11}
N 1590 -40 1620 -40 {
lab=#net11}
N 1590 0 1590 90 {
lab=#net12}
N 1590 0 1620 0 {
lab=#net12}
N 1990 -90 1990 -40 {
lab=#net13}
N 1990 -40 2020 -40 {
lab=#net13}
N 1990 0 1990 90 {
lab=#net14}
N 1990 0 2020 0 {
lab=#net14}
N 1590 -90 1820 -90 {
lab=#net11}
N 1590 90 1820 90 {
lab=#net12}
N 2380 -90 2380 -40 {
lab=#net15}
N 2380 -40 2410 -40 {
lab=#net15}
N 2380 0 2380 90 {
lab=#net16}
N 2380 0 2410 0 {
lab=#net16}
N 2780 -90 2780 -40 {
lab=#net17}
N 2780 -40 2810 -40 {
lab=#net17}
N 2780 0 2780 90 {
lab=#net18}
N 2780 0 2810 0 {
lab=#net18}
N 2380 -90 2610 -90 {
lab=#net15}
N 2380 90 2610 90 {
lab=#net16}
N 400 90 620 90 {
lab=#net6}
N 400 -90 620 -90 {
lab=#net5}
N 1190 -90 1420 -90 {
lab=#net9}
N 1190 90 1420 90 {
lab=#net10}
N 1990 -90 2210 -90 {
lab=#net13}
N 1990 90 2210 90 {
lab=#net14}
C {slow_delay_cell.sym} -500 -80 0 0 {name=X1 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} -490 90 0 0 {name=X2 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} -280 0 0 0 {name=X3 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} -100 -80 0 0 {name=X4 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} -90 90 0 0 {name=X5 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 120 0 0 0 {name=X6 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 300 -80 0 0 {name=X7 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 310 90 0 0 {name=X8 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 520 0 0 0 {name=X9 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 690 -80 0 0 {name=X10 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 700 90 0 0 {name=X11 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 910 0 0 0 {name=X12 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1090 -80 0 0 {name=X13 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1100 90 0 0 {name=X14 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 1310 0 0 0 {name=X15 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1490 -80 0 0 {name=X16 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1500 90 0 0 {name=X17 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 1710 0 0 0 {name=X18 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 1890 -80 0 0 {name=X19 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 1900 90 0 0 {name=X20 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2110 0 0 0 {name=X21 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 2280 -80 0 0 {name=X22 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 2290 90 0 0 {name=X23 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2500 0 0 0 {name=X24 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {slow_delay_cell.sym} 2680 -80 0 0 {name=X25 model=gf180mcu_fd_sc_mcu7t5v0__dlya_4}
C {fast_delay_cell.sym} 2690 90 0 0 {name=X26 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_dff.sym} 2900 0 0 0 {name=X27 model=gf180mcu_fd_sc_mcu7t5v0__dffq_1}
C {ipin.sym} -570 -90 0 0 {name=p1 lab=VSTART}
C {ipin.sym} -570 90 0 0 {name=p2 lab=VSTOP}
C {opin.sym} 2990 -40 0 0 {name=p3 lab=D0}
C {opin.sym} 2590 -40 0 0 {name=p4 lab=D1}
C {opin.sym} 2200 -40 0 0 {name=p5 lab=D2}
C {opin.sym} 1800 -40 0 0 {name=p6 lab=D3}
C {opin.sym} 1400 -40 0 0 {name=p7 lab=D4}
C {opin.sym} 1000 -40 0 0 {name=p8 lab=D5}
C {opin.sym} 610 -40 0 0 {name=p9 lab=D6}
C {opin.sym} 210 -40 0 0 {name=p10 lab=D7}
C {opin.sym} -190 -40 0 0 {name=p11 lab=D8}
