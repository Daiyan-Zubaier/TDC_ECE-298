module counter(	
	input clk, input rst_n, output reg [3:0] count
);

always @(posedge clk) begin

	if (rst_n == 0) begin 
		count <= 4'b0;
	end else begin
		count <= count + 1'b1;
	end

end

endmodule
