import par_parameter::par; // подключение файла с параметрами

module exe22 // модуль дл€ описани€ функций и переменных задани€ 2
(
	// параметры дл€ задани€ 2.2
	input wire a,
	input wire b,
	
	output wire c,
	
	// параметры дл€ задани€ 2.3
	input clk,
	input d,
	
	output exit,
	
	//параметры дл€ задани€ 2.4
	input [par:0]A,
	input [par:0]B,
	input [par:0]C,
	
	output [par*2+1:0]out  
);
	// выполнение задани€ 2.2
	assign c = b*a;
	
	// выполнение задани€ 2.3
	always@(posedge clk) // работа по переднему фронту clk
	begin
	exit <=d;
	end
	
	// выполнение задани€ 2.4
//создание регистров A1,B1,C1,C2	
reg [par:0]A1;
reg [par:0]B1;
reg [par:0]C1;
reg [par:0]C2;

//создание регистра R дл€ хранени€ результата умножени€
reg [par*2+1:0]R;

// создание регистра out_data дл€ хранени€ результата сложени€
reg [par*2+1:0]out_data;

always@(posedge clk)
begin
	C1<=C; //запись — в reg C1, затем в —2 по clk 
	C2<=C1;
	A1<=A; //запись ј в reg A1 по clk
	B1<=B; // запись B в reg B1 по clk
	
	// запись результата умножени€ в R
	R<=A1*B1;
	// запись результата сложени€ в out_data
	out_data <= R+C2;	
end	

assign out = out_data;

endmodule // конец работы модул€