module therm_encoder(
    input  [15:0] therm,
    output  reg [3:0]   code,
    output reg overflow, output reg bubble
	
);

integer i ;

always @(*) begin
    code = 0;                        
    bubble = 0;
    for (i = 0; i < 16; i = i + 1) begin
        if (therm[i] == 1) code = code + 1;
    end

    overflow = &therm;

    for (i = 0; i < 15; i = i+1) begin
		if (therm[i] == 0 & therm[i+1] == 1) bubble = 1;
      end
end

endmodule

