import package_settings::*;
import v21_filter_parameters::*;

module v21_filter(
	input clk,
	input reset,
	input [SIZE_ADC_DATA-1 : 0]	input_data,
	output [SIZE_FILTER_DATA-1:0] output_data
);
	logic [v21_Size-1:0]d;
	logic [v21_Size-1:0]p[1:0];
	logic [v21_Size-1:0]r;
	logic [v21_Size-1:0]s[1:0];
	logic [SIZE_ADC_DATA-1:0]data[v21_array-1:0];
	always @(posedge clk) begin
		if(!reset) begin
			for(int i=0; i<v21_array ; i++)
				data[i] <= 0;

			p[1] <= 0;

			s[1] <= 0;
		end
		else begin
			for (int i=1;i<v21_array;i++)
				data[i]<=data[i-1];
			data[0]<=input_data;
			s[1]<=s[0];
			p[1]<=p[0];
			d<=data[0]-data[v21_l-1]-data[v21_k-1]+data[v21_k+v21_l-1];
			p[0]<=p[1]+d;
			r<=v21_M*d+p[0];
			s[0]<=s[1]+r;
			s[2] <= s[0];
			output_data	<=s[2][v21_Size-1:v21_Size-SIZE_ADC_DATA];
		end
	end
endmodule



