`default_nettype none
// PDK-cell macro: two dlya_1 cells on VCTRL, buf_4 on VPWR. Schematic: schem/tdc_vcd.sch.
// No synthesizable digital approximation of voltage-dependent delay.
// Unused pins and undriven output are intentional in this analog declaration.
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */
(* blackbox *) module tdc_vcd (
`ifdef USE_POWER_PINS
    inout wire VPWR, VGND,
`endif
    input wire I,
    inout wire VCTRL,
    output wire Z
);
endmodule
`default_nettype wire
/* verilator lint_on UNDRIVEN */
/* verilator lint_on UNUSEDSIGNAL */
