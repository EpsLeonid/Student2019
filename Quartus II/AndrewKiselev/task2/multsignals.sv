module multSignals(
	input [7:0] signal_1,
	input [7:0] signal_2,
	output [7:0] mult
);
	assign mult=signal_1*signal_2;
endmodule
