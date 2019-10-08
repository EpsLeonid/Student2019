import sun_parameter::sun; // подключаем файл с параметрами

module pro1
( 
 //переменные для 2.2
  input wire  a,
  input wire b,
  output wire c,
 // переменные для  триггера 2.3  
  input clk,
  input d,
  output reg out,
  //переменные для регистра 2.4 (задано уже через параметр)
  input [sun-1:0] A,
  input [sun-1:0] B,
  input [sun-1:0] C,
  output reg [sun*2-1:0] DATA_OUT 
)
;
//задание 2.2
assign c = a*b;
//задание для D-триггера 2.3
always @(posedge clk)
begin
out <=d;
end
//задание для 8 битного регистра 2.4
always @(posedge clk)
begin
DATA_OUT <= A*B+C;
end

endmodule


