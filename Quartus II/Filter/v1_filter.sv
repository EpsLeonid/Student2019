// Glushak Anastasia
// Variant 1

import package_settings::*;
import v1_parameters::*;

module v1_filter( 
  input wire 							reset,
  input wire 							clk,
  input wire [SIZE_ADC_DATA-1:0]	    input_data,
  output wire [SIZE_FILTER_DATA-1:0]	output_data);

//parameter SIZE_ADC_DATA                                  = 14;
//parameter SIZE_FILTER_DATA                               = 16;

//N_1=13
//L_1=5
//K_1=8
//M_1=16
reg signed [SIZE_ADC_DATA+6:0] signal_delay [N_1:0];
reg signed [SIZE_ADC_DATA+6:0] d1;
reg signed [SIZE_ADC_DATA+6:0] d11;
reg signed [SIZE_ADC_DATA+6:0] d12;
reg signed [SIZE_ADC_DATA+6:0] p;
reg signed [SIZE_ADC_DATA+6:0] p1;
reg signed [SIZE_ADC_DATA+6:0] M1;
reg signed [SIZE_ADC_DATA+6:0] r;
reg signed [SIZE_ADC_DATA+6:0] s;

//d(n)=(v(n)-v(n-k))-(v(n-1))-v(n-k-l)
//p(n)=p(n-1)+d1(n), n>=0
//r(n)=p(n)+M*d1(n)
//s(n)=s(n-1)+r(n),n>=0
//M=1/(exp(Tclk/t)-1)

always @(posedge clk or posedge !reset)
begin
	if(!reset)
		begin
		d1<=0;
		d11<=0;
		d12<=0;
		p<=0;
		p1<=0;
		M1<=0;
		r<=0;
		s<=0;

		for (integer i=0; i<=N_1; i++)
			begin
			signal_delay[i]<=0;
		end
		output_data <=0;
	end
	
	else
	signal_delay[0]<=input_data;
		for (integer i=0; i<=N_1; i++)
			begin
			signal_delay[i]<=signal_delay[i-1];
		end
	
	d1<=signal_delay[0]-signal_delay[K_1];
	d11<=signal_delay[L_1]-signal_delay[K_1+L_1];
	d12<=d1-d11;
	p<=p+d12;
	p1<=p;
	M1<=M_1*d12;
	r<=p1+M1;
	s<=s+r;
	output_data<=s>>>7;
	
	end
endmodule	
