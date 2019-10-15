import Task_2_5 :: N;

module Task_2_4_and_2_5 (output [2*N-1:0]DATA_OUT, input [N-1:0]A, B, C, input clk);
 always @(negedge clk)
   begin 
    DATA_OUT = A * B + C;
   end 
endmodule 