module d_trigger
(
	input clk,	// входной clock
	input d,	// d вход триггера
	output out // выход триггера
);

// по переднему фронту clk передается входной сигнал d на выход out
always_ff @(posedge clk)
	out <= d;
endmodule