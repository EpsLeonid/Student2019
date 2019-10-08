
import parameters::*; // ���� � �����������
module ABC_parameter
 
(
	// ������� ���� ������
	input [a_size-1 : 0] A,
	input [b_size-1 : 0] B,
	input [c_size-1 : 0] C,

	input clk,
// �������� ���� ��� �������
	output [a_size-1 : 0] test1,
	output [b_size-1 : 0] test2,
	output [c_size-1 : 0] test3,
	output [c_size-1 : 0] test4,
	output [data_size-1 : 0] test5,
	output [data_size-1 : 0] test6,
// �������� ���� ������
	output [data_size-1 : 0] DATA_OUT
);

// �������� ��� ������������ ������
logic [a_size-1 : 0]	reg_A;
logic [b_size-1 : 0]	reg_B;
logic [c_size-1 : 0]	reg_C;
logic [c_size-1 : 0]	reg_C1;
// �������� ��� �������� ������������� ������
logic [data_size-1 : 0]	reg_AB;
logic [data_size-1 : 0]	reg_ABC;

// ����������� ������
always_ff @( posedge clk )
begin
	reg_A <= A;
	reg_B <= B;
	reg_C <= C;
	reg_C1 <= reg_C;
end
// ���������
always_ff @( posedge clk )
	reg_AB <= reg_A*reg_B;
// ��������
always_ff @( posedge clk )
	reg_ABC <= reg_AB + reg_C1;
	
assign DATA_OUT = reg_ABC;

assign test1 = reg_A;
assign test2 = reg_B;
assign test3 = reg_C;
assign test4 = reg_C1;
assign test5 = reg_AB;
assign test6 = reg_ABC;

endmodule