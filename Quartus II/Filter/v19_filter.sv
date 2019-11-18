import package_settings::*;
import v19_filter_parameters::*;


module v19_filter
(
	//input data
	input wire clk,
	input wire reset,
	input wire [SIZE_ADC_DATA - 1 : 0] input_data,
	//output data
	output wire	[SIZE_FILTER_DATA-1 : 0] output_data
);
//parameters
reg	[MSize_19-1 : 0] data [N_19-1:0];
reg	[MSize_19-1 : 0] d;
reg	[MSize_19-1 : 0] d1;
reg	[MSize_19-1 : 0] d2;
reg	[MSize_19-1 : 0] p;
reg	[MSize_19-1 : 0] p1;
reg	[MSize_19-1 : 0] r;
reg	[MSize_19-1 : 0] s;
reg	[MSize_19-1 : 0] Md;

always_ff @( posedge clk or posedge !reset)
begin 
	if(!reset)//reset 
	begin
		for(int i=0; i<N_19 ; i++)
		begin
				data[i] <= 0;
		end
		d<=0;	d1<=0;	d2<=0;	p<=0;	p1<=0;	r<=0;	s<=0;	Md<=0;	output_data <= 0;
	end
	
	else//calc
	begin
		data[0] <= input_data;	
		for(int i=1; i<N_19; i++)
			begin
			data[i] <= data[i-1];
			end
			d1<=data[0]-data[k_19];
		d2<=data[l_19]-data[k_19 + l_19];
		d<=d1-d2; 
		p<=p+d;
	    Md<=M_19*d;
	    p1<=p;
		r<=p1+Md;
		s<=s+r;
		output_data<=s[MSize_19-1:4];
	end 					
end
endmodule 	
	
	