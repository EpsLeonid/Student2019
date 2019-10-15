module Task_2_3(d, clk, out);
input d;  
input clk;  
output reg out; 
always @(negedge clk) 
begin
 out <= d; 
end 
endmodule 