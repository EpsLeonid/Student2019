import argum::*;

module regist //модуль, описывающий 8-разр€дный регистр и выполн€ющий операцию DATA_OUT=A*B+C 
(
//¬ходные шина данных
	input [size-1:0] A,
	input [size-1:0] B,
	input [size-1:0] C,
	input clock,
//¬ыходна€ шина данных
	output [DATA_OUT_size-1:0] DATA_OUT,
//¬ыходные шины дл€ проверки промежуточных результатов
	output [DATA_OUT_size-1:0] check1,
	output [DATA_OUT_size-1:0] check2
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
always @(posedge clock) 
	regAdd<=regMul+regC1;
	
assign DATA_OUT=regAdd;
assign check1=regMul;
assign check2=regAdd;

endmodule