//	v_16_filter_Kukotenko_Valeria
//    dk(n)=exp(n)-exp(n-k)
//	d1(n)=exp(n)-exp(n-1)
//	p(n)=p(n-1)+dk(n)-k*d1(n-l)
//	q(n)=q(n-1)+m2*p(n)
//	s(n)=s(n-1)+q(n)+m1*p(n)

import package_settings::*;
import v16_parameters::*;
 
module v16_filter
(
input wire clk,
input wire reset, //массив 0 сбрасывает всё
input wire [SIZE_ADC_DATA-1:0] input_data,
//выходные данные
output [SIZE_FILTER_DATA-1:0] output_data
);

//регистры для хранения выходных аргументов 
reg [numDataa:0][SIZE_ADC_DATA:0] memory;
//reg [(SIZE_ADC_DATA - 1)*4:0] signal_delay; //[k:0];
reg [(SIZE_ADC_DATA-1)*4:0] dk;

reg [(SIZE_ADC_DATA-1)*4:0] d1;
//reg [(SIZE_ADC_DATA - 1)*4:0] d1_delay;

//reg [(SIZE_ADC_DATA - 1)*4:0] k_d1;
//reg [(SIZE_ADC_DATA - 1)*4:0] dk_k_d1;
//reg [(SIZE_ADC_DATA - 1)*4:0] dk_delay;

reg [(SIZE_ADC_DATA-1)*4:0] p;
//reg [(SIZE_ADC_DATA - 1)*4:0] m1_p;
//reg [(SIZE_ADC_DATA - 1)*4:0] m2_p;

reg [(SIZE_ADC_DATA-1)*4:0]q;
//reg [(SIZE_ADC_DATA - 1)*4:0]q_delay;
//reg [(SIZE_ADC_DATA - 1)*4:0]q_m1_p;

reg [(SIZE_ADC_DATA-1)*4:0]s;
//когда приходит положительный фронт, тогда в новую ячейку
//памяти(регистр) записываются данные в какой-то момент времени
always @(posedge clk or negedge reset)
begin 
	if (!reset)
	begin 
	for (int i=0;i<numDataa;i++)
		memory[i] <=0;
		
	dk<=0;
//	d1_delay<= 0;
	d1<= 0;
//	dk_k_d1<= 0;
//	dk_delay<= 0;
	p<= 0;
			
//	m1_p<= 0;
//	m2_p<= 0;
//	q_delay<= 0;
	q<= 0;
//	q_m1_p<= 0;
	s<= 0;
	output_data<= 0;
	end
	
	else
	begin
		signal_delay[0]<= input_data;
		for (int i=1;i<numDataa;i++)
		signal_delay[i]<= signal_delay[i-1];
		//dk[i]<=dk[i-1]; //смещение на 1, что бы при каждом новом обращении
							//запись происходила в новую ячейку памяти
		//p[1]<=p[0];
		//s[1]<=s[0];
		dk<= signal_delay[0] - signal_delay[k_16];
		d1<= signal_delay[0] - signal_delay[1_16];
		d1_delay [0]<= d1;
		for (int i = 1; i <= l_16-1; i++)
		d1_delay[i]	<= d1_delay[i-1];
		
		k_d1<= k_16 * d1_delay[l_16-1];
		dk_delay<= dk;
		dk_k_d1<= dk_delay - k_d1;
		p<= p + dk_k_d1;
		m2_p<= m2 * p;
		q<= q + m2_p;
		m1_p<= m1 * p;
		q_delay<= q;
		q_m1_p<= q_delay + m1_p;
		s<= s + q_m1_p ;
		output_data<= s >>> 8;
	end
	end
	endmodule 