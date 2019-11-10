module pr2
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

output[7:0] regA1,
output[7:0] regB1,
output[7:0] regC1,
output[7:0] regC2,
output[15:0] regAmultB,
output[15:0] data_out
);

//task 2.2
assign C = A * B;

//task 2.3
always@(posedge clk)
	out = d;

//task 2.4

reg [7:0] shift_a;
reg [7:0] shift_b;
reg [7:0] shift_c1;
reg [7:0] shift_c2;
reg [15:0] mult;
reg [15:0] Res;

always@(posedge clk)
	begin
	//data_out = a*b + c;
	shift_a <= a;
	shift_b <= b;
	shift_c1 <= c;
	shift_c2 <= shift_c1;
	end

always@(posedge clk)
	mult = shift_a * shift_b;

always@(posedge clk)
	Res = mult + shift_c2;

assign regA1 = shift_a;
assign regB1 = shift_b;
assign regC1 = shift_c1;
assign regC2 = shift_c2;
assign regAmultB = mult;
assign data_out = Res;

endmodule