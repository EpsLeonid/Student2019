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
	output [par:0] C1,
	output [par:0] C2,
	output reg [par*2+1:0] DATA_OUT, //определение "правильной" ширины шины
	output reg [par*2+1:0] R
	
);  
  
//выполнение задания 2.2
	assign c = a*b;
  
//выполнение задания 2.3
	always @(posedge clk) //работа по переднему фронту clk
	begin
	out <=d;
	end
	
//выполнение задания 2.4
	
	//смещение С по clk
	always @(posedge clk) 
	begin
	C1 <=C;
	end
	
	//смещение С1 по clk
	always @(posedge clk) 
	begin
	C2 <=C1;
	end
	
	//выполнение умножения
	always @(posedge clk)     
	begin
	R <= A*B;
	end
	
//выполнение сложения 
	always @(posedge clk)     
	begin
	DATA_OUT <= R+C2;	
	end

endmodule //конец работы модуля


  