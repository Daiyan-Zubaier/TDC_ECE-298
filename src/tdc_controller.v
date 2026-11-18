`default_nettype none
module tdc_controller #(
    parameter integer SETTLE_CYCLES=16,
    parameter integer CLEAR_CYCLES=16
) (
    input wire clk,rst_n,ena,
    input wire start_launched,stop_captured,
    input wire [3:0] stop_coarse,
    input wire [15:0] stop_medium,
    input wire mode_req,
    input wire [8:0] demo_fine,
    output reg mode_active,
    output wire arm_n,
    output reg [7:0] result,
    output reg done,busy,error
);
    localparam [1:0] CLEAR=0,READY=1,MEASURE=2,SETTLE=3;
    localparam integer WAIT_WIDTH = $clog2((SETTLE_CYCLES > CLEAR_CYCLES) ? SETTLE_CYCLES : CLEAR_CYCLES);
    localparam integer WAIT_BITS = WAIT_WIDTH > 0 ? WAIT_WIDTH : 1;
    reg [1:0] state;
    (* async_reg="true" *) reg [1:0] start_sync,stop_sync;
    (* async_reg="true" *) reg [1:0] mode_sync;
    reg [3:0] age;
    reg [WAIT_BITS-1:0] wait_count;
    reg pending_done,armed;
    wire [3:0] tm,demo_code;
    wire stop_bad,demo_overflow,demo_bubble;
    // A registered arm level avoids glitches on asynchronous endpoint resets.
    assign arm_n=rst_n && ena && armed;
    tdc_decode stop_decoder(stop_medium,tm,stop_bad);
    fine_encoder demo_decoder(demo_fine,demo_code,demo_overflow,demo_bubble);
    always @(posedge clk or negedge rst_n)
        if(!rst_n) mode_sync<=0;
        else mode_sync<={mode_sync[0],mode_req};
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin start_sync<=0;stop_sync<=0;end
        else if(!ena || state==CLEAR) begin start_sync<=0;stop_sync<=0;end
        else begin
            // START and STOP capture both rise on reference edges. Their
            // matched latency lets age reject a full 16-cycle counter wrap.
            start_sync<={start_sync[0],start_launched};
            stop_sync<={stop_sync[0],stop_captured};
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state<=CLEAR;wait_count<=0;age<=0;pending_done<=0;armed<=0;
            result<=0;done<=0;busy<=0;error<=0;mode_active<=0;
        end else if(!ena) begin
            state<=CLEAR;wait_count<=0;age<=0;pending_done<=0;armed<=0;
            result<=0;done<=0;busy<=0;error<=0;mode_active<=0;
        end else begin
            case(state)
                CLEAR: begin
                    mode_active<=mode_sync[1];
                    if(wait_count==WAIT_BITS'(CLEAR_CYCLES-1)) begin
                        state<=READY;wait_count<=0;busy<=0;armed<=1;
                        if(pending_done) done<=1;
                        pending_done<=0;
                    end else wait_count<=wait_count+1'b1;
                end
                READY: if(start_sync[1]) begin
                    done<=0;error<=0;busy<=1;age<=0;state<=MEASURE;
                end else if(!start_launched && mode_active!=mode_sync[1]) begin
                    armed<=0;state<=CLEAR;wait_count<=0;done<=0;busy<=1;
                end
                MEASURE: begin
                    // Reject even a simultaneous STOP at the wrap boundary.
                    // For delta=1 the first MEASURE cycle sees age=0; delta=15
                    // sees age=14. A same-edge capture is also accepted.
                    if(age==4'd15) begin
                        error<=1;state<=CLEAR;wait_count<=0;pending_done<=1;armed<=0;
                    end else if(stop_sync[1]) begin state<=SETTLE;wait_count<=0;end
                    else age<=age+1'b1;
                end
                SETTLE: begin
                    if(wait_count==WAIT_BITS'(SETTLE_CYCLES-1)) begin
                        if(mode_active) begin
                            if(!demo_overflow && !demo_bubble) begin
                                result<={4'b0,demo_code};
                            end
                            error<=demo_overflow || demo_bubble;
                        end else begin
                            if(!stop_bad) begin
                                result<={stop_coarse,tm};
                            end
                            error<=stop_bad;
                        end
                        pending_done<=1;wait_count<=0;state<=CLEAR;armed<=0;
                    end else wait_count<=wait_count+1'b1;
                end
                default: begin state<=CLEAR;wait_count<=0;error<=1;armed<=0;end
            endcase
        end
    end
endmodule
`default_nettype wire
