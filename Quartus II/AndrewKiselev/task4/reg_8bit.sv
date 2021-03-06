import reg_8bit_config::R;
module reg_8bit (
	input [R-1:0] A,
	input [R-1:0] B,
	input [R-1:0] C,
	input clk,
	output [2*R-1:0] out
);
	always @(posedge clk) begin
		out<=(A*B)+C;
	end
endmodule
