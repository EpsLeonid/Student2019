
import Pollparametr::Const;// ��������� ��� 5-��


module Poll(

//������� 2
input a, input b, output c, // ������� ������ ������� 2

// ������� 3
input wire clk, input wire d, output wire out,

//������� 4
input wire [(Const-1):0] A, // ������� ������ ��� ������� 4
input wire [(Const-1):0] B, 
input wire [(Const-1):0] C,
output reg [(2*Const-1):0] DATA_OUT); // �������� ������ ��� ������� 4

//���������� ��������
reg [(2*Const-1):0] reg_C;
// ������ �������� ��� ��������� � ���������� � �������, ������ ������ �������� ��� 
reg [(2*Const-1):0] DATA_MULT;
reg [(2*Const-1):0] DATA_MULT_2;
reg [(2*Const-1):0] DATA_ADD;


//�-��� ��� 2-��
assign  c = a * b; // ������������ 

// ��������� ��� 3-�� 
always_ff @(posedge clk) begin //�-�� ������������ ��� ������ clk
	out <= d;
end

always_ff @(posedge clk)
begin
	
	reg_C<=C;//������������ reg
	DATA_ADD<=reg_C;	
end
//���������� 
always_ff @(posedge clk)
begin
	DATA_MULT<= A*B;
end
// ������� ��� ����������
always_ff @(posedge clk)
begin
	DATA_MULT_2<= DATA_MULT;
end


//��������	
always_ff @(posedge clk)
	DATA_OUT<=DATA_MULT_2+DATA_ADD;
		

endmodule