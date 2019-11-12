import parameters::*;
module task5_1
(
	//�������� ������
	input clk,
	//������� ��������
	input[sizeOfReg - 1:0] a,
	input[sizeOfReg - 1:0] b,
	input[sizeOfReg - 1:0] c,
	
	//output[sizeOfReg - 1:0] regA1,
	//output[sizeOfReg - 1:0] regB1,
	//output[sizeOfReg - 1:0] regC1,
	//output[sizeOfReg - 1:0] regC2,
	//output[sizeOfReg*2 - 1:0] regAmultB,

	//������� �������� ������
	output[sizeOfReg*2 - 1:0] data_out
);
reg [sizeOfReg - 1:0] shift_a;
reg [sizeOfReg - 1:0] shift_b;
reg [sizeOfReg - 1:0] shift_c1;
reg [sizeOfReg - 1:0] shift_c2;
reg [sizeOfReg*2 - 1:0] mult;
reg [sizeOfReg*2 - 1:0] Res;

//���������� �� ��������� ������ �����
always@(posedge clk)
	begin
	//����� ������
	shift_a <= a;
	shift_b <= b;
	shift_c1 <= c;
	shift_c2 <= shift_c1;
	end

always@(posedge clk)
	//begin
    //���������
	mult = shift_a * shift_b;
	//mult = a * b;
	//shift_c1 <= c;
	//end

always@(posedge clk)
	//��������
	//Res = mult + shift_c2;
	Res = mult + shift_c2;
//���������� ��������� � ��������
//assign regA1 = a; //shift_a;
//assign regB1 = b; //shift_b;
//assign regC1 = shift_c1;
//assign regC2 = shift_c2;
//assign regAmultB = mult;
assign data_out = Res;

endmodule