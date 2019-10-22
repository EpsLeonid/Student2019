//Параметры для 5.
import testparametr::Width;

module test (

//Сигналы для 2.
input a, input b, output c,

//Сигналы для 3.
input wire clk, input wire d, output wire out,

//Сигналы для 4.
input wire [(Width-1):0] A4, 
input wire [(Width-1):0] B4, 
input wire [(Width-1):0] C4,
output wire [(2*Width-1):0] DATA_OUT

);

//Произведение двух входных сигналов и вывод результата в сигнал С
assign  c = a * b; //Непрерывное присваивание сигналу С результата произведения А и В

//D-триггер. Сигнал clk - управляющий, d - входной сигнал, out - выходной сигнал с триггера.
always_ff @(posedge clk) begin //Выполнение команды всегда при появлении сигнала clk
	out <= d; //Изменяем значение, хранящееся в триггере
end

//Модуль с  8-ми разрядным регистром и работающем на частоте 200 МГц
reg [(2*Width-1):0] forSummation; //Создаём регистры с шириной, равной ширине выходной шины
reg [(2*Width-1):0] forMultiplication;
assign forMultiplication = A4 * B4; //DATA_OUT = A4 * B4 + C4
assign forSummation = C4;
assign DATA_OUT = forMultiplication + forSummation;

endmodule