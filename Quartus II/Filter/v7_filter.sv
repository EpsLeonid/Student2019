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
output wire [SIZE_FILTER_DATA-1:0] output_data
);

//Registers
reg [S_7:0] DATA [N_7:0];
reg [S_7:0] DATA_ADDIT_1;
reg [S_7:0] DATA_ADDIT_2;
reg [S_7:0] DATA_d;
reg [S_7:0] DATA_p;
reg [S_7:0] DATA_p_ADDIT;
reg [S_7:0] DATA_r;
reg [S_7:0] DATA_s;
reg [S_7:0] DATA_s_ADDIT;

//Filter
always @(posedge clk or posedge !reset) begin
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
		for (int i = 0; i < N_7; i++)
			DATA[i] <= 0;
	end
	else
	begin
		DATA[0] <= input_data; //Start of filter code
		for (int i = 1; i < N_7; i++) begin
			DATA[i] <= DATA[i-1];
		end
		DATA_ADDIT_1 <= DATA[0] - DATA[k_7];
		DATA_ADDIT_2 <= DATA[l_7] - DATA[k_7+l_7];
		DATA_d <= DATA_ADDIT_1 - DATA_ADDIT_2;
		DATA_p <= DATA_p + DATA_d;
		DATA_s_ADDIT <= M_7 * DATA_d;
		DATA_p_ADDIT <= DATA_p;
		DATA_r <= DATA_p_ADDIT + DATA_s_ADDIT;
		DATA_s <= DATA_s + DATA_r;
		output_data <= DATA_s >>> 4;
	end
	end
endmodule