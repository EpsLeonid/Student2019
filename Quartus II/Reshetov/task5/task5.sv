import parameters::*;
module task5
(
	//тактовый сигнал
	input clk,
	//входные регистры
	input[sizeOfReg - 1:0] a,
	input[sizeOfReg - 1:0] b,
	input[sizeOfReg - 1:0] c,
	//регистр выходных данных
	output[sizeOfReg*2 - 1:0] out
);
//выполнение по переднему фронту клока
always@(posedge clk)
	begin
	out = a * b + c;
	end
endmodule
