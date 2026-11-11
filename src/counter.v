module counter(	
	input clk, input rst_n, output reg [7:0] count
);

always @(posedge clk) begin

	if (rst_n == 0) begin 
		count <= 8'b0;
	end else begin
		count <= count + 1;
	end

end

endmodule
