import package_settings::SIZE_ADC_DATA;
import package_settings::SIZE_FILTER_DATA;
import v14_parameters::K_14;
import v14_parameters::L_14;
import v14_parameters::M_14;

module v14_filter
( 
// Входные данные
input wire clk,
input wire signed [SIZE_ADC_DATA-1:0] input_data,
// Выходные данные
output reg signed [SIZE_FILTER_DATA-1:0] output_data
);
// Параметры для расчета фильтра
reg signed [SIZE_ADC_DATA+2:0] P;
reg signed [SIZE_ADC_DATA+5:0] Md;
reg signed [SIZE_ADC_DATA+7:0] S;
reg signed [SIZE_ADC_DATA+6:0] R;
reg signed [SIZE_ADC_DATA-1:0] V [K_14+L_14:0];
reg signed [SIZE_ADC_DATA+1:0] D;
// Задаем первые элементы массивов 
always @(negedge clk)
 begin
 V[0] <= input_data;
 for(integer I = 1; i<=(K_14+L_14) ; i++)
   V[i] <= V[I-1];
D <= V[0] - V[K_14] - V[L_14] + V[K_14+L_14];
P <= P + D;
Md <= M_14*D;
R <= P + Md;
S <= S + R;
output_data <= S >>> 4;
end
endmodule

