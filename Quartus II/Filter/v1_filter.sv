// Glushak Anastasia
// Variant 1

import package_settings::*;
import v1_parameters::*;

//d(n)=(v(n)-v(n-k))-(v(n-l))+v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n),n>=0
//M=1/(exp(Tclk/t)-1)

//parameter SIZE_ADC_DATA                                  = 14;
//parameter SIZE_FILTER_DATA                               = 16;

/* parameter	K = 8;
	parameter	L = 5;
	parameter	M = 16;
	parameter	N = 13*/
module v1_filter
(
//Input and output signals
	input	clk,
	input	reset,
	input   [SIZE_ADC_DATA-1 : 0]	input_data,
	output	[SIZE_FILTER_DATA : 0]	output_data
);

//Parameters
reg	[SIZE_ADC_DATA-1 : 0] data_delay [N-1 : 0];
reg	[SIZE_ADC_DATA-1 : 0] d;
reg	[SIZE_ADC_DATA-1 : 0] p [1:0];
reg	[SIZE_ADC_DATA-1+4 : 0] r;
reg	[SIZE_ADC_DATA-1+4 : 0] s[1:0];

//First elements of the array
always @( posedge clk or posedge !reset)
begin
	if(!reset)
	begin
		for(int i=0; i<N ; i++)
			data_delay[i] <= 0;

		p[1] <= 0;

		s[1] <= 0;
		
	end
	else
	begin
		for(int i=1; i<N ; i++)
			data_delay[i] <= data_delay[i-1];
		data_delay[0] <= input_data;
		
		p[1]<=p[0];
		s[1]<=s[0];
		
	end
	
end

//Output parameters
assign d = !reset ? 0 : data_delay[0] - data_delay[K] - data_delay[L] + data_delay[K+L];
assign p[0] = !reset ? 0 : p[1] + d;
assign r = !reset ? 0 : p[0] + M*d;
assign s[0] = !reset ? 0 : s[1]+r;

assign output_data = s[0];

endmodule
