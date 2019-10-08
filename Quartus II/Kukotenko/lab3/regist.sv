module regist //������, ����������� 8-��������� ������� � ����������� �������� DATA_OUT=A*B+C 
(
//������� ���� ������
	input [7:0] A,
	input [7:0] B,
	input [7:0] C,
	input clock,
//�������� ���� ������
	output [15:0] DATA_OUT
);
reg [7:0] regMul ;
reg [7:0] regAdd;
reg [7:0] regC;
reg [7:0] regA;
reg [7:0] regB;
reg [7:0] regC1;//��� ��������

always @( posedge clock ) //������ ����� �������� �������� ����� clock ����������� ��� ��������
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
always @(posedge clock) begin
	regAdd<=regMul+regC1;
	end
assign DATA_OUT=regAdd;

endmodule