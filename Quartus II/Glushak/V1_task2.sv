//Task 2
import V1_par::Const;

module V1_task2
( // task 2.2
	input  wire a,
	input  wire b,
	
  // task 2.3
	input wire d,
	input wire clk,
	input wire reset,
  //task 2.4
	input wire [Const-1:0] A,
	input wire [Const-1:0] B,
	input wire [Const-1:0] C,
	
//--output task 2.2
	output wire c,
//--output task 2.3
	output reg out,
//--output task 2.4
	output reg [(2*Const)-1:0] DATA_OUT);
	
//------------------------------
reg [(2*Const)-1:0] DATA_MULT;
reg [(2*Const)-1:0] DATA_DELAY;
	
// task 2.2
	assign c=a * b;
// task 2.3
always @(posedge reset or posedge clk)
begin
	if (reset)
	out<=0;
	else
	out<=d;
end
//task 2.4
always @(posedge reset or posedge clk)
begin
	if (reset)
	 begin
	 DATA_MULT<=0;
	 DATA_DELAY<=0;
	 DATA_OUT<=0;
	 end
	else
	 begin
	 DATA_MULT<= A*B;
	 DATA_DELAY<=C;
	 DATA_OUT<= DATA_MULT+DATA_DELAY;
	end
end
endmodule 