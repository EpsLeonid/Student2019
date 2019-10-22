//Параметры для 5.
import testparametr::Const;

module test(

//Сигналы для 2.
input a, input b, output c,

//Сигналы для 3.
input wire clk, input wire d, output wire out,

//Сигналы для 4.
input wire [(Const-1):0] A, 
input wire [(Const-1):0] B, 
input wire [(Const-1):0] C,
output reg [(2*Const-1):0] DATA_OUT);


reg [(Const-1):0] reg_A;
reg [(Const-1):0] reg_B;//записывающие регистры
reg [(Const-1):0] reg_C;

reg [(2*Const-1):0] DATA_MULT;//Создаём регистры с шириной, равной ширине выходной шины
reg [(Const-1):0] DATA_ADD;
reg [(2*Const-1):0] reg_DATA_OUT;

//Функция для 2
assign  c = a * b;

//Условия для 3
always_ff @(posedge clk) begin //Команда выполняется при каждом срабатывания clk
	out <= d; //Изменяем значение, хранящееся в триггере
end

//Модуль для 4 (DATA_OUT[7..0] <= A[7..0]*B[7..0]+C[7..0])
always_ff @(posedge clk)
begin
	reg_A<=A;
	reg_B<=B;
	reg_C<=C;
	DATA_ADD<=reg_C;	
end
//умножитель
always_ff @(posedge clk)
begin
	DATA_MULT<= reg_A*reg_B;
end

//сумматор	
always_ff @(posedge clk)
	reg_DATA_OUT<=DATA_MULT+DATA_ADD;
	
always @(posedge clk)
	DATA_OUT=reg_DATA_OUT;	

endmodule