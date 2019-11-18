import package_settings::*;
import v12_filter_parameters::*;

module v12_filter
(

  input                         reset,
  input                         clk,
  input  [SIZE_ADC_DATA-1:0]    input_data,

  output [SIZE_FILTER_DATA-1:0] output_data);


  reg  [size:0]  data [N_11 :0];
  reg  [size:0]  d;
  reg  [size:0]  d_1;
  reg  [size:0]  d_2;
  reg  [size:0]  p;
  reg  [size:0]  p_1;
  reg  [size:0]  mult;
  reg  [size:0]  r;
  reg  [size:0]  s;
 

always @ (posedge clk or posedge !reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		d_1 <= 0;
		d_2 <= 0;
		p  <= 0;
		p_1<= 0;
		mult <= 0;
		r  <= 0;
		s  <= 0;
		for (integer i = 0; i<=numSliceData ; i++)
			begin
				data[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data[0] <= input_data;
		for (integer i = 1; i<=numSliceData ; i++)
			begin
				data[i] <= data[i-1];
			end

		d_1 <= data[0] - data[k_12];
		d_2<= data[l_12] - data[k_12 + l_12];
		d <= d_1 - d_2; 
		p  <= p + d;
		mult  <= m_12*d;
	    p_1 <= p;
		r <= p_1 + mult;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 