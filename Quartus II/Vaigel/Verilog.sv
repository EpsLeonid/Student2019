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
always @(posedge clk)
begin
  if (reset==1)
    DATA_OUT <= 0;
  else 
	DATA_OUT <= A*B+C; 
end       
//------------------------------------
endmodule