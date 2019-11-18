import package_settings::*;
import v12_filter_parameters::*;

module v12_filter
(
//Aoiaiua aaiiua:
  input                         reset,
  input                         clk,
  input  [SIZE_ADC_DATA-1:0]    input_data,
//Auoiaiua aaiiua:
  output [SIZE_FILTER_DATA-1:0] output_data);

//Ia?aiao?u aey ?an?aoa o?aiaoeaaeuiiai oeeuo?a
  reg  [SIZE_ADC_DATA+6:0]  data [N_11 :0];
  reg  [SIZE_ADC_DATA+6:0]  d;
  reg  [SIZE_ADC_DATA+6:0]  d1;
  reg  [SIZE_ADC_DATA+6:0]  d2;
  reg  [SIZE_ADC_DATA+6:0]  p;
  reg  [SIZE_ADC_DATA+6:0]  p1;
  reg  [SIZE_ADC_DATA+6:0]  mult_Md;
  reg  [SIZE_ADC_DATA+6:0]  r;
  reg  [SIZE_ADC_DATA+6:0]  s;
 
//Caaaiea ia?auo yeaiaioia ianneaia
always @ (posedge clk or posedge !reset)
	begin
		if (!reset)
		begin
		d  <= 0;
		d1 <= 0;
		d2 <= 0;
		p  <= 0;
		p1<= 0;
		mult_Md <= 0;
		r  <= 0;
		s  <= 0;
		for (integer i = 0; i<=10 ; i++)
			begin
				data[i] <= 0;
			end
		output_data <= 0;
		end
		
		else
		begin
		data[0] <= input_data;
		for (integer i = 1; i<=10 ; i++)
			begin
				data[i] <= data[i-1];
			end
//Auaia d(n), p(n), r(n), s(n)
		d1 <= data[0] - data[k_12];
		d2<= data[l_12] - data[k_12 + l_12];
		d <= d1 - d2; 
		p  <= p + d;
		mult_Md  <= m_12*d;
	    p1 <= p;
		r <= p1 + mult_Md;
		s <= s + r;
		output_data <= s >>> 4; 
		end  
	end 
endmodule 