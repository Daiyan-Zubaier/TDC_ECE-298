v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Medium delay line / hierarchical transistor bench} -400 -260 0 0 0.4 0.4 {}
C {medium_delay_line.sym} 200 0 0 0 {name=XDUT}
C {lab_pin.sym} 50 -150 0 0 {name=L0 lab=VSTOP}
C {lab_pin.sym} 350 -150 2 0 {name=L1 lab=D15}
C {lab_pin.sym} 350 110 2 0 {name=L2 lab=D2}
C {lab_pin.sym} 350 -110 2 0 {name=L3 lab=D13}
C {lab_pin.sym} 350 -90 2 0 {name=L4 lab=D12}
C {lab_pin.sym} 350 -70 2 0 {name=L5 lab=D11}
C {lab_pin.sym} 350 -50 2 0 {name=L6 lab=D10}
C {lab_pin.sym} 350 -30 2 0 {name=L7 lab=D9}
C {lab_pin.sym} 350 -10 2 0 {name=L8 lab=D8}
C {lab_pin.sym} 350 10 2 0 {name=L9 lab=D7}
C {lab_pin.sym} 350 30 2 0 {name=L10 lab=D6}
C {lab_pin.sym} 350 50 2 0 {name=L11 lab=D5}
C {lab_pin.sym} 350 70 2 0 {name=L12 lab=D4}
C {lab_pin.sym} 350 90 2 0 {name=L13 lab=D3}
C {lab_pin.sym} 350 -130 2 0 {name=L14 lab=D14}
C {lab_pin.sym} 350 130 2 0 {name=L15 lab=D1}
C {lab_pin.sym} 350 150 2 0 {name=L16 lab=D0}
C {lab_pin.sym} 50 -130 0 0 {name=L17 lab=VSTART}
C {vsource.sym} -500 250 0 0 {name=V0 value="3.3" savecurrent=false}
C {lab_pin.sym} -500 220 0 0 {name=P0 lab=VDD}
C {gnd.sym} -500 280 0 0 {name=G0 lab=GND}
C {vsource.sym} -350 250 0 0 {name=V1 value="0" savecurrent=false}
C {lab_pin.sym} -350 220 0 0 {name=P1 lab=VSS}
C {gnd.sym} -350 280 0 0 {name=G1 lab=GND}
C {vsource.sym} -200 320 0 0 {name=V2 value="PULSE(0 3.3 5n 20p 20p 80n 200n)" savecurrent=false}
C {lab_pin.sym} -200 290 0 0 {name=P2 lab=VSTART}
C {gnd.sym} -200 350 0 0 {name=G2 lab=GND}
C {vsource.sym} -200 220 0 0 {name=V3 value="PULSE(0 3.3 12n 20p 20p 80n 200n)" savecurrent=false}
C {lab_pin.sym} -200 190 0 0 {name=P3 lab=VSTOP}
C {gnd.sym} -200 250 0 0 {name=G3 lab=GND}
C {code_shown.sym} 450 -180 0 0 {name=SIM only_toplevel=true value=".global VDD VSS
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
Cload9 D9 0 5f
.meas tran bit9 FIND v(D9) AT=39n
Cload10 D10 0 5f
.meas tran bit10 FIND v(D10) AT=39n
Cload11 D11 0 5f
.meas tran bit11 FIND v(D11) AT=39n
Cload12 D12 0 5f
.meas tran bit12 FIND v(D12) AT=39n
Cload13 D13 0 5f
.meas tran bit13 FIND v(D13) AT=39n
Cload14 D14 0 5f
.meas tran bit14 FIND v(D14) AT=39n
Cload15 D15 0 5f
.meas tran bit15 FIND v(D15) AT=39n
"}
