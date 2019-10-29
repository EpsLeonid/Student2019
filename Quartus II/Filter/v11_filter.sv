import package_settings::*;
import v11_filter_parameters::*;

//Формулы для расчета:
//d(n)=(v(n)-v(n-k))-(v(n-l))+v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n),n>=0
// M = 1/(exp(Tclk/tau) - 1)

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
reg	[SIZE_ADC_DATA-1 : 0] data [N-1:0];
reg	[SIZE_ADC_DATA-1 : 0] d;
reg	[SIZE_ADC_DATA-1 : 0] p [1:0];
reg	[SIZE_ADC_DATA-1+4 : 0] r;
reg	[SIZE_ADC_DATA-1+4 : 0] s[1:0];

//Задание первых элементов массивов
always @( posedge clk or posedge !reset)
begin 
	if(!reset) 
	begin
		for(int i=0; i<N; i++)
			data[i] <= 0;
			p[1] <= 0;
			s[1] <= 0;		
	end
	else
	begin
		for(int i=1; i<N ; i++)
			data[i] <= data[i-1];
			data[0] <= input_data;		
			p[1]<=p[0];
			s[1]<=s[0];	
			
	end
	
end

//Вывод d(n), p(n), r(n), s(n)
assign d = reset ? data[0] - data[k-1] - data[l-1] + data[k+l-1] : 0; //var1?var2:var3; если var1 верно, то выполняется var2, иначе - var3
assign p[0] = reset ? p[10] + d : 0;
assign r = reset ? p[0] + M*d : 0;
assign s[0] = reset ? s[1]+r : 0;

assign output_data = s[0];

endmodule

