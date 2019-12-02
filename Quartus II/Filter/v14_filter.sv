import package_settings::*;
import v14_parameters::*;

module v14_filter
(
// Входные данные
input wire reset,
input wire clk,
input wire [SIZE_ADC_DATA-1:0] input_data,
// Выходные данные
output reg [SIZE_FILTER_DATA-1:0] output_data
);

//Параметры для расчета фильтра
  reg  [SIZE_ADC_DATA+6:0] data[N_14 :0];
  reg  [SIZE_ADC_DATA+6:0] d;
  reg  [SIZE_ADC_DATA+6:0] d1;
  reg  [SIZE_ADC_DATA+6:0] d2;
  reg  [SIZE_ADC_DATA+6:0] p;
  reg  [SIZE_ADC_DATA+6:0] p1;
  reg  [SIZE_ADC_DATA+6:0] Md_14;
  reg  [SIZE_ADC_DATA+6:0] r;
  reg  [SIZE_ADC_DATA+6:0] s;
 
//Задаем первые элементы массивов
always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
		d <= 0;
		d1 <= 0;
		d2 <= 0;
		p <= 0;
		p1 <= 0;
		Md_14 <= 0;
		r <= 0;
		s <= 0;
		for (integer i = 0; i <= N_14 ; i++)
			begin
				data[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data[0] <= input_data;
		for (integer i = 1; i <= N_14 ; i++)
			begin
				data[i] <= data[i-1];
			end
// Выходные параметры
		d <= data[0] - data[K_14];
		d1 <= data[L_14] - data[K_14+ L_14];
		d2 <= d - d1; 
		p <= p + d2;
		Md_14 <= M_14 * d2;
	    p1 <= p;
		r <= p1 + Md_14;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 