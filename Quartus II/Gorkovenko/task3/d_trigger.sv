module d_trigger
(
	input clk,	// вхлдной clock
	input d,	// d вход триггера
	output out // выход D-триггера
);

// по переднему фронту clk передать входной сигнал d на выход out
always_ff @(posedge clk)
	out <= d;
endmodule