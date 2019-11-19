//Модифицированный cusp-like фильтр с параметрами l = 5, k = 11, m1 = 16, m2 = 1

//Формулы для расчета:

//dk(n)=(v(n)-v(n-k)
//dl(n)=(v(n)-v(n-1)
//p(n)=p(n-1)+dk(n)-kdl(n-l), n>=0
//q(n)=q(n-1)+m2p(n), n>=0
//s(n)=s(n-1)+q(n)+m1p(n), n>=0
//M = m1/m2

module v3_filter(
//Входные параметры:
input wire clk,
input wire reset,
input wire  [SIZE_ADC_DATA : 0]	input_data,

//Выходные параметры:
output reg  [SIZE_FILTER_DATA : 0]	output_data

);

//Параметры cusp-like фильтра
import package_settings::*;
import v3_parameters::*;

//регистры хранения данных
reg[k_3:0][SIZE_ADC_DATA:0] Save_Data;
reg[SIZE:0] dl;
reg[SIZE:0] d1_delay;
reg[SIZE:0] dk_delay;
reg[SIZE:0] d1_k;
reg[SIZE:0] dk;
reg[SIZE:0] q;
reg[SIZE:0] q_1;
reg[SIZE:0] p;
reg[SIZE:0] p_1;
reg[SIZE:0] s;
reg[SIZE:0] p_m2;
reg[SIZE:0] p_m1;
reg[SIZE:0] s1;

			
always @ (posedge clk or negedge reset) 
begin
		if (!reset) 
	
	begin
//Задание первых элементов массивов
		for (int i = 1; i <= l_3-1; i++)	
			begin		
			Save_Data[i] <= 0;
			end
						
	dk<=0;
	dl<=0;
	d1_delay<=0;
	dk_delay=0;
	d1_k<=0;
	dk<=0;
	q<=0;
	p<=0;
	s<=0;
	p_m2<=0;
	p_m1<=0;
	p_1<=0;
	q_1<=0;
	output_data<=0;
	end
	
	else
	begin
	
	Save_Data[0]<=input_data;	
	
	for(int i=1;i<k_3; i++)
		begin
			Save_Data[i]<=Save_Data[i-1];
		end
		
		dk<=Save_Data[0]-Save_Data[k_3];
		dl<=Save_Data[0]- Save_Data[1];
		d1_delay[0]<=dl;
			
	for(int i=1;i<l_3-1; i++)
		begin
			d1_delay[i]<=d1_delay[i-1];
		end		
		d1_k<=d1_delay[l_3-1]*k_3;
		dk_delay<=dk-d1_k;
		p=p+dk_delay;
		//p_1<=p;
		p_m2<=m2_3*p;
		q<=q+p_m2;
		//q_1<=q;
		p_m1<=p*m1_3;
		s<=s+q+p_m1;
		//s1<=s; 
		output_data<=s1>>>4;
		end
end
endmodule

