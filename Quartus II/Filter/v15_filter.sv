
module v15_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
	import package_settings::*;
	import v15_filter_parameters::*;

	reg [v15_dataSize-1:0]d;
	reg [v15_dataSize-1:0]dl;
	reg [v15_dataSize-1:0]dk;
	reg [v15_dataSize-1:0]p[1:0];
	reg [v15_dataSize-1:0]r;
	reg [v15_dataSize-1:0]s[1:0];
	reg [SIZE_ADC_DATA-1:0]data[v15_bufferSize-1:0];
	always @(posedge clk) begin
		if(!reset) begin
			for(int i=0; i<v15_bufferSize ; i++)
				begin
					data[i] <= 0;
				end

			p[1] <= 0;
			p[0] <=0;
			s[1] <= 0;
			s[0] <= 0;
			output_data <=0;
		end
		else begin
			data[0]<=input_data;
			for (int i=1;i<v15_bufferSize;i++)
				begin
					data[i]<=data[i-1];
				end
			s[1]<=s[0];
			p[1]<=p[0];
			dl<=data[0]-data[v15_l-1];
			dk<=dl-data[v15_k-1];
			d<=dk+data[v15_k+v15_l-1];
			p[0]<=p[1]+d;
			r<=v15_M*d+p[0];
			s[0]<=s[1]+r;
			output_data	<=s[0]>>4;
		end
	end
endmodule
