module v20_filter(clk,reset,input_data,output_data);

import v20_filter_param::*;

/*
parameter k = 10;
parameter l = 6;
parameter M = 16;
parameter SIZE_ADC_DATA = 17;
parameter SIZE_REG = 17;
parameter SIZE_FILTER_DATA = 17;
*/

//input data, parametry dlya trapeceidal'nogo fil'tra and output data
input wire 						clk;
input wire  					reset;
input wire [SIZE_ADC_DATA - 1 : 0] input_data;

reg 		[SIZE_REG-1:0]		v [16:0]; // 16=k+l
reg 		[SIZE_REG-1:0]		dkl;
reg 		[SIZE_REG-1:0]		p;
reg 		[SIZE_REG-1:0]		r;
reg 		[SIZE_REG-1:0]		s;

output wire [SIZE_FILTER_DATA-1 : 0] output_data;

always @ (posedge clk or negedge reset)
begin
//sozdanie massivov
	if (!reset)
	  begin
      v[0] <= input_data;
      for (integer i = 0; i < k+l; i++) 
			begin
				v[i] <= 0;
			end
      dkl   <=0;
      p 	<=0;
      r		<=0;
      s		<=0;
      output_data <=0;
      end
	else
      begin
      v[0] <= input_data;
      for (integer i = 1; i<=k+l; i++)
			begin
				 v[i] <=  v[i-1];
			end	
//formuli iz zadania			
	  dkl	<= v[0] -v[k-1] - v[l-1] + v[k+l-1];
	  p <= p + dkl;
      r <= p + dkl*M;
      s <= s + r; 
      output_data <= s >>> 7;
      end
end
endmodule
