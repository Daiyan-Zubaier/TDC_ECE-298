v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Fine delay line / hierarchical transistor bench} -400 -260 0 0 0.4 0.4 {}
C {fine_delay_line.sym} 200 0 0 0 {name=XDUT}
C {lab_pin.sym} 50 -80 0 0 {name=L0 lab=VSTART}
C {lab_pin.sym} 350 -80 2 0 {name=L1 lab=D0}
C {lab_pin.sym} 350 20 2 0 {name=L2 lab=D5}
C {lab_pin.sym} 350 -40 2 0 {name=L3 lab=D2}
C {lab_pin.sym} 350 -20 2 0 {name=L4 lab=D3}
C {lab_pin.sym} 350 0 2 0 {name=L5 lab=D4}
C {lab_pin.sym} 350 -60 2 0 {name=L6 lab=D1}
C {lab_pin.sym} 350 40 2 0 {name=L7 lab=D6}
C {lab_pin.sym} 350 60 2 0 {name=L8 lab=D7}
C {lab_pin.sym} 350 80 2 0 {name=L9 lab=D8}
C {lab_pin.sym} 50 -60 0 0 {name=L10 lab=VSTOP}
C {vsource.sym} -500 250 0 0 {name=V0 value="3.3" savecurrent=false}
C {lab_pin.sym} -500 220 0 0 {name=P0 lab=VDD}
C {gnd.sym} -500 280 0 0 {name=G0 lab=GND}
C {vsource.sym} -350 250 0 0 {name=V1 value="0" savecurrent=false}
C {lab_pin.sym} -350 220 0 0 {name=P1 lab=VSS}
C {gnd.sym} -350 280 0 0 {name=G1 lab=GND}
C {vsource.sym} -190 320 0 0 {name=V2 value="PULSE(0 3.3 5n 20p 20p 80n 200n)" savecurrent=false}
C {lab_pin.sym} -190 290 0 0 {name=P2 lab=VSTART}
C {gnd.sym} -190 350 0 0 {name=G2 lab=GND}
C {vsource.sym} -190 210 0 0 {name=V3 value="PULSE(0 3.3 5.4n 20p 20p 80n 200n)" savecurrent=false}
C {lab_pin.sym} -190 180 0 0 {name=P3 lab=VSTOP}
C {gnd.sym} -190 240 0 0 {name=G3 lab=GND}
C {code_shown.sym} 490 10 0 0 {name=SIM only_toplevel=true value=".global VDD VSS
.include pdk_models.spice
.temp 25
.tran 10p 40n 0 10p
Cload0 D0 0 5f
.meas tran bit0 FIND v(D0) AT=39n
Cload1 D1 0 5f
.meas tran bit1 FIND v(D1) AT=39n
Cload2 D2 0 5f
.meas tran bit2 FIND v(D2) AT=39n
Cload3 D3 0 5f
.meas tran bit3 FIND v(D3) AT=39n
Cload4 D4 0 5f
.meas tran bit4 FIND v(D4) AT=39n
Cload5 D5 0 5f
.meas tran bit5 FIND v(D5) AT=39n
Cload6 D6 0 5f
.meas tran bit6 FIND v(D6) AT=39n
Cload7 D7 0 5f
.meas tran bit7 FIND v(D7) AT=39n
Cload8 D8 0 5f
.meas tran bit8 FIND v(D8) AT=39n
"}
C {lab_pin.sym} 200 -120 0 0 {name=LFINEPOWER lab=VDD}
