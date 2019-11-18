import package_settings::*;
import v9_parameters::*;

module v9_filter
(
input [SIZE_ADC_DATA:0] input_data,
input clk,
input reset,
output [SIZE_FILTER_DATA:0] output_data
);

reg[memSize:0][SIZE_ADC_DATA:0] memory;

reg[20:0] dk;
reg[20:0] dl;
reg[20:0] p0MultM1;
reg[20:0] delay1;
reg[20:0] delay2;
reg[20:0] delay3;
reg[20:0] dlMultK;
reg[20:0] pMultM2;
reg[20:0] pMultM1;
reg[20:0] q;
reg[20:0] p;
reg[20:0] s;

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		for(int i = 0; i < memSize; i++)
			memory[i] <= 0;
		
		dk <= 0;
		dl <= 0;
		q <= 0;
		//q[1] <= 0;
		p <= 0;
		//p[1] <= 0;
		s <= 0;
		//s[1] <= 0;
		output_data <= 0;
	end
	else
	begin
		for(int i = 1; i < memSize; i++)
			memory[i + 1] <= memory[i];
		memory[0] <= input_data;
		
		dk <= memory[0] - memory[memSize];
		dl <= memory[L] - memory[L - 1];
		
		dlMultK <= dl * K;
		p = p + dk - dlMultK;
		pMultM2 <= M2 * p;
		q = q + pMultM2;
		pMultM1 <= p * M1;
		s = s + q + pMultM1;
		delay1 <= s;
		delay2 <= delay1;
		delay3 <= delay2;
		output_data <= delay3>>>4;
		
	end
end
endmodule
