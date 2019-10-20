module Zadanie_2(a,b,c,rst,clk,A,B,C,DATA_OUT,clkd,d,out);

// register
import Zadanie_2_parameter::*;
  input wire [R-1:0] A;
  input wire [R-1:0] B;
  input wire [R-1:0] C;

output [outR-1:0] DATA_OUT;
 reg [outR-1:0] DATA_OUT;
 reg [outR-1:0] DATA_MULT;
 reg [outR-1:0] DATA_SUMM; 

// C=A*B
  input a;
  input b;
output c;
 assign c=a*b;

// D-trigger
  input d;
  input clkd;
output reg out;
 always @(posedge clkd) begin
   out<=d;
 end

// register (8)
  input clk;
  input rst;
 always @ (clk or rst) begin
   if (clk)
 begin
   DATA_MULT<=A*B;
   DATA_SUMM<=C;
   DATA_OUT<=DATA_MULT+DATA_SUMM;
 end
    else
	begin
	DATA_OUT<=0;
	end
 end	
endmodule 