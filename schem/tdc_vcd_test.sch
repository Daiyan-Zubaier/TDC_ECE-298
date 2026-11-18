v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {tdc_vcd.sym} 0 0 0 0 {name=Xdelay}
C {lab_pin.sym} -120 -40 0 0 {name=L0 lab=I}
C {lab_pin.sym} -120 40 0 0 {name=L1 lab=VCTRL}
C {lab_pin.sym} 120 0 2 0 {name=L2 lab=Z}
C {lab_pin.sym} 0 -100 0 0 {name=L3 lab=VPWR}
C {lab_pin.sym} 0 100 0 0 {name=L4 lab=VGND}
C {code_shown.sym} 340 -140 0 0 {name=SIM only_toplevel=true value=".include pdk_models.spice
.tran 5p 45n
.save all
"}
T {SUPPLY-CONTROLLED DELAY / STANDALONE TEST} -560 -300 0 0 0.38 0.38 {}
T {VPWR = 3.3 V, VCTRL = 2.8 V, CLOAD = 5 fF. Compare input I with restored output Z.} -560 -250 0 0 0.2 0.2 {}
C {vsource.sym} -500 -120 0 0 {name=VDD value="3.3" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -500 -150 0 0 {name=LS0 lab=VPWR}
C {gnd.sym} -500 -90 0 0 {name=GS0 lab=GND}
C {vsource.sym} -300 -120 0 0 {name=VSS value="0" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -300 -150 0 0 {name=LS1 lab=VGND}
C {gnd.sym} -300 -90 0 0 {name=GS1 lab=GND}
C {vsource.sym} -500 220 0 0 {name=VIN value="PULSE(0 3.3 5n 20p 20p 30n 60n)" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -500 190 0 0 {name=LS2 lab=I}
C {gnd.sym} -500 250 0 0 {name=GS2 lab=GND}
C {vsource.sym} -300 120 0 0 {name=VCTRL value="2.8" format="@name @pinlist @value" savecurrent=false}
C {lab_pin.sym} -300 90 0 0 {name=LS3 lab=VCTRL}
C {gnd.sym} -300 150 0 0 {name=GS3 lab=GND}
N 120 0 220 0 {lab=Z}
C {capa.sym} 220 30 0 0 {name=CLOAD value=5f m=1}
C {gnd.sym} 220 60 0 0 {name=GLOAD lab=GND}
