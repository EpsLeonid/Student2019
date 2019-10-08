import sun_parameter::sun; // ���������� ���� � �����������

module pro1
( 
 //���������� ��� 2.2
  input wire  a,
  input wire b,
  output wire c,
 // ���������� ���  �������� 2.3  
  input clk,
  input d,
  output reg out,
  //���������� ��� �������� 2.4 (������ ��� ����� ��������)
  input [sun-1:0] A,
  input [sun-1:0] B,
  input [sun-1:0] C,
  output reg [sun*2-1:0] DATA_OUT 
)
;
//������� 2.2
assign c = a*b;
//������� ��� D-�������� 2.3
always @(posedge clk)
begin
out <=d;
end
//������� ��� 8 ������� �������� 2.4
always @(posedge clk)
begin
DATA_OUT <= A*B+C;
end

endmodule


