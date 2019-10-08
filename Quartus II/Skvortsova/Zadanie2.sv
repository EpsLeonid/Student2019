module Zadanie2 (a,b,c,d,clk,out,A,B,C,DATA_OUT,DATA_MULT,DATA_SUMM);
 
// C=A*B
  input a; 
  input b;
 output c;
assign c=a*b;

// D-trigger
  input d;
  input clk;
  output reg out; 
 always @(posedge clk) begin
   out<=d;
 end
 
// register (8)
  input wire [7:0] A;
  input wire [7:0] B;
  input wire [7:0] C;
 output reg [7:0] DATA_OUT;
 output reg [7:0] DATA_MULT;
 output reg [7:0] DATA_SUMM; 
always @(posedge clk) begin
DATA_MULT<=A*B;
DATA_SUMM<=C;
DATA_OUT<=DATA_MULT+DATA_SUMM;
end

endmodule


