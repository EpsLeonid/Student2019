import par_parameter::par; // подключение файла par с параметрами 

module exe2  //модуль для описания функий и переменных задания 2

(

//параметры для задания 2.2
 	input wire  a,
	input wire b,
	output wire c,
  
//параметры для задания 2.3 
	input clk,
	input d,
	output reg out,
  
//параметры для задания 2.4, заданные через файл с параметрами par
	input [par:0] A,
	input [par:0] B,
	input [par:0] C,
	output reg [par*2+1:0] DATA_OUT //определение "правильной" ширины шины
	
);  
  
//выполнение задания 2.2
	assign c = a*b;
  
//выполнение задания 2.3
	always @(posedge clk) //работа по переднему фронту clk
	begin
	out <=d;
	end
	
//выполнение задание 2.4
	always @(posedge clk)
	begin
	DATA_OUT <= A*B+C;
	
end

endmodule //конец работы модуля
  
  