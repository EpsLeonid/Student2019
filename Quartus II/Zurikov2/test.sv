//��������� ��� 5.
import testparametr::Const;

module test(

//������� ��� 2.
input a, input b, output c,

//������� ��� 3.
input wire clk, input wire d, output wire out,

//������� ��� 4.
input wire [(Const-1):0] A, 
input wire [(Const-1):0] B, 
input wire [(Const-1):0] C,
output reg [(2*Const-1):0] DATA_OUT);


reg [(Const-1):0] reg_A;
reg [(Const-1):0] reg_B;//������������ ��������
reg [(Const-1):0] reg_C;

reg [(2*Const-1):0] DATA_MULT;//������ �������� � �������, ������ ������ �������� ����
reg [(Const-1):0] DATA_ADD;
reg [(2*Const-1):0] reg_DATA_OUT;

//������� ��� 2
assign  c = a * b;

//������� ��� 3
always_ff @(posedge clk) begin //������� ����������� ��� ������ ������������ clk
	out <= d; //�������� ��������, ���������� � ��������
end

//������ ��� 4 (DATA_OUT[7..0] <= A[7..0]*B[7..0]+C[7..0])
always_ff @(posedge clk)
begin
	reg_A<=A;
	reg_B<=B;
	reg_C<=C;
	DATA_ADD<=reg_C;	
end
//����������
always_ff @(posedge clk)
begin
	DATA_MULT<= reg_A*reg_B;
end

//��������	
always_ff @(posedge clk)
	reg_DATA_OUT<=DATA_MULT+DATA_ADD;
	
always @(posedge clk)
	DATA_OUT=reg_DATA_OUT;	

endmodule