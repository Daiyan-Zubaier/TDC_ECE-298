v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {PDK-CELL SUPPLY-CONTROLLED DELAY / GF180} -160 -300 0 0 0.38 0.38 {}
T {Two dlya_1 cells use VCTRL. A buf_4 on VPWR restores the output to the core voltage.} -160 -255 0 0 0.22 0.22 {}
T {VCTRL is a supply input: it provides switching current. Keep its rail separate from VPWR.} -160 280 0 0 0.22 0.22 {}
N -160 0 -80 0 {lab=I}
N 80 0 160 0 {lab=#net1}
N 320 0 400 0 {lab=#net2}
N 560 0 640 0 {lab=Z}
N 0 -160 0 -80 {lab=VCTRL}
N 0 -160 240 -160 {lab=VCTRL}
N 240 -160 240 -80 {lab=VCTRL}
N 480 -160 480 -80 {lab=VPWR}
N 0 80 0 180 {lab=VGND}
N 240 80 240 180 {lab=VGND}
N 480 80 480 180 {lab=VGND}
N 0 180 480 180 {lab=VGND}
C {pdk_supply_cell.sym} 0 0 0 0 {name=X1 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_supply_cell.sym} 240 0 0 0 {name=X2 model=gf180mcu_fd_sc_mcu7t5v0__dlya_1}
C {pdk_supply_cell.sym} 480 0 0 0 {name=X3 model=gf180mcu_fd_sc_mcu7t5v0__buf_4}
C {ipin.sym} -160 0 0 0 {name=p0 lab=I}
C {opin.sym} 640 0 0 0 {name=p1 lab=Z}
C {iopin.sym} 120 -160 3 0 {name=p2 lab=VCTRL}
C {iopin.sym} 480 -160 0 0 {name=p3 lab=VPWR}
C {iopin.sym} 240 180 1 0 {name=p4 lab=VGND}
