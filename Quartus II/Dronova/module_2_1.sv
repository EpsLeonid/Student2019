import module_2_1_parameter::katusha; // ����������� ����� � �����������
module module_2_1 
(
input wire a, 
input wire b, 
output wire c,

input wire clk,
input wire d,
output reg out,

input [katusha-1:0] A,
input [katusha-1:0] B,
input [katusha-1:0] C,
output reg [2*katusha-1:0] DATA_OUT
);

//������� 2.2
assign c=a&b;

//������� 2.3, ����������� ������ D-�������� 
always @(posedge clk)
begin
out <=d; 
end


//������� 2.4, 8-��������� �������
always @(posedge clk)
begin
DATA_OUT <= A*B+C;
end

endmodule
