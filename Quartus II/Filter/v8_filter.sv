//Copyright (c) 2019 PAVEL Lanshakov FA-91M
// This work may not be opened, read, deleted, used as TP, uploaded, executed, copy-pasted, or
// distributed in any way, in any medium, whether in whole or in part, without
// prior written permission from PAVEL Lanshakov FA-91M.

import package_settings::SIZE_ADC_DATA;
import package_settings::SIZE_FILTER_DATA;
import v8_parameters::k;
import v8_parameters::l;
import v8_parameters::M;


module v8_filter
(
	input wire                                 clk,
	input wire 	                               reset,
	input wire  	[SIZE_ADC_DATA - 1 : 0]    input_data,
	output wire		[SIZE_FILTER_DATA-1 : 0]   output_data
);
reg	[SIZE_ADC_DATA+6 : 0] v [k+l:0];
reg	[SIZE_ADC_DATA+6 : 0] d;
reg	[SIZE_ADC_DATA+6 : 0] d1;
reg	[SIZE_ADC_DATA+6 : 0] d2;
reg	[SIZE_ADC_DATA+6 : 0] p;
reg	[SIZE_ADC_DATA+6 : 0] p1;
reg	[SIZE_ADC_DATA+6 : 0] r;
reg	[SIZE_ADC_DATA+6 : 0] s;
reg	[SIZE_ADC_DATA+6 : 0] M_x_d;

always @( posedge clk or posedge !reset)
begin 
	if(!reset)
	begin
		for(int i=0; i <= k+l ; i++)
		begin
				v[i] <= 0;
		end
		d <= 0;	
		d1 <= 0;	
		d2 <= 0;	
		p <= 0;	
		p1 <= 0;	
		r <= 0;	
		s <= 0;	
		M_x_d <= 0;	
		output_data <= 0;
	end
	
	else
	begin
		v[0] <= input_data;	
		for(int i=1; i <= k+l; i++)
				v[i] <= v[i-1];
		d1 <= v[0] - v[k];
		d2 <= v[l] - v[k+l];
		d <= d1 - d2; 
		p <= p + d;
	    M_x_d <= M * d;
	    p1 <= p;
		r <= p1 + M_x_d;
		s <= s + r;
		output_data <= s >>> 4;
	end 					
end
endmodule 	