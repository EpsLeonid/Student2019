module ABC 
(
// Входные шины данных
	input [7 : 0] A,
	input [7 : 0] B,
	input [7 : 0] C,

	input clk,
// Выходные шины использующиеся для откладки
	output [7 : 0] test1,
	output [7 : 0] test2,
	output [7 : 0] test3,
	output [7 : 0] test4,
	output [7 : 0] test5,
	output [7 : 0] test6,

// Выходная шина данных
	output [7 : 0] DATA_OUT
);

// регистры для защелкивания данных
logic [7 : 0]	reg_A,
				reg_B,
				reg_C,
				reg_C1; // для задержки

logic [7 : 0]	reg_AB;		// для хранения операции A*B
logic [7 : 0]	reg_ABC;	// для хранения операции AB+C

// защелкивание данных
always_ff @( posedge clk )
begin
	reg_A <= A;
	reg_B <= B;
	reg_C <= C;
	reg_C1 <= reg_C;
end

// умножение 
always_ff @( posedge clk )
	reg_AB <= reg_A*reg_B;
// сложение
always_ff @( posedge clk )
	reg_ABC <= reg_AB + reg_C1;

assign DATA_OUT = reg_ABC;

assign test1 = reg_A;
assign test2 = reg_B;
assign test3 = reg_C;
assign test4 = reg_C1;
assign test5 = reg_AB;
assign test6 = reg_ABC;

endmodule