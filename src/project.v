`default_nettype none
module tt_um_daiyan_tdc (
`ifdef USE_POWER_PINS
    inout wire VPWR, VGND,
`endif
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    inout wire [7:0] ua,
    input wire ena, clk, rst_n
);
    (* async_reg="true" *) reg [1:0] reset_sync;
    always @(posedge clk or negedge rst_n)
        if(!rst_n) reset_sync<=0;
        else reset_sync<={reset_sync[0],1'b1};
    wire reset_core_n=reset_sync[1];
    wire arm_n, start_launched, stop_launched, stop_captured;
    reg start_launched_raw;
    wire stop_captured_raw;
    wire [3:0] stop_coarse;
    wire [15:0] stop_medium;
    wire [7:0] result;
    wire mode_active, demo_captured;
    wire [8:0] demo_fine;
    // START is synchronous to clk. Accept its sampled rising edge while armed;
    // a held-high START cannot retrigger when the controller re-arms.
    reg start_previous;
    always @(posedge clk or negedge reset_core_n)
        if(!reset_core_n) start_previous<=0;
        else start_previous<=ui_in[0];
    always @(posedge clk or negedge arm_n)
        if(!arm_n) start_launched_raw<=0;
        else if(ui_in[0] && !start_previous) start_launched_raw<=1;
    // Zero before START; count reference periods on falling edges so the
    // count is stable at the STOP endpoint's rising-edge capture.
    reg [3:0] coarse;
    always @(negedge clk or negedge arm_n)
        if(!arm_n) coarse<=0;
        else if(start_launched_raw) coarse<=coarse+1'b1;
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__buf_4 boundary_start (
`ifdef USE_POWER_PINS
        .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`endif
        .I(start_launched_raw), .Z(start_launched));
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__buf_4 boundary_stop (
`ifdef USE_POWER_PINS
        .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`endif
        .I(stop_captured_raw), .Z(stop_captured));
    wire demo_request = mode_active && start_launched_raw;
    wire demo_launch;
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__buf_4 boundary_demo_launch (
`ifdef USE_POWER_PINS
        .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`endif
        .I(demo_request), .Z(demo_launch));
    wire demo_delayed;
    (* keep_hierarchy = 1 *) tdc_vcd stimulus (
`ifdef USE_POWER_PINS
        .VPWR(VPWR), .VGND(VGND),
`endif
        .I(demo_launch), .VCTRL(ua[0]), .Z(demo_delayed));
    (* keep_hierarchy = 1 *) tdc_vernier demo_vernier (
`ifdef USE_POWER_PINS
        .VPWR(VPWR), .VGND(VGND),
`endif
        .slow_in(demo_launch), .fast_in(demo_delayed), .fine(demo_fine));
    (* keep = 1 *) gf180mcu_fd_sc_mcu7t5v0__buf_4 boundary_demo (
`ifdef USE_POWER_PINS
        .VDD(VPWR), .VSS(VGND), .VNW(VPWR), .VPW(VGND),
`endif
        .I(demo_delayed), .Z(demo_captured));
    wire done, busy, error;
    (* keep_hierarchy = 1 *) tdc_frontend stop_endpoint
        (
`ifdef USE_POWER_PINS
         .VPWR(VPWR), .VGND(VGND),
`endif
         .event_in(ui_in[1]), .accept_event(start_launched_raw && !mode_active), .arm_n(arm_n), .clk(clk),
         .coarse(coarse), .launched(stop_launched), .captured(stop_captured_raw),
         .coarse_sample(stop_coarse), .medium_taps(stop_medium));
    tdc_controller controller
        (.clk(clk), .rst_n(reset_core_n), .ena(ena), .start_launched(start_launched),
         .stop_captured(mode_active ? demo_captured : stop_captured), .stop_coarse(stop_coarse),
         .stop_medium(stop_medium),
         .mode_req(ui_in[6]), .mode_active(mode_active), .demo_fine(demo_fine), .arm_n(arm_n),
         .result(result), .done(done), .busy(busy), .error(error));
    // Single-byte raw readout; UI[2:5] no longer select/configure anything.
    assign uo_out = ena ? result : 8'b0;
    assign uio_out = ena ? {5'b0,error,(busy || start_launched),(done && !start_launched)} : 8'b0;
    assign uio_oe = ena ? 8'b00000111 : 8'b0;
    wire unused = &{1'b0,ui_in[7],ui_in[5:2],uio_in,ua[7:1],stop_launched};
endmodule
`default_nettype wire
