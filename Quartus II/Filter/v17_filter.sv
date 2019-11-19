module v17_filter
(
 input wire clk,
 input wire reset,
 input wire [SIZE_ADC_DATA - 1 : 0] input_data,

 output wire [SIZE_FILTER_DATA-1 : 0] output_data
);

import package_settings::*;
import v17_filter_parameters::*;

//параметры
reg	[SizE : 0] data [N_17:0];
reg	[SizE : 0] d;
reg	[SizE : 0] d1;
reg	[SizE : 0 ] d2;
reg	[SizE : 0 ] p;
reg	[SizE : 0 ] p1;
reg	[SizE : 0 ] r;
reg	[SizE : 0 ] s;
reg	[SizE : 0] Md;

//первые элементы
always @( posedge clk or posedge !reset)
begin 
	if(!reset) 
	begin
			d  <= 0;	
			d1 <= 0;
			d2 <= 0;
			p  <= 0;
			p1 <= 0;
			r  <= 0;
			s  <= 0;
			Md <= 0;
		for(int i=0; i<N_17; i++)
		   begin
			data[i] <= 0;
		   end
		output_data <= 0;
	end	

	else
	begin
	data[0] <= input_data;	
		for(int i=1; i<N_17 ; i++)
			begin
			data[i] <= data[i-1];
			end 
//вывод 
	 	d1 <= data[0] - data[k_17];
		d2<= data[l_17] - data[k_11 + l_17];
		d <= d1 - d2; 
		p  <= p + d;
	    Md  <= M_17*d;
	    p1 <= p;
		r <= p1 + Md;
		s <= s + r;
		output_data <= s[19:4];
		end 					
	end
endmodule
