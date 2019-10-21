import Task_25::N;

module Task245 (output [2*N-1:0] Data_out, input [N-1:0]A,B,C, input clk);
always @(posedge clk)
begin 
 Data_out=A*B+C;
end
endmodule