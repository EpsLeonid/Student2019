//��������� ��� 5.
import testparametr::Width;

module test (

//������� ��� 2.
input a, input b, output c,

//������� ��� 3.
input wire clk, input wire d, output wire out,

//������� ��� 4.
input wire [(Width-1):0] A4, 
input wire [(Width-1):0] B4, 
input wire [(Width-1):0] C4,
output wire [(2*Width-1):0] DATA_OUT

);

//������������ ���� ������� �������� � ����� ���������� � ������ �
assign  c = a * b; //����������� ������������ ������� � ���������� ������������ � � �

//D-�������. ������ clk - �����������, d - ������� ������, out - �������� ������ � ��������.
always_ff @(posedge clk) begin //���������� ������� ������ ��� ��������� ������� clk
	out <= d; //�������� ��������, ���������� � ��������
end

//������ �  8-�� ��������� ��������� � ���������� �� ������� 200 ���
reg [(2*Width-1):0] forSummation; //������ �������� � �������, ������ ������ �������� ����
reg [(2*Width-1):0] forMultiplication;
assign forMultiplication = A4 * B4; //DATA_OUT = A4 * B4 + C4
assign forSummation = C4;
assign DATA_OUT = forMultiplication + forSummation;

endmodule