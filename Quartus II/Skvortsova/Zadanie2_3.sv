module Zadanie2_3 (d, clk, out); // D-trigger
  input d;
  input clk;
  output reg out; 
 always @(posedge clk) begin
   out<=d;
 end
endmodule   
 
   

