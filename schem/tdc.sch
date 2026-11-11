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
x1=4e-09
x2=1.2e-08
divx=4
subdivx=5
xlabmag=1
ylabmag=1
dataset=-1
unitx=1
logx=0
logy=0
color="4 7 6 9 10 11 12 13 14 15 16"
node="fstart
fstop
fd[8]
fd[7]
fd[6]
fd[5]
fd[4]
fd[3]
fd[2]
fd[1]
fd[0]"
digital=1
rainbow=1}
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
node="mcode[3:0];mcode[3],mcode[2],mcode[1],mcode[0]
fcode[3:0];fcode[3],fcode[2],fcode[1],fcode[0]
m_overflow
m_bubble
f_overflow
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
T {Vernier captures  |  START/STOP + all nine taps, zoomed 4-12 ns} 1455 -405 0 0 0.25 0.25 {}
T {Encoded outputs + flags  |  digital view (edit signal list to add other buses)} 1455 40 0 0 0.25 0.25 {}
T {Flat output bits after capture are expected: these taps are latched DFF values.} 1465 563 0 0 0.2 0.2 {}
T {Check the before/after fine tap measurements in TDC_measurements.txt.} 1465 593 0 0 0.2 0.2 {}
T {WARNING: Existing fine encoder bubble detection may use the opposite thermometer polarity.} 1465 760 0 0 0.2 0.2 {}
T {Next: sweep VFSTOP rise from 5.2 to 5.8 ns and compare all nine final tap bits.} 1465 803 0 0 0.2 0.2 {}
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
N -850 -1339 -850 -1305 {
lab=VDD}
N -325 -1339 -325 -1305 {
lab=VSS}
N 200 -1339 200 -1305 {
lab=clk}
N 725 -1339 725 -1305 {
lab=rst_n}
N -850 -1169 -850 -1135 {
lab=mstart}
N -325 -1169 -325 -1135 {
lab=mstop}
N 200 -1169 200 -1135 {
lab=fstart}
N 725 -1169 725 -1135 {
lab=fstop}
N -720 -700 -637 -700 {
lab=clk}
N -720 -730 -637 -730 {
lab=rst_n}
N -483 -615 -345 -615 {bus=true
lab=count[0:7]}
N -745 -260 -675 -260 {
lab=mstop}
N -745 -240 -675 -240 {
lab=mstart}
N -375 -260 -235 -260 {
lab=md[15]}
N -375 -240 -235 -240 {
lab=md[14]}
N -375 -220 -235 -220 {
lab=md[13]}
N -375 -200 -235 -200 {
lab=md[12]}
N -375 -180 -235 -180 {
lab=md[11]}
N -375 -160 -235 -160 {
lab=md[10]}
N -375 -140 -235 -140 {
lab=md[9]}
N -375 -120 -235 -120 {
lab=md[8]}
N -375 -100 -235 -100 {
lab=md[7]}
N -375 -80 -235 -80 {
lab=md[6]}
N -375 -60 -235 -60 {
lab=md[5]}
N -375 -40 -235 -40 {
lab=md[4]}
N -375 -20 -235 -20 {
lab=md[3]}
N -375 0 -235 0 {
lab=md[2]}
N -375 20 -235 20 {
lab=md[1]}
N -375 40 -235 40 {
lab=md[0]}
N 540 -75 697 -75 {bus=true
lab=md[15:0]}
N 923 -75 1080 -75 {bus=true
lab=mcode[0:3]}
N 923 -50 1080 -50 {
lab=m_overflow}
N 923 -25 1080 -25 {
lab=m_bubble}
N -745 555 -675 555 {
lab=fstart}
N -745 575 -675 575 {
lab=fstop}
N -375 555 -235 555 {
lab=fd[0]}
N -375 575 -235 575 {
lab=fd[1]}
N -375 595 -235 595 {
lab=fd[2]}
N -375 615 -235 615 {
lab=fd[3]}
N -375 635 -235 635 {
lab=fd[4]}
N -375 655 -235 655 {
lab=fd[5]}
N -375 675 -235 675 {
lab=fd[6]}
N -375 695 -235 695 {
lab=fd[7]}
N -375 715 -235 715 {
lab=fd[8]}
N 540 605 697 605 {bus=true
lab=fd[8:0]}
N 923 605 1080 605 {bus=true
lab=fcode[0:3]}
N 923 630 1080 630 {
lab=f_overflow}
N 923 655 1080 655 {
lab=f_bubble}
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
.include /home/dmzubaie/Documents/TDC_ECE-298/synth/counter.spice
.include /home/dmzubaie/Documents/TDC_ECE-298/synth/therm_encoder.spice"}
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
write tdc.raw
meas tran medium_interval TRIG v(mstart) VAL=1.65 RISE=1 TARG v(mstop) VAL=1.65 RISE=1
meas tran fine_interval TRIG v(fstart) VAL=1.65 RISE=1 TARG v(fstop) VAL=1.65 RISE=1
meas tran clk_period TRIG v(clk) VAL=1.65 RISE=1 TARG v(clk) VAL=1.65 RISE=2
meas tran medium_code0_at_20n FIND v(mcode[0]) AT=20n
meas tran fine_code0_at_20n FIND v(fcode[0]) AT=20n
* Diagnostic snapshots before launch and after latch settling
meas tran fd8_pre_4n FIND v(fd[8]) AT=4n
meas tran fd7_pre_4n FIND v(fd[7]) AT=4n
meas tran fd6_pre_4n FIND v(fd[6]) AT=4n
meas tran fd5_pre_4n FIND v(fd[5]) AT=4n
meas tran fd4_pre_4n FIND v(fd[4]) AT=4n
meas tran fd3_pre_4n FIND v(fd[3]) AT=4n
meas tran fd2_pre_4n FIND v(fd[2]) AT=4n
meas tran fd1_pre_4n FIND v(fd[1]) AT=4n
meas tran fd0_pre_4n FIND v(fd[0]) AT=4n
meas tran fd8_post_20n FIND v(fd[8]) AT=20n
meas tran fd7_post_20n FIND v(fd[7]) AT=20n
meas tran fd6_post_20n FIND v(fd[6]) AT=20n
meas tran fd5_post_20n FIND v(fd[5]) AT=20n
meas tran fd4_post_20n FIND v(fd[4]) AT=20n
meas tran fd3_post_20n FIND v(fd[3]) AT=20n
meas tran fd2_post_20n FIND v(fd[2]) AT=20n
meas tran fd1_post_20n FIND v(fd[1]) AT=20n
meas tran fd0_post_20n FIND v(fd[0]) AT=20n
meas tran fine_code1_at_20n FIND v(fcode[1]) AT=20n
meas tran fine_code2_at_20n FIND v(fcode[2]) AT=20n
meas tran fine_code3_at_20n FIND v(fcode[3]) AT=20n
meas tran medium_code0_at_20n FIND v(mcode[0]) AT=20n
meas tran medium_code1_at_20n FIND v(mcode[1]) AT=20n
meas tran medium_code2_at_20n FIND v(mcode[2]) AT=20n
meas tran medium_code3_at_20n FIND v(mcode[3]) AT=20n
meas tran f_bubble_at_20n FIND v(f_bubble) AT=20n
meas tran f_overflow_at_20n FIND v(f_overflow) AT=20n
meas tran m_bubble_at_20n FIND v(m_bubble) AT=20n
meas tran m_overflow_at_20n FIND v(m_overflow) AT=20n
echo STAGE INTEGRATION TEST / not a calibrated TDC result > TDC_measurements.txt
print medium_interval fine_interval clk_period >> TDC_measurements.txt
print medium_code0_at_20n fine_code0_at_20n >> TDC_measurements.txt
echo --- Fine taps BEFORE launch at 4 ns (V) --- >> TDC_measurements.txt
print fd8_pre_4n fd7_pre_4n fd6_pre_4n fd5_pre_4n fd4_pre_4n fd3_pre_4n fd2_pre_4n fd1_pre_4n fd0_pre_4n >> TDC_measurements.txt
echo --- Fine taps AFTER settling at 20 ns (V) --- >> TDC_measurements.txt
print fd8_post_20n fd7_post_20n fd6_post_20n fd5_post_20n fd4_post_20n fd3_post_20n fd2_post_20n fd1_post_20n fd0_post_20n >> TDC_measurements.txt
echo --- Encoder output bits at 20 ns, HIGH if above 1.65 V --- >> TDC_measurements.txt
print fine_code0_at_20n fine_code1_at_20n fine_code2_at_20n fine_code3_at_20n >> TDC_measurements.txt
print medium_code0_at_20n medium_code1_at_20n medium_code2_at_20n medium_code3_at_20n >> TDC_measurements.txt
echo --- Status flags at 20 ns --- >> TDC_measurements.txt
print f_bubble_at_20n f_overflow_at_20n m_bubble_at_20n m_overflow_at_20n >> TDC_measurements.txt
set wr_singlescale
set wr_vecnames
wrdata TDC_trace.txt v(mstart) v(mstop) v(fstart) v(fstop)
.endc"}
C {lab_pin.sym} -850 -1339 0 0 {name=NL001 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -325 -1339 0 0 {name=NL002 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 200 -1339 0 0 {name=NL003 sig_type=std_logic lab=clk}
C {lab_pin.sym} 725 -1339 0 0 {name=NL004 sig_type=std_logic lab=rst_n}
C {lab_pin.sym} -850 -1169 0 0 {name=NL005 sig_type=std_logic lab=mstart}
C {lab_pin.sym} -325 -1169 0 0 {name=NL006 sig_type=std_logic lab=mstop}
C {lab_pin.sym} 200 -1169 0 0 {name=NL007 sig_type=std_logic lab=fstart}
C {lab_pin.sym} 725 -1169 0 0 {name=NL008 sig_type=std_logic lab=fstop}
C {lab_pin.sym} -720 -700 0 0 {name=NL009 sig_type=std_logic lab=clk}
C {lab_pin.sym} -720 -730 0 0 {name=NL010 sig_type=std_logic lab=rst_n}
C {lab_pin.sym} -483 -615 0 0 {name=NL011 sig_type=std_logic lab=count[0:7]}
C {lab_pin.sym} -745 -260 0 0 {name=NL012 sig_type=std_logic lab=mstop}
C {lab_pin.sym} -745 -240 0 0 {name=NL013 sig_type=std_logic lab=mstart}
C {lab_pin.sym} -375 -260 0 0 {name=NL014 sig_type=std_logic lab=md[15]}
C {lab_pin.sym} -375 -240 0 0 {name=NL015 sig_type=std_logic lab=md[14]}
C {lab_pin.sym} -375 -220 0 0 {name=NL016 sig_type=std_logic lab=md[13]}
C {lab_pin.sym} -375 -200 0 0 {name=NL017 sig_type=std_logic lab=md[12]}
C {lab_pin.sym} -375 -180 0 0 {name=NL018 sig_type=std_logic lab=md[11]}
C {lab_pin.sym} -375 -160 0 0 {name=NL019 sig_type=std_logic lab=md[10]}
C {lab_pin.sym} -375 -140 0 0 {name=NL020 sig_type=std_logic lab=md[9]}
C {lab_pin.sym} -375 -120 0 0 {name=NL021 sig_type=std_logic lab=md[8]}
C {lab_pin.sym} -375 -100 0 0 {name=NL022 sig_type=std_logic lab=md[7]}
C {lab_pin.sym} -375 -80 0 0 {name=NL023 sig_type=std_logic lab=md[6]}
C {lab_pin.sym} -375 -60 0 0 {name=NL024 sig_type=std_logic lab=md[5]}
C {lab_pin.sym} -375 -40 0 0 {name=NL025 sig_type=std_logic lab=md[4]}
C {lab_pin.sym} -375 -20 0 0 {name=NL026 sig_type=std_logic lab=md[3]}
C {lab_pin.sym} -375 0 0 0 {name=NL027 sig_type=std_logic lab=md[2]}
C {lab_pin.sym} -375 20 0 0 {name=NL028 sig_type=std_logic lab=md[1]}
C {lab_pin.sym} -375 40 0 0 {name=NL029 sig_type=std_logic lab=md[0]}
C {lab_pin.sym} 540 -75 0 0 {name=NL030 sig_type=std_logic lab=md[15:0]}
C {lab_pin.sym} 923 -75 0 0 {name=NL031 sig_type=std_logic lab=mcode[0:3]}
C {lab_pin.sym} 923 -50 0 0 {name=NL032 sig_type=std_logic lab=m_overflow}
C {lab_pin.sym} 923 -25 0 0 {name=NL033 sig_type=std_logic lab=m_bubble}
C {lab_pin.sym} -745 555 0 0 {name=NL034 sig_type=std_logic lab=fstart}
C {lab_pin.sym} -745 575 0 0 {name=NL035 sig_type=std_logic lab=fstop}
C {lab_pin.sym} -375 555 0 0 {name=NL036 sig_type=std_logic lab=fd[0]}
C {lab_pin.sym} -375 575 0 0 {name=NL037 sig_type=std_logic lab=fd[1]}
C {lab_pin.sym} -375 595 0 0 {name=NL038 sig_type=std_logic lab=fd[2]}
C {lab_pin.sym} -375 615 0 0 {name=NL039 sig_type=std_logic lab=fd[3]}
C {lab_pin.sym} -375 635 0 0 {name=NL040 sig_type=std_logic lab=fd[4]}
C {lab_pin.sym} -375 655 0 0 {name=NL041 sig_type=std_logic lab=fd[5]}
C {lab_pin.sym} -375 675 0 0 {name=NL042 sig_type=std_logic lab=fd[6]}
C {lab_pin.sym} -375 695 0 0 {name=NL043 sig_type=std_logic lab=fd[7]}
C {lab_pin.sym} -375 715 0 0 {name=NL044 sig_type=std_logic lab=fd[8]}
C {lab_pin.sym} 540 605 0 0 {name=NL045 sig_type=std_logic lab=fd[8:0]}
C {lab_pin.sym} 923 605 0 0 {name=NL046 sig_type=std_logic lab=fcode[0:3]}
C {lab_pin.sym} 923 630 0 0 {name=NL047 sig_type=std_logic lab=f_overflow}
C {lab_pin.sym} 923 655 0 0 {name=NL048 sig_type=std_logic lab=f_bubble}
