import package_settings::*;
import v12_filter_parameters::*;

module v12_filter
(
// ������� ������
	input	clk,
	input	reset,
	input	[SIZE_ADC_DATA-1 : 0]	input_data,
// �������� ������
	output	[size-1: 0]	test_data[9:0],
									test_d,
									test_p[1:0],
									test_r,
									test_s[1:0],
	output	[size-1 : 0]	output_data
);

logic	[size-1 : 0] data [9 : 0];
logic	[size-1 : 0] d;
logic	[size-1 : 0] p [1:0];
logic	[size-1 : 0] r;
logic	[1:0][size-1 : 0] s;
always_ff @( posedge clk or posedge !reset)
begin
	if(!reset)
	begin
		for(int i=0; i<numSliceData ; i++)
			data[i] <= 0;

		p[1] <= 0;

		s[1] <= 0;
	end
	else
	begin
		for(int i=1; i<numSliceData ; i++)
			data[i] <= data[i-1];
		data[0] <= input_data;
		
		p[1]<=p[0];
		s[1]<=s[0];
		output_data <= s[0][19:4];


	end//else
end//always_ff

assign d = !reset ? 0 : data[0] - data[k-1] - data[l-1] + data[k+l-1];
assign p[0] = !reset ? 0 : p[1] + d;
assign r = !reset ? 0 : p[0] + m*d;
assign s[0] = !reset ? 0 : s[1]+r;

//assign output_data = s[0][19:4];
genvar i;
generate
for(i=0; i < numSliceData; i++) 
		begin : generate_test
		assign	test_data[i]=data[i];
		end
endgenerate

assign test_d = d;
assign test_p[0] = p[0];
assign test_p[1] = p[1];
assign test_r = r;
assign test_s[0] = s[0];
assign test_s[1] = s[1];
endmodule