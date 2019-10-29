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
	output	[SIZE_FILTER_DATA-1 : 0]	output_data
);

//Parameters
reg	unsigned [SIZE_ADC_DATA-1 : 0] data_delay [N-1 : 0];
reg	unsigned [SIZE_ADC_DATA-1 : 0] d;
reg	unsigned [SIZE_ADC_DATA-1 : 0] d1;
reg	unsigned [SIZE_ADC_DATA-1 : 0] d2;
reg	unsigned [SIZE_ADC_DATA-1 : 0] p ;
reg	unsigned [SIZE_ADC_DATA-1 : 0] p_1 ;
reg	unsigned [SIZE_ADC_DATA+8 : 0] Md;
reg	unsigned [SIZE_ADC_DATA+8 : 0] r;
reg	unsigned [SIZE_ADC_DATA+8 : 0] s;

//First elements of the array
always @( posedge clk or posedge !reset)
begin
	if(!reset)
	begin
		for(int i=0; i<N ; i++)
			data_delay[i] <= 0;
		d1<=0; 
		d2<=0; 
		d<=0; 
		p <= 0;
		Md<=0;
		p_1<=0;
		r<=0;
		s <= 0;
		output_data<=0;
		
	end
	else
	begin
		for(int i=1; i<N ; i++)
			data_delay[i] <= data_delay[i-1];
		data_delay[0] <= input_data;
		
		d1 = data_delay[0] - data_delay[K] ;
		d2 = data_delay[L] + data_delay[K+L];
		d=d1-d2;
		p =  p + d;
		Md=M*d;
		p_1=p;
		r =  p_1 + Md;
		s = s+r;
		output_data = s>>>7;
		
	end
	
end

//Output parameters


endmodule
