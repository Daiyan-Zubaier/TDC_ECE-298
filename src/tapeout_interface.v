// Interface-only view for the Tiny Tapeout custom-GDS artifact.
// The physical GDS defines the implementation. Simulation uses project.v and
// the other RTL files in info.yaml; this stub is not a functional netlist.
`default_nettype none
module tt_um_daiyan_tdc (
    inout wire VPWR, VGND,
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    inout wire [7:0] ua,
    input wire ena, clk, rst_n
);
endmodule
`default_nettype wire
