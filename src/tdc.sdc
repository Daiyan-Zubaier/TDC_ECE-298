# GF26c, 50 MHz. The TDC comparison paths intentionally measure asynchronous
# arrival times; their apertures and resolution are checked in transistor SPICE.
source $::env(SCRIPTS_DIR)/base.sdc
set_case_analysis 1 [get_ports ena]
set_false_path -from [get_ports rst_n]
set_false_path -from [get_ports {ui_in[6]}]

# Representative event period exceeds the conversion/re-arm latency. 
# START is sampled on clk with ordinary input setup/hold timing. STOP is asynchronous.
foreach endpoint {stop} port {{ui_in[1]}} {
    if {![info exists tdc_pnr_only]} {
    create_clock -name ${endpoint}_event -period 10000 [get_ports $port]
    create_generated_clock -name ${endpoint}_launch -source [get_ports $port] \
        -divide_by 1 [get_pins ${endpoint}_endpoint/launch_ff/Q]
    create_generated_clock -name ${endpoint}_capture -source [get_ports clk] \
        -divide_by 1 [get_pins ${endpoint}_endpoint/capture_ff/Q]
    }
    set_false_path -to [get_pins ${endpoint}_endpoint/capture_ff/D]
    set_false_path -to [get_pins ${endpoint}_endpoint/launch_ff/D]
    set_false_path -to [get_pins ${endpoint}_endpoint/launch_ff/RN]
}
proc tdc_pins {pattern} {
    set result {}
    foreach pin [get_pins -hierarchical *] {
        if {[regexp $pattern [get_property $pin full_name]]} {lappend result $pin}
    }
    return $result
}
proc tdc_data_pins {cells} {
    set result {}
    foreach pin [get_pins -of_objects $cells] {
        if {[regexp {/D$} [get_property $pin full_name]]} {lappend result $pin}
    }
    return $result
}
set_false_path -to [tdc_pins {.*endpoint/.*medium_sample/D$}]
set_false_path -to [tdc_pins {.*demo_vernier/.*compare/D$}]
set_false_path -from [get_ports {ua[*]}]

# Identify a source register by its preserved Q-net, even after cell mapping.
proc tdc_registers {net_pattern} {
    set nets {}
    foreach net [get_nets -hierarchical *] {
        if {[regexp $net_pattern [get_property $net full_name]]} {lappend nets $net}
    }
    set drivers [get_pins -of_objects $nets -filter {direction == output}]
    return [get_cells -of_objects $drivers]
}
foreach name {start_sync stop_sync mode_sync} {
    set regs [tdc_registers [format {.*controller/%s\[0\]$} $name]]
    if {[llength $regs] == 0} {error "Missing first synchronizer register: $name"}
    set_false_path -to [tdc_data_pins $regs]
}

# Bundled-data transfer: raw snapshots stay fixed through settling. The
# controller waits at least 16 reference cycles AFTER synchronizing capture.
# A 100 ns combinational bound leaves margin for late Vernier comparisons.
set snapshots [tdc_pins {.*(endpoint/.*(medium_sample|sample)|demo_vernier/.*compare)/Q$}]
# Raw byte and error are latched after settling.
set raw_outputs [tdc_registers {(^|/)(result|error)(\[|$)}]
set raw_d [tdc_data_pins $raw_outputs]
# One endpoint: 4 coarse + 16 medium, plus 9 standalone fine snapshots.
if {[llength $snapshots] != 29 || [llength $raw_d] != 9} {
    error "Snapshot or raw-result collections do not match the physical architecture"
}
set snapshot_cells [get_cells -of_objects $snapshots]
set_max_delay -ignore_clock_latency 100 -from $snapshot_cells -to $raw_d
set_min_delay -ignore_clock_latency 0 -from $snapshot_cells -to $raw_d



# MODE changes only during disarm/re-arm, while the held START launch is low.
# This is a protocol-qualified event gate, not a periodic clock gate with a
# required 5 us hold time. Exempt only its MODE input; keep normal mode data paths.
set demo_gate [get_cells -of_objects [get_pins -of_objects [get_nets demo_request] -filter {direction == output}]]
# Fanout repair may insert a buffer on MODE. Follow only single-input
# buffer/inverter chains; never broaden this exception to the START path.
proc tdc_from_mode {net} {
    for {set hop 0} {$hop < 16} {incr hop} {
        if {[get_property $net full_name] == "mode_active"} {return 1}
        set drivers [get_pins -of_objects $net -filter {direction == output}]
        if {[llength $drivers] != 1} {return 0}
        set inputs [get_pins -of_objects [get_cells -of_objects $drivers] -filter {direction == input}]
        if {[llength $inputs] != 1} {return 0}
        set nets [get_nets -of_objects $inputs]
        if {[llength $nets] != 1} {return 0}
        set net [lindex $nets 0]
    }
    return 0
}
set mode_gate_pins {}
foreach pin [get_pins -of_objects $demo_gate -filter {direction == input}] {
    foreach net [get_nets -of_objects $pin] {
        if {[tdc_from_mode $net]} {lappend mode_gate_pins $pin}
    }
}
if {[llength $mode_gate_pins] != 1} {error "Cannot identify demo MODE gate input"}
set_false_path -through $mode_gate_pins
