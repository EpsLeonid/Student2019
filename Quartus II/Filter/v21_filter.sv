module v21_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
import package_settings::*;
import v21_filter_parameters::*;
	
  bit  [v21_Size:0]  data [v21_array-1:0];
  bit  [v21_Size:0]  d;
  bit  [v21_Size:0]  d_1;
  bit  [v21_Size:0]  d_2;
  bit  [v21_Size:0]  p;
  bit  [v21_Size:0]  p_1;
  bit  [v21_Size:0]  mult;
  bit  [v21_Size:0]  r;
  bit  [v21_Size:0]  s;
	
	always @ (posedge clk or posedge !reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		p  <= 0;
		p_1<= 0;
		mult <= 0;
		r  <= 0;
		s  <= 0;
		for (int i=1;i<v21_array;i++)
			begin
				data[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data[0] <= input_data;
		for (int i=1;i<v21_array;i++)
			begin
				data[i] <= data[i-1];
			end		
		d_1 <= data[0] - data[v21_k-1];
		d_2<= data[v21_l-1] - data[v21_k+v21_l-1];
		d <= d_1 - d_2; 
		p  <= p + d;
		mult  <= v21_M*d;
	    p_1 <= p;
		r <= p_1 + mult;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule
