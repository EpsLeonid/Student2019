
module v15_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
	import package_settings::*;
	import v15_filter_parameters::*;

	reg [v15_dataSize-1:0]d;
	reg [v15_dataSize-1:0]dlk;
	reg [v15_dataSize-1:0]p;
	reg [v15_dataSize-1:0]r;
	reg [v15_dataSize-1:0]s;
	reg [v15_dataSize-1:0]mult;
	reg [SIZE_ADC_DATA-1:0]data[v15_bufferSize-1:0];
	always @(posedge clk) begin
		if(!reset) begin
			for(int i=0; i<v15_bufferSize ; i++)
				begin
					data[i] <= 0;
				end
			p <=0;
			s <= 0;
			d <=0;
			r<=0;
			dlk <=0;
			mult<=0;
			output_data <=0;
		end
		else begin
			for (int i=v15_bufferSize-1;i>0;i--)
				begin
					data[i]<=data[i-1];
				end
			data[0]<=input_data;
			dlk<=data[0]-data[v15_l]-data[v15_k];
			d<=dlk+data[v15_k+v15_l];
			p<=p+d;
			mult<=v15_M*d;
			r<=mult+p;
			s<=s+r;
			output_data	<=s>>>4;
		end
	end
endmodule
