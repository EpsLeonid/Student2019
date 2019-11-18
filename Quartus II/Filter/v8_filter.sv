import package_settings::SIZE_ADC_DATA;
import package_settings::SIZE_FILTER_DATA;
import v8_parameters::k;
import v8_parameters::l;
import v8_parameters::M;


module v8_filter
(
	input wire clk,
	input wire signed [SIZE_ADC_DATA-1:0] input_bus,
	output reg signed [SIZE_FILTER_DATA-1:0] output_bus
);
	reg signed [SIZE_ADC_DATA+5:0] M_x_d;
	reg signed [SIZE_ADC_DATA+1:0] d;
	reg signed [SIZE_ADC_DATA-1:0] v [k+l:0];
	reg signed [SIZE_ADC_DATA+7:0] s;
	reg signed [SIZE_ADC_DATA+2:0] p;
	reg signed [SIZE_ADC_DATA+6:0] r;
	
	
always @(posedge clk)
	begin
	v[0] <= input_bus;
	for (integer i = 1; i<=(k+l) ; i++)
		v[i] <= v[i-1];
	d <= v[0] - v[k] - v[l] + v[k+l];
	p <= p + d;
	M_x_d <= M*d;
	r <= p + M_x_d;
	s <= s + r;
	output_bus <= s >>> 5;
	end
endmodule
