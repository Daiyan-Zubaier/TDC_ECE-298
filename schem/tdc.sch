v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -1020 -1575 3540 -1575 {}
B 2 1460 -1280 3410 -930 {flags=graph
y1=0
y2=3.6
ypos1=0
ypos2=3.6
divy=4
subdivy=1
unity=1
x1=0
x2=4e-08
divx=4
subdivx=5
xlabmag=1
ylabmag=1
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 6 9 10"
node="clk
mstart
mstop
fstart
fstop"}
B 2 1460 -810 3410 -465 {flags=graph
y1=0
y2=3.6
ypos1=0
ypos2=3.6
divy=4
subdivy=1
unity=1
x1=0
x2=4e-08
divx=4
subdivx=5
xlabmag=1
ylabmag=1
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 6 9 10"
node="md[15]
md[12]
md[8]
md[4]
md[0]"}
B 2 1460 -345 3410 -20 {flags=graph
y1=0
y2=3.6
ypos1=0
ypos2=3.6
divy=4
subdivy=1
unity=1
x1=0
x2=4e-08
divx=4
subdivx=5
xlabmag=1
ylabmag=1
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 6 9 10"
node="fd[8]
fd[6]
fd[4]
fd[2]
fd[0]"}
B 2 1460 110 3410 520 {flags=graph
y1=0
y2=3.6
ypos1=0
ypos2=3.6
divy=4
subdivy=1
unity=1
x1=0
x2=4e-08
divx=4
subdivx=5
xlabmag=1
ylabmag=1
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 6 9 10"
node="mcode[0:3];mcode[0],mcode[1],mcode[2],mcode[3]
fcode[0:3];fcode[0],fcode[1],fcode[2],fcode[3]
m_overflow
m_bubble
f_bubble"
digital=1
rainbow=1
bus=1}
B 4 -1080 -1750 3600 2440 {fill=false}
B 4 -1020 -1450 1300 -1015 {fill=false}
B 4 -1020 -940 1300 -570 {fill=false}
B 4 -1020 -505 1300 265 {fill=false}
B 4 -1020 330 1300 1050 {fill=false}
B 4 1390 -1450 3525 1050 {fill=false}
B 4 -1020 1120 3525 2305 {fill=false}
B 4 -950 1250 1270 2000 {fill=false}
B 4 1320 1250 3450 2000 {fill=false}
T {TDC / Mixed-Signal Integration Testbench} -1015 -1695 0 0 0.86 0.86 {}
T {GF180MCU D | Xschem + ngspice | Coarse counter + tapped delay line + Vernier} -1010 -1620 0 0 0.31 0.31 {}
T {TESTBENCH ONLY: three independent stage checks. No residue generator, endpoint capture, or final 16-bit computation yet.} -1005 -1540 0 0 0.23 0.23 {}
T {01 / POWER AND PULSE STIMULI} -992 -1428 0 0 0.38 0.38 {}
T {Sources are ground-referenced; global VDD/VSS also power GF180 digital cells} -992 -1385 0 0 0.2 0.2 {}
T {VDD} -892 -1370 0 0 0.21 0.21 {}
T {VSS} -367 -1370 0 0 0.21 0.21 {}
T {clk} 158 -1370 0 0 0.21 0.21 {}
T {rst_n} 683 -1370 0 0 0.21 0.21 {}
T {mstart} -892 -1200 0 0 0.21 0.21 {}
T {mstop} -367 -1200 0 0 0.21 0.21 {}
T {fstart} 158 -1200 0 0 0.21 0.21 {}
T {fstop} 683 -1200 0 0 0.21 0.21 {}
T {02 / COARSE: SYNTHESIZED 8-BIT COUNTER} -992 -918 0 0 0.38 0.38 {}
T {Continuously counts CLK edges. Output is not event-latched; this is a stage functionality test.} -992 -875 0 0 0.2 0.2 {}
T {count[0:7]  /  raw counter bus} 30 -790 0 0 0.24 0.24 {}
T {Note: rst_n is synchronous in the committed counter.v.} 30 -738 0 0 0.23 0.23 {}
T {At 50 MHz, the nominal 8-bit wrap interval is 5.12 us.} 30 -690 0 0 0.23 0.23 {}
T {03 / MEDIUM: 16-TAP DELAY-LINE SNAPSHOT} -992 -483 0 0 0.38 0.38 {}
T {Propagation order: D15 is the earliest physical tap and maps to encoder therm_0.} -992 -440 0 0 0.2 0.2 {}
T {D15..D0  ->  therm_0..therm_15} -205 -380 0 0 0.2 0.2 {}
T {16 physical taps feed the bus-labeled encoder.} -205 -345 0 0 0.2 0.2 {}
T {The 4-bit code wraps at 16; check m_overflow.} -205 -310 0 0 0.2 0.2 {}
T {Independent edges: mstart @ 5 ns; mstop @ 12 ns.} -205 140 0 0 0.22 0.22 {}
T {04 / FINE: 9-TAP VERNIER / EXPERIMENTAL ENCODER} -992 352 0 0 0.38 0.38 {}
T {Standalone test: fstart/fstop are direct 400-ps-separated stimuli, not generated medium residue.} -992 395 0 0 0.2 0.2 {}
T {D8 is the earliest comparison tap: therm_0.} -200 400 0 0 0.2 0.2 {}
T {The remaining seven therm inputs are tied low.} -200 430 0 0 0.2 0.2 {}
T {Important: f_overflow stays 0 in the current RTL.} -200 800 0 0 0.22 0.22 {}
T {No catch-up detection needs dedicated fine-stage RTL.} -200 835 0 0 0.22 0.22 {}
T {05 / IN-SCHEMATIC WAVEFORMS} 1418 -1428 0 0 0.38 0.38 {}
T {After running, load TDC.raw (Waves -> Tran) to populate these saved graphs.} 1418 -1385 0 0 0.2 0.2 {}
T {Input edges  |  mstop - mstart = 7 ns   /   fstop - fstart = 0.4 ns (ideal)} 1455 -1350 0 0 0.25 0.25 {}
T {Medium progression  |  representative tap voltages} 1455 -870 0 0 0.25 0.25 {}
T {Vernier progression  |  representative captured tap bits} 1455 -405 0 0 0.25 0.25 {}
T {Encoded outputs + flags  |  digital view (edit signal list to add other buses)} 1455 40 0 0 0.25 0.25 {}
T {Xschem: select graph -> Alt-G on schematic signal; A/B keys: time cursors.} 1465 620 0 0 0.24 0.24 {}
T {Waveforms update when the latest raw data file is reloaded.} 1465 662 0 0 0.23 0.23 {}
T {Spice .meas numbers are written to TDC_measurements.txt and simulation console.} 1465 720 0 0 0.23 0.23 {}
T {06 / SIMULATION SETUP, MODEL INCLUDES AND READOUT} -992 1142 0 0 0.38 0.38 {}
T {Requires schem/xschemrc: set local_netlist_dir 1  (simulations saved to schem/simulation/)} -992 1185 0 0 0.2 0.2 {}
T {MODELS: PDK + synthesized GF180 subcircuits} -920 1275 0 0 0.3 0.3 {}
T {SIM: transient, measurements, waveforms, and tabular export} 1350 1275 0 0 0.29 0.29 {}
T {OUTPUT: TDC.raw  /  TDC_trace.txt  /  TDC_measurements.txt} -915 2075 0 0 0.3 0.3 {}
T {Not yet implemented: endpoint latches, medium-to-fine residue transfer, Gray/safe capture, 16-bit timing arithmetic.} -915 2132 0 0 0.22 0.22 {}
T {Treat all plots as individual stage responses; nominal timing fields are NOT a calibrated interval measurement.} -915 2168 0 0 0.22 0.22 {}
N -850 -1339 -850 -1305 {lab=#net1}
N -325 -1339 -325 -1305 {lab=#net2}
N 200 -1339 200 -1305 {lab=#net3}
N 725 -1339 725 -1305 {lab=#net4}
N -850 -1169 -850 -1135 {lab=#net5}
N -325 -1169 -325 -1135 {lab=#net6}
N 200 -1169 200 -1135 {lab=#net7}
N 725 -1169 725 -1135 {lab=#net8}
N -483 -615 -345 -615 {lab=#net9 bus=true}
N -745 -260 -675 -260 {lab=#net10}
N -745 -240 -675 -240 {lab=#net11}
N -375 -260 -235 -260 {lab=#net12}
N -375 -240 -235 -240 {lab=#net13}
N -375 -220 -235 -220 {lab=#net14}
N -375 -200 -235 -200 {lab=#net15}
N -375 -180 -235 -180 {lab=#net16}
N -375 -160 -235 -160 {lab=#net17}
N -375 -140 -235 -140 {lab=#net18}
N -375 -120 -235 -120 {lab=#net19}
N -375 -100 -235 -100 {lab=#net20}
N -375 -80 -235 -80 {lab=#net21}
N -375 -60 -235 -60 {lab=#net22}
N -375 -40 -235 -40 {lab=#net23}
N -375 -20 -235 -20 {lab=#net24}
N -375 0 -235 0 {lab=#net25}
N -375 20 -235 20 {lab=#net26}
N -375 40 -235 40 {lab=#net27}
N 540 -75 697 -75 {lab=#net28 bus=true}
N 923 -75 1080 -75 {lab=#net29 bus=true}
N 923 -50 1080 -50 {lab=#net30}
N 923 -25 1080 -25 {lab=#net31}
N -745 555 -675 555 {lab=#net32}
N -745 575 -675 575 {lab=#net33}
N -375 555 -235 555 {lab=#net34}
N -375 575 -235 575 {lab=#net35}
N -375 595 -235 595 {lab=#net36}
N -375 615 -235 615 {lab=#net37}
N -375 635 -235 635 {lab=#net38}
N -375 655 -235 655 {lab=#net39}
N -375 675 -235 675 {lab=#net40}
N -375 695 -235 695 {lab=#net41}
N -375 715 -235 715 {lab=#net42}
N 540 605 697 605 {lab=#net43 bus=true}
N 923 605 1080 605 {lab=#net44 bus=true}
N 923 630 1080 630 {lab=#net45}
N 923 655 1080 655 {lab=#net46}
N -720 -730 -650 -730 {}
N -720 -700 -650 -700 {}
C {vsource.sym} -850 -1275 0 0 {name=VDD_SRC value="3.3" savecurrent=false}
C {gnd.sym} -850 -1245 0 0 {name=gVDD_SRC lab=GND}
C {vsource.sym} -325 -1275 0 0 {name=VSS_SRC value="0" savecurrent=false}
C {gnd.sym} -325 -1245 0 0 {name=gVSS_SRC lab=GND}
C {vsource.sym} 200 -1275 0 0 {name=VCLK value="PULSE(0 3.3 10n 20p 20p 10n 20n)" savecurrent=false}
C {gnd.sym} 200 -1245 0 0 {name=gVCLK lab=GND}
C {vsource.sym} 725 -1275 0 0 {name=VRST value="PWL(0 0 12n 0 12.02n 3.3)" savecurrent=false}
C {gnd.sym} 725 -1245 0 0 {name=gVRST lab=GND}
C {vsource.sym} -850 -1105 0 0 {name=VMSTART value="PULSE(0 3.3 5n 20p 20p 30n 100n)" savecurrent=false}
C {gnd.sym} -850 -1075 0 0 {name=gVMSTART lab=GND}
C {vsource.sym} -325 -1105 0 0 {name=VMSTOP value="PULSE(0 3.3 12n 20p 20p 30n 100n)" savecurrent=false}
C {gnd.sym} -325 -1075 0 0 {name=gVMSTOP lab=GND}
C {vsource.sym} 200 -1105 0 0 {name=VFSTART value="PULSE(0 3.3 5n 20p 20p 30n 100n)" savecurrent=false}
C {gnd.sym} 200 -1075 0 0 {name=gVFSTART lab=GND}
C {vsource.sym} 725 -1105 0 0 {name=VFSTOP value="PULSE(0 3.3 5.4n 20p 20p 30n 100n)" savecurrent=false}
C {gnd.sym} 725 -1075 0 0 {name=gVFSTOP lab=GND}
C {counter.sym} -510 -750 0 0 {name=XCOARSE}
C {medium_delay_line.sym} -525 -110 0 0 {name=XMEDIUM}
C {medium_encoder.sym} 825 -95 0 0 {name=XMEDENC}
C {fine_delay_line.sym} -525 635 0 0 {name=XFINE}
C {fine_encoder.sym} 825 625 0 0 {name=XFINEENC}
C {code_shown.sym} -895 1390 0 0 {name=MODELS only_toplevel=true value="* Hierarchical supplies shared with standard cells
.global VDD VSS
* PDK path matches existing delay-line testbenches
.include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.include /usr/local/share/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
* These paths are relative to schem/simulation/
.include ../../synth/counter.spice
.include ../../synth/therm_encoder.spice"}
C {code_shown.sym} 1370 1390 0 0 {name=SIM only_toplevel=true value="* First-pass functional transient; reduce maxstep for fine characterization.
.temp 25
.tran 5p 40n 0 5p
.save v(clk) v(rst_n) v(mstart) v(mstop) v(fstart) v(fstop) v(VDD) v(VSS) v(count[0])
.save v(count[1]) v(count[2]) v(count[3]) v(count[4]) v(count[5]) v(count[6]) v(count[7]) v(md[0]) v(md[1])
.save v(md[2]) v(md[3]) v(md[4]) v(md[5]) v(md[6]) v(md[7]) v(md[8]) v(md[9]) v(md[10])
.save v(md[11]) v(md[12]) v(md[13]) v(md[14]) v(md[15]) v(fd[0]) v(fd[1]) v(fd[2]) v(fd[3])
.save v(fd[4]) v(fd[5]) v(fd[6]) v(fd[7]) v(fd[8]) v(mcode[0]) v(mcode[1]) v(mcode[2]) v(mcode[3])
.save v(fcode[0]) v(fcode[1]) v(fcode[2]) v(fcode[3]) v(m_overflow) v(m_bubble) v(f_overflow) v(f_bubble)
.control
run
* ngspice raw file is read by embedded Xschem graphs
write TDC.raw
meas tran medium_interval TRIG v(mstart) VAL=1.65 RISE=1 TARG v(mstop) VAL=1.65 RISE=1
meas tran fine_interval TRIG v(fstart) VAL=1.65 RISE=1 TARG v(fstop) VAL=1.65 RISE=1
meas tran clk_period TRIG v(clk) VAL=1.65 RISE=1 TARG v(clk) VAL=1.65 RISE=2
meas tran medium_code0_at_20n FIND v(mcode[0]) AT=20n
meas tran fine_code0_at_20n FIND v(fcode[0]) AT=20n
echo STAGE INTEGRATION TEST / not a calibrated TDC result > TDC_measurements.txt
print medium_interval fine_interval clk_period >> TDC_measurements.txt
print medium_code0_at_20n fine_code0_at_20n >> TDC_measurements.txt
set wr_singlescale
set wr_vecnames
wrdata TDC_trace.txt v(mstart) v(mstop) v(fstart) v(fstop) v(mcode[0]) v(fcode[0])
.endc"}
