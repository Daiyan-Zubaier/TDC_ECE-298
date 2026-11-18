`default_nettype none
`ifdef USE_POWER_PINS
`define TDC_PG .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`else
`define TDC_PG
`endif
// Physical timing macro. Preserve this hierarchy and every delay instance.
// Launch is a held event, capture rises on the following reference edge.
// Coarse-medium only: two delay cells per thermometer interval.
(* keep_hierarchy = 1 *)
module tdc_frontend (
`ifdef USE_POWER_PINS
    inout wire VPWR, VGND,
`endif
    input wire event_in,
    input wire accept_event,
    input wire arm_n,
    input wire clk,
    input wire [3:0] coarse,
    output wire launched,
    output wire captured,
    output wire [3:0] coarse_sample,
    output wire [15:0] medium_taps
);
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dffrnq_4 launch_ff
        (`TDC_PG .D(accept_event), .RN(arm_n), .CLK(event_in), .Q(launched));
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dffrnq_4 capture_ff
        (`TDC_PG .D(launched), .RN(arm_n), .CLK(clk), .Q(captured));
    genvar c, b;
    for (c = 0; c < 4; c = c + 1) begin: coarse_latches
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dffq_1 sample
            (`TDC_PG .D(coarse[c]), .CLK(captured), .Q(coarse_sample[c]));
    end
    wire [31:0] taps;
    for (b = 0; b < 16; b = b + 1) begin: banks
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dlyc_1 medium_a
            (`TDC_PG .I(b==0 ? launched : taps[2*b-1]), .Z(taps[2*b]));
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dlyc_1 medium_b
            (`TDC_PG .I(taps[2*b]), .Z(taps[2*b+1]));
        (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__dffq_1 medium_sample
            (`TDC_PG .D(taps[2*b+1]), .CLK(captured), .Q(medium_taps[b]));

    end
endmodule
`undef TDC_PG
`default_nettype wire
