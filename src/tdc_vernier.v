`default_nettype none
`ifdef USE_POWER_PINS
`define TDC_PG .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`else
`define TDC_PG
`endif
// Nine comparisons, identical topology to fine_delay_line.sch.
// fine[0] is the first physical comparator (the schematic labels it D8).
(* keep_hierarchy = 1 *) module tdc_vernier (
`ifdef USE_POWER_PINS
    inout wire VPWR, VGND,
`endif
    input wire slow_in, fast_in,
    output wire [8:0] fine
);
    wire [8:0] slow, fast;
    genvar j;
    for(j=0;j<9;j=j+1) begin: stages
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dlya_4 slow_cell
            (`TDC_PG .I(j==0 ? slow_in : slow[j-1]), .Z(slow[j]));
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dlya_1 fast_cell
            (`TDC_PG .I(j==0 ? fast_in : fast[j-1]), .Z(fast[j]));
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dffq_1 compare
            (`TDC_PG .D(fast[j]), .CLK(slow[j]), .Q(fine[j]));
    end
endmodule
`undef TDC_PG
`default_nettype wire
