
import Pollparametr::Const;// параметры дл€ 5-го


module Poll(

//задание 2
input a, input b, output c, // входные данные задание 2

// задание 3
input wire clk, input wire d, output wire out,

//задание 4
input wire [(Const-1):0] A, // входные данные дл€ задани€ 4
input wire [(Const-1):0] B, 
input wire [(Const-1):0] C,
output reg [(2*Const-1):0] DATA_OUT); // выходные данные дл€ задани€ 4

//записываем регистры
reg [(2*Const-1):0] reg_C;
// создаЄм регистры дл€ сумматора и умножител€ с шириной, равной ширине выходных шин 
reg [(2*Const-1):0] DATA_MULT;
reg [(2*Const-1):0] DATA_MULT_2;
reg [(2*Const-1):0] DATA_ADD;


//ф-ци€ дл€ 2-го
assign  c = a * b; // произведение 

// ћодул€ци€ дл€ 3-го 
always_ff @(posedge clk) begin //ф-ци выполн€етьс€ при каждом clk
	out <= d;
end

always_ff @(posedge clk)
begin
	
	reg_C<=C;//присваевание reg
	DATA_ADD<=reg_C;	
end
//умножитель 
always_ff @(posedge clk)
begin
	DATA_MULT<= A*B;
end
// задежка дл€ умножител€
always_ff @(posedge clk)
begin
	DATA_MULT_2<= DATA_MULT;
end


//сумматор	
always_ff @(posedge clk)
	DATA_OUT<=DATA_MULT_2+DATA_ADD;
		

endmodule