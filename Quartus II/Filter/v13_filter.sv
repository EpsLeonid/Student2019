//Модифицированный cusp-like фильтр с параметрами l = 5, k = 11, m1 = 16, m2 = 1

//Формулы для расчета:

//dk(n)=(v(n)-v(n-k)
//dl(n)=(v(n)-v(n-1)
//p(n)=p(n-1)+dk(n)-kdl(n-l), n>=0
//q(n)=q(n-1)+m2p(n), n>=0
//s(n)=s(n-1)+q(n)+m1p(n), n>=0
//M = m1/m2

module v13_filter(
//Входные параметры:
input wire clk,
input wire reset,
input wire  [SIZE_ADC_DATA : 0]	input_data,

//Выходные параметры:
output reg  [SIZE_FILTER_DATA : 0]	output_data

);

//Параметры cusp-like фильтра
import package_settings::*;
import v13_parameters::*;

//регистры хранения данных
reg[k_13:0][SIZE_ADC_DATA:0] Save_Data;
reg[SIZE:0] dl;
reg[SIZE:0] dk;
reg[SIZE:0] q;
reg[SIZE:0] q_1;
reg[SIZE:0] p;
reg[SIZE:0] p_1;
reg[SIZE:0] s;
reg[SIZE:0] dl_k;
reg[SIZE:0] p_m2;
reg[SIZE:0] p_m2_1;
reg[SIZE:0] p_m2_2;
reg[SIZE:0] p_m2_3;
reg[SIZE:0] p_m1_1;
reg[SIZE:0] p_m1;
reg[SIZE:0] s1;



			
always @ (posedge clk or negedge reset) 
begin
		if (!reset) 
	
	begin
//Задание первых элементов массивов
		for (int i = 1; i <= k_13; i++)	
			begin		
			Save_Data[i] <= 0;
			end
						
	dk<=0;
	dl<=0;
	q<=0;
	p<=0;
	s<=0;
	p_m2<=0;
	p_m1<=0;
	p_m2_1<=0;
	p_m1_1<=0;
	p_m2_2<=0;
	p_m2_3<=0;
	p_1<=0;
	q_1<=0;
	output_data<=0;
	end
	
	else
	begin
		
	for(int i=1;i<k_13; i++)
		begin
			Save_Data[i+1]<=Save_Data[i];
		end
		
		Save_Data[0]<=input_data;
		
		dk<=Save_Data[0]-Save_Data[k_13];
		dl<=Save_Data[l_13]- Save_Data[l_13+1];
			
		dl_k<=dl*k_13;
		p=p[1]+dk-dl_k;
		p_1<=p;
		
		p_m2<=m2_13*p_1;
		p_m2_1<=p_m2;
		p_m2_2<=p_m2_1;
		p_m2_3<=p_m2_2;
		
		q<=q[1]+p_m2_3;
		q_1<=q;
		
		p_m1<=p_1*m1_13;
		//p_m1_1<=p_m1;
		
		s<=s[1]+q_1+p_m1;
		s1<=s; //задержка
		output_data<=s1>>>4;
		end
end
endmodule

