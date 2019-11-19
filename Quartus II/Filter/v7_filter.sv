//Lamonov Igor Variant 7

//Input parameters
import package_settings::*; //SIZE_ADC_DATA = 14, SIZE_FILTER_DATA = 16
import v7_filter_parameters::*;


module v7_filter(
	
//Input signals
input wire [SIZE_ADC_DATA-1:0] input_data,
input wire reset,
input wire clk,

//Output signals
output reg signed [SIZE_FILTER_DATA-1:0] output_data
);

//Registers
reg [SIZE_ADC_DATA+6:0] DATA [(k+l):0];
reg [SIZE_ADC_DATA+6:0] DATA_ADDIT_1;
reg [SIZE_ADC_DATA+6:0] DATA_ADDIT_2;
reg [SIZE_ADC_DATA+6:0] DATA_d;
reg [SIZE_ADC_DATA+6:0] DATA_p;
reg [SIZE_ADC_DATA+6:0] DATA_p_ADDIT;
reg [SIZE_ADC_DATA+6:0] DATA_r;
reg [SIZE_ADC_DATA+6:0] DATA_s;
reg [SIZE_ADC_DATA+6:0] DATA_s_ADDIT;

//Filter
always @(posedge clk or negedge reset) begin
	if (!reset) begin //Zeroing
		DATA_ADDIT_1 <= 0;
		DATA_ADDIT_2 <= 0;
		DATA_d <= 0;
		DATA_p <= 0;
		DATA_p_ADDIT <= 0;
		DATA_r <= 0;
		DATA_s <= 0;
		DATA_s_ADDIT <= 0;
		output_data <= 0;
		for (int i = 0; i <= (k+l); i++)
			DATA[i] <= 0;
	end
	DATA[0] <= input_data; //Start of filter code
	for (int i = 1; i <= (k+l); i++) begin
		DATA[i] <= DATA[i-1];
	end
	DATA_ADDIT_1 <= DATA[0] - DATA[k];
	DATA_ADDIT_2 <= DATA_ADDIT_1 - DATA[l];
	DATA_d <= DATA_ADDIT_2 + DATA[k+l];
	DATA_p <= DATA_p_ADDIT + DATA_d;
	DATA_p_ADDIT <= DATA_p;
	DATA_r <= DATA_p + M * DATA_d;
	DATA_s <= DATA_s_ADDIT + DATA_r;
	DATA_s_ADDIT <= DATA_s;
	output_data <= DATA_s >>> 7;
end
	
endmodule