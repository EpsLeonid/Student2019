import package_settings::*;
import v11_filter_parameters::*;

//Формулы для расчета:
//d(n)=(v(n)-v(n-k))-(v(n-l))+v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n), n>=0
//M = 1/(exp(Tclk/tau) - 1)

module v11_filter
#(	parameter	k = 8;
	parameter	l = 5;
	parameter	M = 16;
	parameter   N = 13)
(
//Входные данные:
input clk,
input reset,
input [SIZE_ADC_DATA - 1 : 0]	input_data,
//Выходные данные:
output	[SIZE_FILTER_DATA : 0]	output_data);
//Параметры для расчета трапецидального фильтра
reg	[SIZE_ADC_DATA+6 : 0] data [N-1:0];
reg	[SIZE_ADC_DATA+6 : 0] d;
reg	[SIZE_ADC_DATA+6 : 0] d1;
reg	[SIZE_ADC_DATA+6 : 0] d2;
reg	[SIZE_ADC_DATA+6 : 0] p;
reg	[SIZE_ADC_DATA+6 : 0] r;
reg	[SIZE_ADC_DATA+6 : 0] r1;
reg	[SIZE_ADC_DATA+6 : 0] s;
reg	[SIZE_ADC_DATA+6 : 0] output_s;
reg	[SIZE_ADC_DATA+6 : 0] mult_Md;

//Задание первых элементов массивов
always @( posedge clk or posedge !reset)
begin 
	if(!reset) 
	begin
		for(int i=0; i<N; i++)
			data[i] <= 0;
			p[1] <= 0;
			s[1] <= 0;	
			mult_Md <= 0;	
			d1 <= 0;
			d2 <= 0;
	end
	
	else
	begin
		for(int i=1; i<N ; i++)
			data[i] <= data[i-1];
			data[0] <= input_data;		
			p[1] <= p[0];
			s[1] <= s[0];
			
			//Вывод d(n), p(n), r(n), s(n)
			//d <= data[0] - data[k] - data[l] + data[k+l];
			d1 <= data[0] + data[k+l];
			d2 <= data[k] + data[l];
			d <= d1 - d2;
			p <= p[0] + d;
			mult_Md = M*d;
			r <= p + mult_Md;
			r1 <= r;
			s <= s[0] + r1;
			output_data <= s >>> 4;				
	end
			
end

//Вывод d(n), p(n), r(n), s(n)
/*assign d = reset ? data[0] - data[k] - data[l] + data[k+l] : 0; //var1?var2:var3; если var1 верно, то выполняется var2, иначе - var3
assign p[0] = reset ? p[1] + d : 0;
assign r = reset ? p[0] + M*d : 0;
assign s[0] = reset ? s[1] + r : 0;*/

//assign output_data = output_s;

endmodule

