//Параметризация по заданию 5.
import q2par::Width; 

module q2 (

//Входные сигналы для задания 2.
input A, 
input B,

//Входные сигналы для задания 3.
input wire clk, 
input wire d,

//Входные сигналы для задания 4.
input wire [Width-1:0] A4, 
input wire [Width-1:0] B4, 
input wire [Width-1:0] C4,

//Выходной сигнал для задания 2.
output C,

//Выходной сигнал для задания 3.
 output wire out,

//Выходной сигнал для задания 4.
output reg [2*Width-1:0] DATA_OUT

);



//Произведение двух входных сигналов и вывод результата в сигнал С
assign  C = A * B; //Непрерывное присваивание сигналу С результата произведения А и В

//D-триггер. Сигнал clk - управляющий, d - входной сигнал, out - выходной сигнал с триггера.
always_ff @(posedge clk) begin //Выполнение команды всегда при появлении сигнала clk
	out <= d; //Изменяем значение, хранящееся в триггере
end

//Модуль с  8-ми разрядным регистром и работающем на частоте 200 МГц
reg [Width-1:0] DELAY; //Регистр для создания задержки
reg [2*Width-1:0] MULT; //"Промежуточный" регистр для хранения значения произведения А4 и B4

always @(posedge clk) begin
	DELAY = C4; //Задержка
end

always_ff @(posedge clk) 
	MULT <= A4 * B4; //DATA_OUT = A4 * B4

always_ff @(posedge clk) 
	DATA_OUT <= MULT + DELAY; //DATA_OUT = (A4 * B4) + C4

endmodule