import module_2_parameter::par; // Подключение файла с параметром

module module_2 
(
	// Данные задания 2.2
	input wire a,
	input wire b,
	output wire c,
	
	// Данные задания 2.3
	input clk,
	input d,
	output exit,
	
	//Данные задания 2.4
	input [par:0]A,
	input [par:0]B,
	input [par:0]C,
	output [par*2+1:0]out  
);
// Задание 2.2
assign c = b*a;
	
// Задание 2.3
always@(posedge clk) // по переднему фронту clk
begin
exit <=d;
end
	
// Задание 2.4
// Создание регистров A1,B1,C1,C2	
reg [par:0]A1;
reg [par:0]B1;
reg [par:0]C1;
reg [par:0]C2;

// Создание промежуточного регистра R для хранения результатов умножения
reg [par*2+1:0]R;

// Создание регистра out_1 для хранения окончательных вычислений
reg [par*2+1:0]out_1;

always@(posedge clk)
begin
	C1<=C; // Запись С в регистр C1, и затем в С2 по clk 
	C2<=C1;
	A1<=A; // Запись A в регистр A1 по clk
	B1<=B; // Запись B в регистр B1 по clk
	
	// Запись результатов умножения в R
	R<=A1*B1;
	// Запись окончательных результатов вычисления в out_1
	out_1 <= R+C2;	
end	

assign out = out_1;

endmodule 