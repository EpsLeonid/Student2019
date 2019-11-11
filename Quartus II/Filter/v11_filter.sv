import package_settings::*;
import v11_filter_parameters::*;

//Формулы для расчета:
//d(n)=(v(n)-v(n-k))-(v(n-l))+v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n), n>=0
//M = 1/(exp(Tclk/tau) - 1)


module v11_filter
(
//Входные данные:
  input                         reset,
  input                         clk,
  input  [SIZE_ADC_DATA-1:0]    input_data,
//Выходные данные:
  output [SIZE_FILTER_DATA-1:0] output_data);

//Параметры для расчета трапецидального фильтра
  reg  [SIZE_ADC_DATA+6:0]  data [N_11 :0];
  reg  [SIZE_ADC_DATA+6:0]  d;
  reg  [SIZE_ADC_DATA+6:0]  d1;
  reg  [SIZE_ADC_DATA+6:0]  d2;
  reg  [SIZE_ADC_DATA+6:0]  p;
  reg  [SIZE_ADC_DATA+6:0]  p1;
  reg  [SIZE_ADC_DATA+6:0]  mult_Md;
  reg  [SIZE_ADC_DATA+6:0]  r;
  reg  [SIZE_ADC_DATA+6:0]  s;
 
//Задание первых элементов массивов
always @ (posedge clk or posedge !reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		d1 <= 0;
		d2 <= 0;
		p  <= 0;
		p1<= 0;
		mult_Md <= 0;
		r  <= 0;
		s  <= 0;
		for (integer i = 0; i<=N_11 ; i++)
			begin
				data[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data[0] <= input_data;
		for (integer i = 1; i<=N_11 ; i++)
			begin
				data[i] <= data[i-1];
			end
//Вывод d(n), p(n), r(n), s(n)
		d1 <= data[0] - data[k_11];
		d2<= data[l_11] - data[k_11+ l_11];
		d <= d1 - d2; 
		p  <= p + d;
		mult_Md  <= M_11  * d;
	    p1 <= p;
		r <= p1 + mult_Md;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 
