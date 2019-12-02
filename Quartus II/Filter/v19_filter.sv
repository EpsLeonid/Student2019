//Iiaeoeoe?iaaiiue cusp-like oeeuo? n ia?aiao?aie l = 5, k = 11, m1 = 16, m2 = 1

//Oi?ioeu aey ?an?aoa:

//dk(n)=(v(n)-v(n-k)
//dl(n)=(v(n)-v(n-1)
//p(n)=p(n-1)+dk(n)-kdl(n-l), n>=0
//q(n)=q(n-1)+m2p(n), n>=0
//s(n)=s(n-1)+q(n)+m1p(n), n>=0
//M = m1/m2

module v19_filter(
//Aoiaiua ia?aiao?u:
input wire clk,
input wire reset,
input wire  [SIZE_ADC_DATA : 0]	input_data,

//Auoiaiua ia?aiao?u:
output reg  [SIZE_FILTER_DATA : 0]	output_data

);

//Ia?aiao?u cusp-like oeeuo?a
import package_settings::*;
import v19_parameters::*;

//?aaeno?u o?aiaiey aaiiuo
reg[k_19:0][SIZE_ADC_DATA:0] Save_Data;
reg[SIZE19:0] dl;
reg[SIZE19:0] dk;
reg[SIZE19:0] q;
reg[SIZE19:0] q_1;
reg[SIZE19:0] p;
reg[SIZE19:0] p_1;
reg[SIZE19:0] s;
reg[SIZE19:0] dl_k;
reg[SIZE19:0] p_m2;
reg[SIZE19:0] p_m2_1;
reg[SIZE19:0] p_m2_2;
reg[SIZE19:0] p_m2_3;
reg[SIZE19:0] p_m1_1;
reg[SIZE19:0] p_m1;
reg[SIZE19:0] s1;



			
always @ (posedge clk or negedge reset) 
begin
		if (!reset) 
	
	begin
//Caaaiea ia?auo yeaiaioia ianneaia
		for (int i = 1; i <= k_19; i++)	
			begin		
			Save_Data[i] <= 0;
			end
						
	dk<=0;
	dl<=0;
	q<=0;
	p<=0;
	s<=0;
	p_m2<=0;
	p_m1<=0;
	p_m2_1<=0;
	p_m1_1<=0;
	p_m2_2<=0;
	p_m2_3<=0;
	p_1<=0;
	q_1<=0;
	output_data<=0;
	end
	
	else
	begin
		
	for(int i=1;i<k_19; i++)
		begin
			Save_Data[i+1]<=Save_Data[i];
		end
		
		Save_Data[0]<=input_data;
		
		dk<=Save_Data[0]-Save_Data[k_19];
		dl<=Save_Data[l_19]- Save_Data[l_19+1];
			
		dl_k<=dl*k_19;
		p=p[1]+dk-dl_k;
		p_1<=p;
		
		p_m2<=m2_19*p_1;
		p_m2_1<=p_m2;
		p_m2_2<=p_m2_1;
		p_m2_3<=p_m2_2;
		
		q<=q[1]+p_m2_3;
		q_1<=q;
		
		p_m1<=p_1*m1_19;
		//p_m1_1<=p_m1;
		
		s<=s[1]+q_1+p_m1;
		s1<=s; //caaa??ea
		output_data<=s1>>>4;
		end
end
endmodule

