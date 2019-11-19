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
reg[20:0] q_1;
reg[20:0] p;
reg[20:0] p_1;
reg[20:0] s;
reg[20:0] dl_k;
reg[20:0] p_m2;
reg[20:0] p_m1;
reg[20:0] p_m2_1;
reg[20:0] p_m2_2;
reg[20:0] p_m2_3;
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
			begin
				save_data[i]<= 0;
			end
		
		dk<=0;
		dl<=0;
		q<=0;
		p<=0;
		s<=0;
		p_m2<=0;
		p_m1<=0;
		p_1<=0;
		q_1<=0;
		p_m2_1<=0;
		p_m2_2<=0;
		p_m2_3<=0;
		output_data<=0;
	end
	else
	begin
		for(int i=1;i<saveDataSize; i++)
		begin
			save_data[i+1]<=save_data[i];
		end
		save_data[0]<=input_data;
		
		dk<=save_data[0]-save_data[k_16];
		dl<=save_data[l_16]- save_data[l_16+1];//�������� �� 1, ��� �� ��� ������ ����� ���������
													//������ ����������� � ����� ������ ������		
		dl_k<=dl*k_16;
		p=p[1]+dk-dl_k;
		p_1<=p;
		
		p_m2<=m2_16*p_1;
		p_m2_1<=p_m2;
		p_m2_2<=p_m2_1;
		p_m2_3<=p_m2_2;
		
		q<=q[1]+p_m2_3;
		q<=q_1;
		
		p_m1<=p_1*m1_16;
		s<=s[1]+q_1+p_m1;
		//�������� �� 3 �����, ��� �� � ����� ������� ��� ������� ��������� � ���� �����
		offset1<=s;
		//offset2<=offset1;
		output_data<=offset1>>>4;
		end
end
endmodule
