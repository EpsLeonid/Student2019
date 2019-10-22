import par_parameter::par; // ����������� ����� par � ����������� 

module exe2  //������ ��� �������� ������ � ���������� ������� 2

(

//��������� ��� ������� 2.2
 	input wire  a,
	input wire b,
	output wire c,
  
//��������� ��� ������� 2.3 
	input clk,
	input d,
	output reg out,
  
//��������� ��� ������� 2.4, �������� ����� ���� � ����������� par
	input [par:0] A,
	input [par:0] B,
	input [par:0] C,
	output [par:0] C1,
	output [par:0] C2,
	output reg [par*2+1:0] DATA_OUT, //����������� "����������" ������ ����
	output reg [par*2+1:0] R
	
);  
  
//���������� ������� 2.2
	assign c = a*b;
  
//���������� ������� 2.3
	always @(posedge clk) //������ �� ��������� ������ clk
	begin
	out <=d;
	end
	
//���������� ������� 2.4
	
	//�������� � �� clk
	always @(posedge clk) 
	begin
	C1 <=C;
	end
	
	//�������� �1 �� clk
	always @(posedge clk) 
	begin
	C2 <=C1;
	end
	
	//���������� ���������
	always @(posedge clk)     
	begin
	R <= A*B;
	end
	
//���������� �������� 
	always @(posedge clk)     
	begin
	DATA_OUT <= R+C2;	
	end

endmodule //����� ������ ������


  