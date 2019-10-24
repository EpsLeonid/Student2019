import SysVerParam :: P;//n2.5 - parameter for 8bit
module SysVer
(
//----------input----------------------------------------------------------
//n2.2 - *
input wire a,
input wire b,
//n2.3 - D trigger
input wire D,
input wire C,// - Clock for all calc
//n2.4 -  8-bit register
input wire [P-1:0] A1,
input wire [P-1:0] B1,
input wire [P-1:0] C1,
//----------output---------------------------------------------------------
//n2.2
output wire c,
//n1.3
output reg Q,
//n2.4
output reg [P*2-1:0] DATA_OUT
);

reg [P-1:0] rA1;
reg [P-1:0] rB1; 
reg [P-1:0] rC1;
reg [2*P-1:0] rDATA_OUT;//pre out register

//----------calc-----------------------------------------------------------
//n2.2
assign c=a*b;
//n2.3
always @(posedge C)
begin
Q <= D;
end
//n2.4
always @(posedge C)
begin				// add input data to registers --------------
	rA1<=A1;
	rB1<=B1;
	rC1<=C1;
	rDATA_OUT <= rB1*rA1+rC1;// *&+ ----------------------------
	DATA_OUT <= rDATA_OUT;// = ----------------------------
end

endmodule