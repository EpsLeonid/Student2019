import package_settings::*;
import v13_parameters::*;

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
input wire  [SIZE_ADC_DATA - 1 : 0]	input_data,

//Выходные параметры:
output reg  [SIZE_FILTER_DATA : 0]	output_data

);
//Параметры cusp-like фильтра

	reg	[SIZE-1 : 0] data [N-1:0];
		
	reg [SIZE -1 : 0] dk;
	reg [1:0] [SIZE -1 : 0] dl;	
	reg [1:0] [SIZE -1 : 0] q;
	reg [SIZE-1 : 0] s1;
	reg [1:0][SIZE -1 : 0] s;
	reg [1:0][SIZE -1 : 0] p;
	reg [2:0][SIZE -1 : 0] s2;
	

always @ (posedge clk or negedge reset) begin
		if (!reset) 
	
	begin
//Задание первых элементов массивов
			for (int i = 1; i <= k_13; i++)			
			data[i] <= 0;
			
			p2[1] <= 0;
			s2[1] <= 0;	
			dl_mult_k <= 0;
			m2_mult_p2 <= 0;	
			m1_mult_p2 <= 0;
			dk <= 0;
			dl <= 0;
	end
	
	else
	begin

//Задание остальных элементов 		
			for (int i = 1; i <= k_13; i++)			
			data[i]	<= data[i-1];
			
			for (int i = 1; i <= l_13; i++)			
			dl[i]	<= dl[i-1];
			
			data[0]	<= input_data;			
			p[1] <= p[0];
			s[1] <= s[0];
			q[1] <= q[0];
			
			
			dk <= data [0] - data[k-1];
			dl[0] <= data [0] - data [1];
			
			
			
			p[0] <= p[1]+ dk - k*dl[l_13-1];
			q[0]= q[1]+m2*p[0];
			s[0]= s[1] +q[0]+m1*p[0];
			s2[0] <=s[0];
			s2[1] <=s2[0];
			s2[2] <=s2[1];		
			output_data		<= s2[2][19:4];
	
	end
end
endmodule

	
	