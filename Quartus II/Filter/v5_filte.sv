import package_settings::*;
import v5_parameters::*;//параметры для фильтра

//d(n)=(v(n)-v(n-k))-(v(n-l))+v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n),n>=0
//M=1/(exp(Tclk/t)-1)

module v5_filter
(
input wire reset,
input wire clk,
input wire [SIZE_ADC_DATA-1:0] input_data,
output reg [SIZE_FILTER_DATA-1:0] output_data);

//Параметры для фильтра
  reg  [SIZE_ADC_DATA+6:0] data_delay [N_5 :0];
  reg  [SIZE_ADC_DATA+6:0] d;
  reg  [SIZE_ADC_DATA+6:0] d1;
  reg  [SIZE_ADC_DATA+6:0] d2;
  reg  [SIZE_ADC_DATA+6:0] p;
  reg  [SIZE_ADC_DATA+6:0] p_1;
  reg  [SIZE_ADC_DATA+6:0] Md;
  reg  [SIZE_ADC_DATA+6:0] r;
  reg  [SIZE_ADC_DATA+6:0] s;
 
//Превые элементы массива для фильтра
always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		d1 <= 0;
		d2 <= 0;
		p  <= 0;
		p_1<= 0;
		Md <= 0;
		r  <= 0;
		s  <= 0;
		for (integer i = 0; i<=N_5 ; i++)
			begin
				data_delay[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data_delay[0] <= input_data;
		for (integer i = 1; i<=N_5 ; i++)
			begin
				data_delay[i] <= data_delay[i-1];
			end
//Выходные параметры
		d <= data_delay[0] - data_delay[K_5];
		d1<= data_delay[L_5] - data_delay[K_5+ L_5];
		d2 <= d - d1; 
		p  <= p + d2;
		Md  <= M_1  * d2;
	    p_1 <= p;
		r <= p_1 + Md;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 