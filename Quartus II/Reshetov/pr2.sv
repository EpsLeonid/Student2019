module pr2
#(
parameter size = 8;
parameter size_out = size * 2
)
(
//task 2.2
input A, 
input B,
output C, 
//task 2.3
input d,
input clk,
output out,
//task 2.4
input[7:0] a,
input[7:0] b,
input[7:0] c,
output[15:0] data_out
);

//task 2.2
assign C = A * B;

//task 2.3
always@(posedge clk)
	out = d;

//task 2.4
always@(posedge clk)
	begin
	data_out = a * b + c;
	end

endmodule