import argum::*;

module regist //модуль, описывающий 8-разр€дный регистр и выполн€ющий операцию DATA_OUT=A*B+C 
(
//¬ходные шина данных
	input [size-1:0] A,
	input [size-1:0] B,
	input [size-1:0] C,
	input clock,
//¬ыходна€ шина данных
	output [DATA_OUT_size-1:0] DATA_OUT
);
reg [DATA_OUT_size-1:0] regMul ;
reg [DATA_OUT_size-1:0] regAdd;
reg [size-1:0] regC;
reg [size-1:0] regA;
reg [size-1:0] regB;
reg [size-1:0] regC1;//дл€ задержки

always @( posedge clock ) //всегда, когда приходит передний фронт clock выполн€етс€ эта операци€
begin
	regA<=A;
	regB<=B;
	regC<=C;
	regC1<=regC;
end

//умножение
always @(posedge clock)
	regMul<=regA*regB;
	
//сложение
always @(posedge clock) begin
	regAdd<=regMul+regC1;
	end
assign DATA_OUT=regAdd;

endmodule