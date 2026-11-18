v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {INTERNAL VERNIER DEMO / GF180} -520 -400 0 0 0.5 0.5 {}
T {START splits into the slow chain and a voltage-controlled delayed copy.} -520 -350 0 0 0.25 0.25 {}
T {The delayed copy enters the fast chain. Nine flip-flops record where it catches up.} -520 -315 0 0 0.25 0.25 {}
C {tdc_vcd.sym} -80 80 0 0 {name=Xdelay}
C {fine_delay_line.sym} 500 0 0 0 {name=Xvernier}
C {lab_pin.sym} -200 40 0 0 {name=L0 lab=launch}
C {lab_pin.sym} -200 120 0 0 {name=L1 lab=vctrl}
C {lab_pin.sym} 40 80 0 0 {name=L2 lab=delayed}
C {lab_pin.sym} -80 -20 0 0 {name=L3 lab=VDD}
C {lab_pin.sym} -80 180 0 0 {name=L4 lab=VSS}
C {lab_pin.sym} 350 -80 0 0 {name=L5 lab=launch}
C {lab_pin.sym} 350 -60 0 0 {name=L6 lab=delayed}
C {lab_pin.sym} 650 -80 0 0 {name=L7 lab=q[8]}
C {lab_pin.sym} 650 -60 0 0 {name=L8 lab=q[7]}
C {lab_pin.sym} 650 -40 0 0 {name=L9 lab=q[6]}
C {lab_pin.sym} 650 -20 0 0 {name=L10 lab=q[5]}
C {lab_pin.sym} 650 0 0 0 {name=L11 lab=q[4]}
C {lab_pin.sym} 650 20 0 0 {name=L12 lab=q[3]}
C {lab_pin.sym} 650 40 0 0 {name=L13 lab=q[2]}
C {lab_pin.sym} 650 60 0 0 {name=L14 lab=q[1]}
C {lab_pin.sym} 650 80 0 0 {name=L15 lab=q[0]}
C {code_shown.sym} -520 280 0 0 {name=SIM only_toplevel=true value=".include pdk_models.spice
VDD VDD 0 3.3
VSS VSS 0 0
VIN input 0 PULSE(0 3.3 5n 20p 20p 75n 150n)
VCTRL vctrl 0 2.8
Xdrive input launch VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
Xstatus delayed status VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
.temp 25
.tran 5p 110n 0 10p
.save v(launch) v(delayed) v(vctrl) v(q[0]) v(q[1]) v(q[2]) v(q[3]) v(q[4]) v(q[5]) v(q[6]) v(q[7]) v(q[8])
.control
run
write tdc_demo.raw
.endc
"}
T {q[0] = first physical comparator = original fine_delay_line D8. Code = number of leading zeros.} -520 230 0 0 0.22 0.22 {}
C {lab_pin.sym} 500 -120 0 0 {name=LFINEPOWER lab=VDD}
