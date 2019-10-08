module regist //модуль, описывающий 8-разр€дный регистр и выполн€ющий операцию DATA_OUT=A*B+C 
(
//¬ходные шина данных
	input [7:0] A,
	input [7:0] B,
	input [7:0] C,
	input clock,
//¬ыходна€ шина данных
	output [15:0] DATA_OUT
);
reg [7:0] regMul ;
reg [7:0] regAdd;
reg [7:0] regC;
reg [7:0] regA;
reg [7:0] regB;
reg [7:0] regC1;//дл€ задержки

always @( posedge clock ) //всегда когда приходит передний фронт clock выполн€етс€ эта операци€
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