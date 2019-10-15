import Verilog_parameter::S; //Подключение файла с параметрами

module Verilog 
// #(parameter S=8)
(
//----task#2.2
  input wire a,
  input wire b,
//------------------------------
  output wire c,

//----task#2.3 D-триггер
  input wire d,
  input wire clk,
  input wire reset,
//-------------------------------
  output reg out,

//----task#2.4 Регистр
  input wire [S-1:0] A,
  input wire [S-1:0] B,
  input wire [S-1:0] C,
//------------------------------------
  output reg [S*2-1:0] mult, // промежуточное умножение
  output reg [S*2-1:0] DATA_OUT);
  
  
  
//task#2
  assign c = a*b;
//------------------------------------  

//task#2.3
always @(posedge clk) 
begin
   out <=d;
end
//------------------------------------

//task#2.4
always @(posedge clk) //Умножение
begin
	mult = A*B;
end

always @(posedge clk)
begin
  	DATA_OUT <= mult+C; 
end       
//------------------------------------
endmodule