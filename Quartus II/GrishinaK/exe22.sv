import par_parameter::par; // ����������� ����� � �����������

module exe22 // ������ ��� �������� ������� � ���������� ������� 2
(
	// ��������� ��� ������� 2.2
	input wire a,
	input wire b,
	
	output wire c,
	
	// ��������� ��� ������� 2.3
	input clk,
	input d,
	
	output exit,
	
	//��������� ��� ������� 2.4
	input [par:0]A,
	input [par:0]B,
	input [par:0]C,
	
	output [par*2+1:0]out  
);
	// ���������� ������� 2.2
	assign c = b*a;
	
	// ���������� ������� 2.3
	always@(posedge clk) // ������ �� ��������� ������ clk
	begin
	exit <=d;
	end
	
	// ���������� ������� 2.4
//�������� ��������� A1,B1,C1,C2	
reg [par:0]A1;
reg [par:0]B1;
reg [par:0]C1;
reg [par:0]C2;

//�������� �������� R ��� �������� ���������� ���������
reg [par*2+1:0]R;

// �������� �������� out_data ��� �������� ���������� ��������
reg [par*2+1:0]out_data;

always@(posedge clk)
begin
	C1<=C; //������ � � reg C1, ����� � �2 �� clk 
	C2<=C1;
	A1<=A; //������ � � reg A1 �� clk
	B1<=B; // ������ B � reg B1 �� clk
	
	// ������ ���������� ��������� � R
	R<=A1*B1;
	// ������ ���������� �������� � out_data
	out_data <= R+C2;	
end	

assign out = out_data;

endmodule // ����� ������ ������