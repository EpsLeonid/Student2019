import package_settings::*;
import v9_parameters::*;// параметры для фильтра 

module v9_filter(
//входные данные 
input wire clk,
input wire reset,
input wire  [SIZE_ADC_DATA : 0]	input_data,
//выходные данные 
output reg  [SIZE_FILTER_DATA : 0]	output_data

);


reg[k_9:0][SIZE_ADC_DATA:0] Save_Data;
// параметры для фильтра 
reg[SIZE9:0] dl;
reg[SIZE9:0] dk;
reg[SIZE9:0] q;
reg[SIZE9:0] q_1;
reg[SIZE9:0] p;
reg[SIZE9:0] p_1;
reg[SIZE9:0] s;
reg[SIZE9:0] dl_k;
reg[SIZE9:0] p_m2;
reg[SIZE9:0] p_m2_1;
reg[SIZE9:0] p_m2_2;
reg[SIZE9:0] p_m2_3;
reg[SIZE9:0] p_m1_1;
reg[SIZE9:0] p_m1;
reg[SIZE9:0] s1;



			
always @ (posedge clk or negedge reset) 
// первые элементы массива для фильтра 
begin
		if (!reset) 
	
	begin
		for (int i = 1; i <= k_9; i++)	
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
	
	else //условие для фильтра 
	begin
		
	for(int i=1;i<k_9; i++)
		begin
			Save_Data[i+1]<=Save_Data[i];
		end
		
		Save_Data[0]<=input_data;
		
		dk<=Save_Data[0]-Save_Data[k_9];
		dl<=Save_Data[l_9]- Save_Data[l_9+1];
			
		dl_k<=dl*k_9;
		p=p[1]+dk-dl_k;
		p_1<=p;
		
		p_m2<=m2_9*p_1;
		p_m2_1<=p_m2;
		p_m2_2<=p_m2_1;
		p_m2_3<=p_m2_2;
		
		q<=q[1]+p_m2_3;
		q_1<=q;
		
		p_m1<=p_1*m1_9;
		
		s<=s[1]+q_1+p_m1;
		s1<=s; 
		output_data<=s1>>>4;
		end
end
endmodule