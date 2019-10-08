module ABC 
(
// ������� ���� ������
	input [7 : 0] A,
	input [7 : 0] B,
	input [7 : 0] C,

	input clk,
// �������� ���� �������������� ��� ��������
	output [7 : 0] test1,
	output [7 : 0] test2,
	output [7 : 0] test3,
	output [7 : 0] test4,
	output [7 : 0] test5,
	output [7 : 0] test6,

// �������� ���� ������
	output [7 : 0] DATA_OUT
);

// �������� ��� ������������ ������
logic [7 : 0]	reg_A,
				reg_B,
				reg_C,
				reg_C1; // ��� ��������

logic [7 : 0]	reg_AB;		// ��� �������� �������� A*B
logic [7 : 0]	reg_ABC;	// ��� �������� �������� AB+C

// ������������ ������
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