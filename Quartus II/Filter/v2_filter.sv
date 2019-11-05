// Glushak Anastasia
// Variant 2

import package_settings::*;
import v2_parameters::*;

/* parameter	K_2 = 5;
	parameter	L_2 = 5;
	parameter	M_2 = 16;
	parameter	N_2 = 10*/

module v2_filter
(
  //Input signals
  input wire                                              reset,
  input wire                                              clk,
  input wire [SIZE_ADC_DATA-1:0]                          input_data,
  //Output signal
  output reg signed [SIZE_FILTER_DATA-1:0]                output_data);

//Parameters
  reg  [SIZE_ADC_DATA+6:0]                          data_delay [N_2 :0];
  reg  [SIZE_ADC_DATA+6:0]                          d;
  reg  [SIZE_ADC_DATA+6:0]                          d1;
  reg  [SIZE_ADC_DATA+6:0]                          d2;
  reg  [SIZE_ADC_DATA+6:0]                          p;
  reg  [SIZE_ADC_DATA+6:0]                          p_1;
  reg  [SIZE_ADC_DATA+6:0]                          Md;
  reg  [SIZE_ADC_DATA+6:0]                          r;
  reg  [SIZE_ADC_DATA+6:0]                          s;
 
//First elements of the array
always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		d1 <= 0;
		d2 <= 0;
		p  <= 0;
		p_1<= 0;
		Md <= 0;
		r  <= 0;
		s  <= 0;
		for (integer i = 0; i<=N_2 ; i++)
			begin
				data_delay[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data_delay[0] <= input_data;
		for (integer i = 1; i<=N_2 ; i++)
			begin
				data_delay[i] <= data_delay[i-1];
			end
//Output parameters
		d <= data_delay[0] - data_delay[K_2];
		d1<= data_delay[L_2] - data_delay[K_2 + L_2];
		d2 <= d - d1; 
		p  <= p + d2;
		Md  <= M_2  * d2;
	    p_1 <= p;
		r <= p_1 + Md;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 