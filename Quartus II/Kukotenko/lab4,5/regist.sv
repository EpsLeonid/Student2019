import argum::*;

module regist //������, ����������� 8-��������� ������� � ����������� �������� DATA_OUT=A*B+C 
(
//������� ���� ������
	input [size-1:0] A,
	input [size-1:0] B,
	input [size-1:0] C,
	input clock,
//�������� ���� ������
	output [DATA_OUT_size-1:0] DATA_OUT,
//�������� ���� ��� �������� ������������� �����������
	output [DATA_OUT_size-1:0] check1,
	output [DATA_OUT_size-1:0] check2
);
reg [DATA_OUT_size-1:0] regMul ;
reg [DATA_OUT_size-1:0] regAdd;
reg [size-1:0] regC;
reg [size-1:0] regA;
reg [size-1:0] regB;
reg [size-1:0] regC1;//��� ��������

always @( posedge clock ) //������, ����� �������� �������� ����� clock ����������� ��� ��������
begin
	regA<=A;
	regB<=B;
	regC<=C;
	regC1<=regC;
end

//���������
always @(posedge clock)
	regMul<=regA*regB;
	
//��������
always @(posedge clock) 
	regAdd<=regMul+regC1;
	
assign DATA_OUT=regAdd;
assign check1=regMul;
assign check2=regAdd;

endmodule