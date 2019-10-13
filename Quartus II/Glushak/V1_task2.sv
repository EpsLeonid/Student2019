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
	output reg [2*Const-1:0] DATA_OUT);
	
//------------------------------

reg [Const-1:0] reg_A;//
reg [Const-1:0] reg_B;// the registers records
reg [Const-1:0] reg_C;//

reg [2*Const-1:0] DATA_MULT;//the multiplication register
reg [Const-1:0] DATA_DELAY;// the addition register
reg [2*Const-1:0] reg_DATA_OUT;// the final register


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

//the entry in the registers
always_ff @(posedge clk)
begin
	reg_A<=A;
	reg_B<=B;
	reg_C<=C;
	DATA_DELAY<=reg_C;	
end
//multiplication
always_ff @(posedge clk)
begin
	DATA_MULT<= reg_A*reg_B;
end

//addition	
always_ff @(posedge clk)
	reg_DATA_OUT<=DATA_MULT+DATA_DELAY;
	
always @(posedge clk)
	DATA_OUT=reg_DATA_OUT;	
endmodule 