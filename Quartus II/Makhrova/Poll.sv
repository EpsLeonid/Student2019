
import Pollparametr::Const;// параметры для 5-го


module Poll(

//задание 2
input a, input b, output c, // входные данные задание 2

// задание 3
input wire clk, input wire d, output wire out,

//задание 4
input wire [(Const-1):0] A, // входные данные для задания 4
input wire [(Const-1):0] B, 
input wire [(Const-1):0] C,
output reg [(2*Const-1):0] DATA_OUT); // выходные данные для задания 4

//записываем регистры
reg [(Const-1):0] reg_C;
// создаём регистры для сумматора и умножителя с шириной, равной ширине выходных шин 
reg [(2*Const-1):0] DATA_MULT;
reg [(Const-1):0] DATA_ADD;
reg [(2*Const-1):0] reg_DATA_OUT;

//ф-ция для 2-го
assign  c = a * b; // произведение 

// Модуляция для 3-го 
always_ff @(posedge clk) begin //ф-ци выполняеться при каждом clk
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

//сумматор	
always_ff @(posedge clk)
	reg_DATA_OUT<=DATA_MULT+DATA_ADD;
	
always @(posedge clk)
	DATA_OUT=reg_DATA_OUT;	

endmodule