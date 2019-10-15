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
	output reg [par*2+1:0] DATA_OUT //����������� "����������" ������ ����
	
);  
  
//���������� ������� 2.2
	assign c = a*b;
  
//���������� ������� 2.3
	always @(posedge clk) //������ �� ��������� ������ clk
	begin
	out <=d;
	end
	
//���������� ������� 2.4
	always @(posedge clk)
	begin
	DATA_OUT <= A*B+C;
	
end

endmodule //����� ������ ������
  
  