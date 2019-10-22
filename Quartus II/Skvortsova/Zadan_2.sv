module Zadan_2(a,b,c,clk,A,B,C,DATA_MULT,DATA_SUMM,DATA_OUT,clkd,d,out);

// register
import Zadan_2_par::*;
  input clk;
  input [input_size-1:0] A;
  input [input_size-1:0] B;
  input [input_size-1:0] C;

output reg [outinput_size-1:0] DATA_OUT;
// reg [outinput_size-1:0] DATA_OUT;
output reg [outinput_size-1:0] DATA_MULT;
output reg [outinput_size-1:0] DATA_SUMM; 

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
  always @ (clk) begin
   DATA_MULT<=A*B;
   DATA_SUMM<=C;
   DATA_OUT<=DATA_MULT+DATA_SUMM;
  end	
endmodule 
