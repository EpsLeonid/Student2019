//�������������� �� ������� 5.
import q2par::Width; 

module q2 (

//������� ������� ��� ������� 2.
input A, 
input B,

//������� ������� ��� ������� 3.
input wire clk, 
input wire d,

//������� ������� ��� ������� 4.
input wire [Width-1:0] A4, 
input wire [Width-1:0] B4, 
input wire [Width-1:0] C4,

//�������� ������ ��� ������� 2.
output C,

//�������� ������ ��� ������� 3.
 output wire out,

//�������� ������ ��� ������� 4.
output reg [2*Width-1:0] DATA_OUT

);



//������������ ���� ������� �������� � ����� ���������� � ������ �
assign  C = A * B; //����������� ������������ ������� � ���������� ������������ � � �

//D-�������. ������ clk - �����������, d - ������� ������, out - �������� ������ � ��������.
always_ff @(posedge clk) begin //���������� ������� ������ ��� ��������� ������� clk
	out <= d; //�������� ��������, ���������� � ��������
end

//������ �  8-�� ��������� ��������� � ���������� �� ������� 200 ���
reg [Width-1:0] DELAY; //������� ��� �������� ��������
reg [2*Width-1:0] MULT; //"�������������" ������� ��� �������� �������� ������������ �4 � B4

always @(posedge clk) begin
	DELAY = C4; //��������
end

always_ff @(posedge clk) 
	MULT <= A4 * B4; //DATA_OUT = A4 * B4

always_ff @(posedge clk) 
	DATA_OUT <= MULT + DELAY; //DATA_OUT = (A4 * B4) + C4

endmodule