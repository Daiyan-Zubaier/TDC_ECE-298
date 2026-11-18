`default_nettype none
module tdc_decode (
    input wire [15:0] medium_taps,
    output reg [3:0] region,
    output reg invalid
);
    integer i;
    always @* begin
        region=0; invalid=0;
        for(i=0;i<16;i=i+1) region=region+{3'b0,medium_taps[i]};
        for(i=0;i<15;i=i+1) if(!medium_taps[i] && medium_taps[i+1]) invalid=1;
        if(&medium_taps) invalid=1;
    end
endmodule
`default_nettype wire
