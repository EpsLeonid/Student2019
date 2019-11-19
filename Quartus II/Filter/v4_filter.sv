import package_settings::SIZE_ADC_DATA;
import package_settings::SIZE_FILTER_DATA;
import v4_parameters::K;
import v4_parameters::L;
import v4_parameters::M;

module v4_filter
( 
input wire clk,
input wire signed [SIZE_ADC_DATA-1:0] input_bus,
output reg signed [SIZE_FILTER_DATA-1:0] output_bus
);
reg signed [SIZE_ADC_DATA+2:0] P;
reg signed [SIZE_ADC_DATA+5:0] Md;
reg signed [SIZE_ADC_DATA+7:0] S;
reg signed [SIZE_ADC_DATA+6:0] R;
reg signed [SIZE_ADC_DATA-1:0] V [K+L:0];
reg signed [SIZE_ADC_DATA+1:0] D;
 
always @(negedge clk)
 begin
 V[0] <= input_bus;
 for(integer I = 1; i<=(K+L) ; i++)
   V[i] <= V[I-1];
D <= V[0] - V[K] - V[L] + V[K+L];
P <= P + D;
Md <= M*D;
R <= P + Md;
S <= S + R;
output_bus <= S >>> 4;
end
endmodule