module proj_1
//#(
	//parameter size = 8;
//)
(
input [7:0] operandA,
input [7:0] operandB,
output [7:0] out_mul
);



assign out_mul=operandA*operandB;

endmodule
