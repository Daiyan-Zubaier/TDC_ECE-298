`default_nettype none
// therm[0] is the earliest Vernier comparison. Valid codes are 000...111
// in physical propagation order. All zero means the fast edge never caught up.
module fine_encoder (
    input wire [8:0] therm,
    output reg [3:0] code,
    output wire overflow,
    output reg bubble
);
    integer i;
    always @* begin
        code = 0;
        bubble = 0;
        for (i = 0; i < 9; i = i + 1)
            code = code + {3'b000, ~therm[i]};
        for (i = 0; i < 8; i = i + 1)
            if (therm[i] && !therm[i+1]) bubble = 1;
    end
    assign overflow = ~|therm;
endmodule
`default_nettype wire
