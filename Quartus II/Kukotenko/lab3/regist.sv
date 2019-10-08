module regist
(
//������� ���� ������
	input [7:0] A,
	input [7:0] B,
	input [7:0] C,
	input clock,
//�������� ���� ������
	output [15:0] DATA_OUT
);
reg [7:0] reg_AB ;
reg [7:0] reg_ABC;
reg [7:0] reg_C;
//���������
always @(posedge clock) 
	reg_AB<=A*B;
//��������
always @(posedge clock) begin
	reg_C<=C;
	reg_ABC<=reg_AB+reg_C;
	end
assign DATA_OUT=reg_ABC;

endmodule