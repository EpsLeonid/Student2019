import module_2_1_parameter::katusha; // подключение файла с параметрами
module module_2_1 
(
input wire a, 
input wire b, 
output wire c,

input wire clk,
input wire d,
output reg out,

input [katusha-1:0] A,
input [katusha-1:0] B,
input [katusha-1:0] C,
output reg [2*katusha-1:0] DATA_OUT
);

//Задание 2.2
assign c=a&b;

//Задание 2.3, описывающее работу D-триггера 
always @(posedge clk)
begin
out <=d; 
end


//Задание 2.4, 8-разрядный регистр
always @(posedge clk)
begin
DATA_OUT <= A*B+C;
end

endmodule
