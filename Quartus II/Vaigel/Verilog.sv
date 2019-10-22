import Verilog_parameter::S; //����������� ����� � �����������

module Verilog 
// #(parameter S=8)
(
//----task#2.2
  input wire a,
  input wire b,
//------------------------------
  output wire c,

//----task#2.3 D-�������
  input wire d,
  input wire clk,
  input wire reset,
//-------------------------------
  output reg out,

//----task#2.4 �������
//������� ������
  input wire [S-1:0] A,
  input wire [S-1:0] B,
  input wire [S-1:0] C,
//�������� ����
  output reg [S*2-1:0] DATA_OUT,
//��� �������� �������������� ��������� � ��������
  output [S*2-1:0] ch1,
  output [S*2-1:0] ch2);

  reg [S*2-1:0] regMult;
  reg [S*2-1:0] regAdd;
  reg [S-1:0] regC;
  reg [S-1:0] regA;
  reg [S-1:0] regB;
  reg [S-1:0] regC1; //��� ��������
  reg [S-1:0] regC2; 
              
//task#2
  assign c = a*b;
//------------------------------------  

//task#2.3
always @(posedge clk) 
begin
	if (reset == 1)
		out <= 0;
	else
		out <=d;
end
//------------------------------------

//task#2.4
always @(posedge clk) //�������� �����������, ����� �� clock �������� �������� �����
begin
	regA <= A;
	regB <= B;
	regC <= C;
	regC1 <= regC;
	regC2 <= regC1;
//���������
	regMult <= regA*regB;
//��������
	regAdd <= regMult+regC1;
end

assign DATA_OUT = regAdd;
assign ch1 = regMult;
assign ch2 = regAdd;
     
//------------------------------------
endmodule