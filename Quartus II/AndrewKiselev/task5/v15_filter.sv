import package_settings::*;
import v15_filter_parameters::*;

module v15_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
	logic [dataSize-1:0]d;
	logic [dataSize-1:0]p[1:0];
	logic [dataSize-1:0]r;
	logic [dataSize-1:0]s[1:0];
	logic [SIZE_ADC_DATA-1:0]data[bufferSize-1:0];
	always @(posedge clk) begin
		if(!reset) begin
			for(int i=0; i<bufferSize ; i++)
				data[i] <= 0;

			p[1] <= 0;

			s[1] <= 0;
		end
		else begin
			for (int i=1;i<bufferSize;i++)
				data[i]<=data[i-1];
			data[0]<=input_data;
			s[1]<=s[0];
			p[1]<=p[0];
			output_data<=s[0][dataSize-1:dataSize-SIZE_ADC_DATA];
			d<=data[0]-data[l]-data[k]+data[k+l];
			p[0]<=p[1]+d;
			r<=M*d+p[0];
			s[0]=s[1]+r;
			output_data	<= s[0][dataSize-1:4];
		end
	end
endmodule
