
module v15_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
	import package_settings::*;
	import v15_filter_parameters::*;

	reg [v15_dataSize-1:0]d;
	reg [v15_dataSize-1:0]d_1;
	reg [v15_dataSize-1:0]d_2;
	reg [v15_dataSize-1:0]p;
	reg [v15_dataSize-1:0]p_1;
	reg [v15_dataSize-1:0]r;
	reg [v15_dataSize-1:0]s;
	reg [v15_dataSize-1:0]mult;
	reg [SIZE_ADC_DATA-1:0]data[v15_bufferSize-1:0];
	always @(posedge clk) begin
		if(!reset) begin
			p <=0;
			s <= 0;
			d <=0;
			r<=0;
			d_1 <=0;
			d_2 <=0;
			p_1 <=0;
			mult<=0;
			output_data <=0;
			for (integer i = 0; i<=v15_bufferSize; i++)
			begin
				data[i] <= 0;
			end
		end
		else begin
			data[0] <= input_data;
			for (integer i=1;i<v15_bufferSize;i++)
				begin
					data[i]<=data[i-1];
				end
			d_1<=data[0]-data[v15_l];
			d_2<=data[v15_k]-data[v15_k+v15_l];
			d<=d_1-d_2;
			p<=p+d;
			mult<=v15_M*d;
			p_1<=p;
			r<=p_1+mult;
			s<=s+r;
			output_data	<=s>>>4;
		end
	end
endmodule
