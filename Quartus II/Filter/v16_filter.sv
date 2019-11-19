//	v_16_filter_Kukotenko_Valeria
//  dk(n)=exp(n)-exp(n-k)
//	d1(n)=exp(n)-exp(n-1)
//	p(n)=p(n-1)+dk(n)-k*d1(n-l)
//	q(n)=q(n-1)+m2*p(n)
//	s(n)=s(n-1)+q(n)+m1*p(n)

module v16_filter
(
input [SIZE_ADC_DATA:0] input_data,
input clk,
input reset,//������ 0 ���������� ��
//�������� ������
output [SIZE_FILTER_DATA:0] output_data
);
import package_settings::*;
import v16_parameters::*;
//�������� ��� �������� �������� ���������� 
reg[saveDataSize:0][SIZE_ADC_DATA:0] save_data;

reg[20:0] dk;
reg[20:0] dl;
reg[20:0] q;
reg[20:0] p;
reg[20:0] s;
reg[20:0] dl_k;
reg[20:0] p_m2;
reg[20:0] p_m1;
reg[20:0] offset1;
reg[20:0] offset2;
reg[20:0] offset3;
//����� �������� ������������� �����, ����� � ����� ������
//������(�������) ������������ ������ � �����-�� ������ �������
always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		for(int i=0;i<saveDataSize;i++)
			save_data[i]<= 0;
		
		dk<=0;
		dl<=0;
		q<=0;
		p<=0;
		s<=0;
		output_data<=0;
	end
	else
	begin
		for(int i=1;i<saveDataSize; i++)
		save_data[i+1]<=save_data[i];
		save_data[0]<=input_data;
		
		dk<=save_data[0]-save_data[saveDataSize];
		dl<=save_data[l_16]- save_data[l_16-1];//�������� �� 1, ��� �� ��� ������ ����� ���������
													//������ ����������� � ����� ������ ������		
		dl_k<=dl*k_16;
		p=p+dk-dl_k;
		p_m2<=m2_16*p;
		q=q+p_m2;
		p_m1<=p*m1_16;
		s=s+q+p_m1;
		//�������� �� 3 �����, ��� �� � ����� ������� ��� ������� ��������� � ���� �����
		offset1<=s;
		offset2<=offset1;
		offset3<=offset2;
		output_data<=offset3>>>4;
		offset3>>>4;
		end
end
endmodule
