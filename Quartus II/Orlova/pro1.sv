import sun_parameter::sun; // подключение файла с параметрами

module pro1
( 
  input wire  a,
  input wire b,
  output wire c,
  
  input clk,
  input d,
  output reg out,
  
  input [sun-1:0] A,
  input [sun-1:0] B,
  input [sun-1:0] C,
  output reg [sun*2-1:0] DATA_OUT 
)
;

assign c = a*b;

always @(posedge clk)
begin
out <=d;
end

always @(posedge clk)
begin
DATA_OUT <= A*B+C;
end

endmodule


