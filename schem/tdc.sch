v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {TDC / GF26c SYSTEM INTEGRATION BENCH} -800 -520 0 0 0.6 0.6 {}
T {3.3 V GF180MCU D | 50 MHz | 47.4 ns START-to-STOP example} -800 -465 0 0 0.3 0.3 {}
T {4-bit interval counter + one STOP medium endpoint; time conversion and calibration are external.} -800 -420 0 0 0.22 0.22 {}
T {Run make synth before netlisting. This bench includes the mapped transistor-level core.} -800 -385 0 0 0.22 0.22 {}
T {make validate runs stage SPICE, encoder/controller tests and protocol simulations. Full-system SPICE is optional and slow.} -800 -350 0 0 0.22 0.22 {}
C {tdc_core.sym} 500 0 0 0 {name=XDUT}
C {lab_pin.sym} 500 220 0 0 {name=LUA lab=ua[0:7]}
C {lab_pin.sym} 330 -140 0 0 {name=L0 lab=ui[0:7]}
C {lab_pin.sym} 330 -80 0 0 {name=L1 lab=uio_in[0:7]}
C {lab_pin.sym} 330 20 0 0 {name=L2 lab=ena}
C {lab_pin.sym} 330 80 0 0 {name=L3 lab=clk}
C {lab_pin.sym} 330 140 0 0 {name=L4 lab=rst_n}
C {lab_pin.sym} 670 -120 2 0 {name=L5 lab=uo[0:7]}
C {lab_pin.sym} 670 0 2 0 {name=L6 lab=uio_out[0:7]}
C {lab_pin.sym} 670 120 2 0 {name=L7 lab=uio_oe[0:7]}
C {vsource.sym} -800 -200 0 0 {name=VVDD value="3.3" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -800 -230 0 0 {name=LS0 lab=VDD}
C {gnd.sym} -800 -170 0 0 {name=G0 lab=GND}
C {vsource.sym} -400 -200 0 0 {name=VVSS value="0" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -400 -230 0 0 {name=LS1 lab=VSS}
C {gnd.sym} -400 -170 0 0 {name=G1 lab=GND}
C {vsource.sym} -800 -80 0 0 {name=VCLK value="PULSE(0 3.3 10n 100p 100p 10n 20n)" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -800 -110 0 0 {name=LS2 lab=clk}
C {gnd.sym} -800 -50 0 0 {name=G2 lab=GND}
C {vsource.sym} -400 -80 0 0 {name=VRST value="PWL(0 0 45n 0 45.1n 3.3)" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -400 -110 0 0 {name=LS3 lab=rst_n}
C {gnd.sym} -400 -50 0 0 {name=G3 lab=GND}
C {vsource.sym} -800 40 0 0 {name=VENA value="3.3" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -800 10 0 0 {name=LS4 lab=ena}
C {gnd.sym} -800 70 0 0 {name=G4 lab=GND}
C {vsource.sym} -400 40 0 0 {name=VSTART value="PULSE(0 3.3 600n 100p 100p 100n 10u)" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -400 10 0 0 {name=LS5 lab=ui[0]}
C {gnd.sym} -400 70 0 0 {name=G5 lab=GND}
C {vsource.sym} -800 160 0 0 {name=VSTOP value="PULSE(0 3.3 657.4n 100p 100p 100n 10u)" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -800 130 0 0 {name=LS6 lab=ui[1]}
C {gnd.sym} -800 190 0 0 {name=G6 lab=GND}
C {code_shown.sym} -800 390 0 0 {name=MODELS only_toplevel=true value=".include pdk_models.spice
.include system_models.spice
VUI2 ui[2] VSS 0
VUI3 ui[3] VSS 0
VUI4 ui[4] VSS 0
VUI5 ui[5] VSS 0
VUI6 ui[6] VSS 0
VUI7 ui[7] VSS 0
VCTRL ua[0] VSS 2.8
VUA1 ua[1] VSS 0
VUA2 ua[2] VSS 0
VUA3 ua[3] VSS 0
VUA4 ua[4] VSS 0
VUA5 ua[5] VSS 0
VUA6 ua[6] VSS 0
VUA7 ua[7] VSS 0
VUIO0 uio_in[0] VSS 0
VUIO1 uio_in[1] VSS 0
VUIO2 uio_in[2] VSS 0
VUIO3 uio_in[3] VSS 0
VUIO4 uio_in[4] VSS 0
VUIO5 uio_in[5] VSS 0
VUIO6 uio_in[6] VSS 0
VUIO7 uio_in[7] VSS 0
"}
C {code_shown.sym} 180 390 0 0 {name=SIM only_toplevel=true value=".temp 25
.options klu
.tran 50p 4.5u 0 50p
.save v(clk) v(rst_n) v(ui[0]) v(ui[1]) v(ui[2])
.save v(uo[0]) v(uo[1]) v(uo[2]) v(uo[3]) v(uo[4]) v(uo[5]) v(uo[6]) v(uo[7])
.save v(uio_out[0]) v(uio_out[1]) v(uio_out[2]) v(uio_out[3]) v(uio_out[4]) v(uio_out[5]) v(uio_out[6]) v(uio_out[7])
.save v(uio_oe[0]) v(uio_oe[1]) v(uio_oe[2]) v(uio_oe[3]) v(uio_oe[4]) v(uio_oe[5]) v(uio_oe[6]) v(uio_oe[7])
.control
run
write tdc.raw
meas tran done_final FIND v(uio_out[0]) AT=4u
meas tran busy_final FIND v(uio_out[1]) AT=4u
meas tran error_final FIND v(uio_out[2]) AT=4u
meas tran raw_bit0 FIND v(uo[0]) AT=4u
meas tran held_bit0 FIND v(uo[0]) AT=4.4u
meas tran raw_bit1 FIND v(uo[1]) AT=4u
meas tran held_bit1 FIND v(uo[1]) AT=4.4u
meas tran raw_bit2 FIND v(uo[2]) AT=4u
meas tran held_bit2 FIND v(uo[2]) AT=4.4u
meas tran raw_bit3 FIND v(uo[3]) AT=4u
meas tran held_bit3 FIND v(uo[3]) AT=4.4u
meas tran raw_bit4 FIND v(uo[4]) AT=4u
meas tran held_bit4 FIND v(uo[4]) AT=4.4u
meas tran raw_bit5 FIND v(uo[5]) AT=4u
meas tran held_bit5 FIND v(uo[5]) AT=4.4u
meas tran raw_bit6 FIND v(uo[6]) AT=4u
meas tran held_bit6 FIND v(uo[6]) AT=4.4u
meas tran raw_bit7 FIND v(uo[7]) AT=4u
meas tran held_bit7 FIND v(uo[7]) AT=4.4u
.endc"}
T {Raw CCCCMMMM: host computes C * 20 ns - M * calibrated medium delay + offset. MODE=1 returns 0000FFFF.} -800 270 0 0 0.21 0.21 {}
T {DONE / BUSY / ERROR = UIO_OUT[0] / [1] / [2]. UI[6]=MODE; UI[2:5] unused. START sampled on rising CLK.} -800 305 0 0 0.21 0.21 {}
