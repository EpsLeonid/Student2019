module v6_filter
(
input [SIZE_ADC_DATA:0] input_data,
input clk,
input reset,
output [SIZE_FILTER_DATA:0] output_data
);
import package_settings::*;
import v6_parameters::*;

reg[saveDataSize:0][SIZE_ADC_DATA:0] save_data;

reg[20:0] dk;
reg[20:0] dl;
reg[20:0] q;
reg[20:0] q_1;
reg[20:0] p;
reg[20:0] p_1;
reg[20:0] s;
reg[20:0] dl_k;
reg[20:0] p_m2;
reg[20:0] p_m1;
reg[20:0] offset1;
reg[20:0] offset2;
reg[20:0] offset3;

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		for(int i=0;i<saveDataSize;i++)
			begin
				save_data[i]<= 0;
			end
		
		dk<=0;
		dl<=0;
		q<=0;
		p<=0;
		s<=0;
		p_m2<=0;
		p_m1<=0;
		p_1<=0;
		q_1<=0;
		output_data<=0;
	end
	else
	begin
		for(int i=1;i<saveDataSize; i++)
		begin
			save_data[i+1]<=save_data[i];
		end
		save_data[0]<=input_data;
		
		dk<=save_data[0]-save_data[k_6];
		dl<=save_data[l_6]- save_data[l_6+1];		
		dl_k<=dl*k_6;
		p=p[1]+dk-dl_k;
		p_1<=p;
		p_m2<=m2_6*p_1;
		q<=q[1]+p_m2;
		
		p_m1<=p_1*m1_6;
		s<=s[1]+q+p_m1;
		
		offset1<=s;
		output_data<=offset1>>>4;
		end
end
endmodule
